-- @ CordeliusVox Inter View Internal Functions Module | Version 1.0
--!strict

local InternalFunctions = {}

local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart") :: BasePart

local TweenService = game:GetService("TweenService")
local ActiveHighlights = {}

-- A function to calculate Axis Aligned Bounding Box
function InternalFunctions.CalculationAABB(Object: Instance, HumanoidRootPart: BasePart, Settings: any): (Vector3, number, number, boolean)
	local ObjectPosition: Vector3

	-- Checking for a valid position.
	if Object:IsA("Model") then
		local PrimaryPart = Object.PrimaryPart

		if not PrimaryPart then
			warn("Inter View Error: No primary part found in " .. Object.Name)
			return Vector3.zero, 0, math.huge, false
		end

		ObjectPosition = PrimaryPart.Position
	else
		ObjectPosition = (Object :: BasePart).Position
	end

	local Distance = (ObjectPosition - HumanoidRootPart.Position).Magnitude

	if Distance > Settings.General.MaxDistance then
		return Vector3.zero, 0, Distance, false
	end

	local Factor = math.clamp((Settings.General.MaxDistance - Distance) / (Settings.General.MaxDistance - Settings.General.MinDistance), 0, 1)
	local ScreenPosition, OnScreen = workspace.CurrentCamera:WorldToViewportPoint(ObjectPosition)

	return ScreenPosition, Factor, Distance, OnScreen
end

function InternalFunctions.Apply(Object: Instance, Category: string, Settings: any, ActiveHighlights: {[Instance]: Highlight})
	local ScreenPosition, Factor, Distance, OnScreen = InternalFunctions.CalculationAABB(Object, HumanoidRootPart, Settings)

	if not OnScreen or Distance >= Settings.General.MaxDistance then
		local Highlight = ActiveHighlights[Object]

		if Highlight then
			local Tween = TweenService:Create(Highlight, TweenInfo.new(0.3), {OutlineTransparency = 1})
			Tween:Play()
			Tween.Completed:Connect(function() 
				Highlight:Destroy() 
			end)

			ActiveHighlights[Object] = nil
		end
		return
	end

	local Highlight = Object:FindFirstChildOfClass("Highlight") or Instance.new("Highlight")
	Highlight.FillTransparency = 1
	Highlight.OutlineTransparency = 1 - Factor
	Highlight.OutlineColor = Settings.Highlight.Categories[Category] 
		or Settings.Highlight.DefaultColor

	Highlight.Parent = Object
	ActiveHighlights[Object] = Highlight
end

function InternalFunctions.TweenFade(Highlight: Highlight)
	local Tween = TweenService:Create(Highlight, TweenInfo.new(0.3), {OutlineTransparency = 1})
	Tween:Play()
	Tween.Completed:Once(function()
		Highlight:Destroy()
	end)
end

function InternalFunctions.Clear(Object: Instance, ActiveHighlights: {[Instance]: Highlight})
	local Highlight = ActiveHighlights[Object]

	if Highlight then
		InternalFunctions.TweenFade(Highlight)
		ActiveHighlights[Object] = nil
	end
end

function InternalFunctions.ClearAll(ActiveHighlights: {[Instance]: Highlight})
	for Object in pairs(ActiveHighlights) do
		InternalFunctions.Clear(Object, ActiveHighlights)
	end
end

function InternalFunctions.Process(Settings: any, ActiveHighlights: {[Instance]: Highlight})
	for _, Object in ipairs(Settings.General.ObjectsFolder:GetChildren()) do
		local Category = Object:GetAttribute(Settings.Highlight.AttributeName)

		if Category then
			if not ActiveHighlights[Object] then
				InternalFunctions.Apply(Object, Category, Settings, ActiveHighlights)
			end
		else
			if ActiveHighlights[Object] then
				InternalFunctions.Clear(Object, ActiveHighlights)
			end
		end
	end
end

return InternalFunctions
