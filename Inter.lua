-- @ CordeliusVox Inter View module.

--[[ 

Hello! This module is used to apply a highlighting system to objects based on their distance from the player and certain tags/categories. 
It supports multiple categories like "Enemy" and "Neutral" that apply different colors to objects depending on the player's proximity.

### How To Use:

1. Require the module in a LocalScript:

   local InterView = require(game.ReplicatedStorage._Inter)
   InterView.Toggle()
   
]]--

--// Main
local Inter = {}

local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local BlurEffect = Lighting:FindFirstChildOfClass("BlurEffect") or Instance.new("BlurEffect")
local Sound = script.Extra.Activation

local Camera = workspace.CurrentCamera

local Active_Highlights = {}
local Enabled = false
local CanToggle = true
local IsPaused = false

local PreviousWalkSpeed
local PreviousJumpHeight

local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local PlayerGui = Player.PlayerGui
local Previous_CameraPosition = Camera.CFrame.Position
local Previous_HumanoidRootPartPosition = HumanoidRootPart and HumanoidRootPart.Position or Vector3.new(0, 0, 0)

--// Settings -----------------------------------------------------------------------------------------------------------------------

local Cooldown = 0.5 -- Cooldown between activating and disabling the Inter.

local MaxDistance = 150 -- Maximum distance for the Inter to work. (Fades out)
local MinDistance = 10 -- Minimum distance for the Inter to work. (Fully Faded)

local Enabled_WalkSpeed = 16 -- Player's WalkSpeed when Inter is enabled.
local Enabled_JumpHeight= 7.2 -- Player's JumpHeight when Inter is enabled.

local Attribute_Name = "Object" -- The name of the Attribute the object has. (Object must have an attribute with this name and a value of the catergories bellow!)

local HighlightCategories = { -- Colors for each highlight category
	["Neutral"] = Color3.fromRGB(225, 225, 225),
	["Enemy"] = Color3.fromRGB(225, 0, 0),
	["Cash"] = Color3.fromRGB(225, 225, 0),
	["Cop"] = Color3.fromRGB(0, 0, 225)

--[[ To add more categories, Copy this line:

["NAME"] = Color3.fromRGB(COLOR)

- NAME: The value of the attribute (string)
- COLOR: The color of the outline / highlight (RGB)

]]--
}

-------------------------------------------------------------------------------------------------------------------------------------

local function CalculateAABB(Object)
	local ObjectPosition

	if Object:IsA("Model") then
		ObjectPosition = Object.PrimaryPart and Object.PrimaryPart.Position
	else
		ObjectPosition = Object.Position
	end

	local Distance = (ObjectPosition - HumanoidRootPart.Position).Magnitude
	local Factor = math.clamp((MaxDistance - Distance) / (MaxDistance - MinDistance), 0, 1)
	local ScreenPosition, OnScreen = Camera:WorldToViewportPoint(ObjectPosition)

	return ScreenPosition, Factor, Distance, OnScreen
end

local function Apply(Object, Category)
	local ScreenPosition, Factor, Distance, OnScreen = CalculateAABB(Object)

	if OnScreen and Distance < MaxDistance then
		local Highlight = Object:FindFirstChildOfClass("Highlight") or Instance.new("Highlight")

		Highlight.FillTransparency = 1
		Highlight.OutlineColor = HighlightCategories[Category] or Color3.fromRGB(255, 255, 255) -- Default to white.
		Highlight.OutlineTransparency = 1 - Factor
		Highlight.Parent = Object

		Active_Highlights[Object] = Highlight
	else
		local Highlight = Active_Highlights[Object]

		if Highlight then
			local Tween = TweenService:Create(Highlight, TweenInfo.new(0.3), {OutlineTransparency = 1})
			Tween:Play()

			Tween.Completed:Connect(function()
				Highlight:Destroy()
			end)

			Active_Highlights[Object] = nil
		end
	end
end

local function Clear()
	for Object, Highlight in pairs(Active_Highlights) do
		if Highlight then
			local Tween = TweenService:Create(Highlight, TweenInfo.new(0.3), {OutlineTransparency = 1})
			Tween:Play()

			Tween.Completed:Connect(function()
				Highlight:Destroy()
			end)
		end
	end

	Active_Highlights = {}
