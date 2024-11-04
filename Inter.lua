-- @ CordeliusVox Inter View module | Version 1.3 | 2/11/2024
--!strict

local Inter = {}
Inter.__index = Inter

local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local BlurEffect = Lighting:FindFirstChildOfClass("BlurEffect") or Instance.new("BlurEffect")
local Sound = script.Internal.Sounds.Activation
local Settings = require(script["Settings.lua"])
local InternalFunctions = require(script.Internal["Functions.lua"])

local Camera = workspace.CurrentCamera
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid") :: Humanoid
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart") :: BasePart
local PlayerGui = Player:WaitForChild("PlayerGui")

local ActiveHighlights: {[Instance]: Highlight} = {}
local Enabled = false
local CanToggle = true

local PreviousWalkSpeed = Humanoid.WalkSpeed
local PreviousJumpHeight = Humanoid.JumpHeight

local PreviousCameraPosition = Camera.CFrame.Position
local PreviousHumanoidRootPartPosition = HumanoidRootPart.Position

function Inter:Toggle()
	if not CanToggle then 
		return 
	end

	Enabled = not Enabled
	CanToggle = false

	task.delay(Settings.General.Cooldown, function()
		CanToggle = true
	end)

	local Background = PlayerGui:WaitForChild("Inter"):WaitForChild("Background")
	local Connection

	if Enabled then
		PreviousWalkSpeed = Humanoid.WalkSpeed
		PreviousJumpHeight = Humanoid.JumpHeight

		Humanoid.WalkSpeed = Settings.General.Walkspeed or 16
		Humanoid.JumpHeight = Settings.General.JumpHeight or 0

		local BlurTween = TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 3})
		local BackgroundTween = TweenService:Create(Background, TweenInfo.new(0.3), {ImageTransparency = 0.6})

		Sound:Play()
		BlurTween:Play()
		BackgroundTween:Play()

		Connection = RunService.Heartbeat:Connect(function()
			Background.TileSize = UDim2.new(math.random(400, 600) / 1000, 0, math.random(400, 600) / 1000, 0)
		end)

		InternalFunctions.Process(Settings, ActiveHighlights)
	else
		Humanoid.WalkSpeed = PreviousWalkSpeed or 16
		Humanoid.JumpHeight = PreviousJumpHeight or 0

		local BlurTween = TweenService:Create(BlurEffect, TweenInfo.new(0.3), {Size = 0})
		local BackgroundTween = TweenService:Create(Background, TweenInfo.new(0.3), {ImageTransparency = 1})

		BlurTween:Play()
		BackgroundTween:Play()

		if Connection then
			Connection:Disconnect()
		end

		InternalFunctions.ClearAll(ActiveHighlights)
	end
end

function Inter:MonitorPlayer()
	HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

	RunService.RenderStepped:Connect(function()
		local CurrentCameraPosition = Camera.CFrame.Position
		local CurrentHumanoidRootPartPosition = HumanoidRootPart.Position

		local CameraMoved = (CurrentCameraPosition - PreviousCameraPosition).Magnitude > 0
		local rootPartMoved = (CurrentHumanoidRootPartPosition - PreviousHumanoidRootPartPosition).Magnitude > 0

		if Enabled and (CameraMoved or rootPartMoved) then
			InternalFunctions.Process(Settings, ActiveHighlights)
		end

		PreviousCameraPosition = CurrentCameraPosition
		PreviousHumanoidRootPartPosition = CurrentHumanoidRootPartPosition
	end)
end

setmetatable(Inter, {
	__call = function(self)
		return self
	end
})

return Inter