end

local function Process()
	for _, Object in ipairs(workspace.Objects:GetChildren()) do
		if Object:GetAttribute(Attribute_Name) then
			local Category = Object:GetAttribute(Attribute_Name) or "Neutral" -- Default to neutral if no category
			Apply(Object, Category)
		end
	end
end

function Inter:Toggle(): ()
	if not CanToggle then 
		return 
	end

	Enabled = not Enabled
	CanToggle = false

	if Enabled then
		PreviousWalkSpeed = Humanoid.WalkSpeed
		PreviousJumpHeight = Humanoid.JumpHeight
		
		Sound:Play()

		Humanoid.WalkSpeed = Enabled_WalkSpeed or 16
		Humanoid.JumpHeight = Enabled_JumpHeight or 0
	else
		Humanoid.WalkSpeed = PreviousWalkSpeed
		Humanoid.JumpHeight = PreviousJumpHeight

		PreviousWalkSpeed = nil
		PreviousJumpHeight = nil
	end

	task.delay(Cooldown, function()
		CanToggle = true
	end)

	local Background = PlayerGui:WaitForChild("Inter"):WaitForChild("Background")
	local TileConnection

	if Enabled then
		local BlurTween_Enable = TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 3})
		local BackgroundTween_Enable = TweenService:Create(Background, TweenInfo.new(0.3), {ImageTransparency = 0.6})

		if not Background then
			warn("No background object found")
			return
		end

		BlurTween_Enable:Play()
		BackgroundTween_Enable:Play()

		TileConnection = RunService.Heartbeat:Connect(function()
			Background.TileSize = UDim2.new(math.random(400, 600) / 1000, 0, math.random(400, 600) / 1000, 0)
		end)

		Process()
	else
		local BlurTween_Disable = TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 0})
		local BackgroundTween_Disable = TweenService:Create(Background, TweenInfo.new(0.3), {ImageTransparency = 1})

		if not Background then
			warn("No background object found")
			return
		end

		BlurTween_Disable:Play()
		BackgroundTween_Disable:Play()

		if TileConnection then
			TileConnection:Disconnect()
			TileConnection = nil
		end

		Clear()
	end
end

function Inter:ChangeMaxDistance(NewMaxDistance: number): ()
	if NewMaxDistance ~= MaxDistance then
		MaxDistance = NewMaxDistance
		warn("MaxDistance updated to: " .. NewMaxDistance)
	else
		warn("NewDistance is the same as MaxDistance")
	end
end

function Inter:ChangeMinDistance(NewMinDistance: number): ()
	if NewMinDistance ~= MinDistance then
		MinDistance = NewMinDistance
		warn("MaxDistance updated to: " .. NewMinDistance)
	else
		warn("NewDistance is the same as MaxDistance")
	end
end

function Inter:SetHighlightColor(Category, Color): ()
	HighlightCategories[Category] = Color
	warn("Highlight color for category '" .. Category .. "' updated.")
end

function Inter:Pause(): ()
	if not Enabled then 
		return 
	end
	
	IsPaused = true
	warn("Highlighting system paused.")
end

function Inter:Resume(): ()
	if IsPaused then
		IsPaused = false
		Process()
		warn("Highlighting system resumed.")
	end
end

function Inter:IsEnabled(): (boolean)
	return Enabled
end

function Inter:MonitorPlayer(): ()
	RunService.RenderStepped:Connect(function()
		if not HumanoidRootPart then
			HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			if not HumanoidRootPart then
				return
			end
		end

		local Current_CameraPosition = Camera.CFrame.Position
		local Current_HumanoidRootPartPosition = HumanoidRootPart.Position

		if Previous_CameraPosition and Current_CameraPosition and (Current_CameraPosition - Previous_CameraPosition).Magnitude > 0 and Enabled then
			Process()
		end

		if Previous_HumanoidRootPartPosition and Current_HumanoidRootPartPosition and (Current_HumanoidRootPartPosition - Previous_HumanoidRootPartPosition).Magnitude > 0 and Enabled then
			Inter:Toggle()
		end

		Previous_CameraPosition = Current_CameraPosition
		Previous_HumanoidRootPartPosition = Current_HumanoidRootPartPosition
	end)
end

return Inter
