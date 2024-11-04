--!strict

--[[ @ CordeliusVox Inter View Settings.
    
    This module contains various customizable settings for the Inter View module.
    You can adjust values in each section, including cooldown timings, transparency and 
    blur effects, and device specific controls. This is structured for easy readability 
    and expandability, allowing developers to add or modify settings without any hassle.
    
]]-- Lastly updated: 2/11/2024

local Settings = {
	["General"] = { -- These settings control cooldown timings and range limits and more. 
		Cooldown = 1, -- Controls the cooldown time (in seconds) for specific actions.

		MaxDistance = 150, -- Maximum distance for the Inter effect to work (Past this number the highlight will be non existant, will be ignored if Transparency_Effect = true).
		MinDistance = 10, 
		
		ObjectsFolder = workspace.Objects, -- path to folder where all the objects are in.

		--[[ Optional ]]--
		CanJump = false, -- Can the player jump while Inter View is active.
		CanWalk = true, -- Can the player wakk while Inter View is active.
		
		Walkspeed = 16, -- Custom WalkSpeed while Inter View is active, can be set to nil to disable.
		JumpHeight = 7.2, -- Custom JumpHeight while Inter view is active, can be set to nil to disable
	},

	["Effect"] = { -- These settings control effects that can be turned off / on and adjusted. (Optional)
		Transparency_Effect = true, -- Enable/disable transparency effects on highlights (the further the play is the less transparent the highlight is).
		MaxTransparencyDistance = 150, -- Maximum distance for transparency effect activation (The further the player is from the highlight, the more transparent it is).
		MinTransparencyDistance = 150, -- Minimum distance for transparency effect (Every highlight that is close to the player will be fully visible (no tranparency)).
		
		BlurEffect = true, -- Enable/disable blur effect on screen while Inter View is active.
		BlurSize = 10, -- Determines the intensity of the blur effect.
	},

	["Highlight"] = { --  These settings define how objects will be highlighted based on categories.
		AttributeName = "Object", -- The name of the attribute on objects that determines their highlight category.
		
		DefaultColor = Color3.fromRGB(225, 225, 225), -- Default color of outline if no category is found.

		Categories = { -- Every highlight category, Contains their name and color.
			["Neutral"] = Color3.fromRGB(255, 255, 255), -- The highlight color of attribute value "Neutral".
			["Enemy"] = Color3.fromRGB(255, 0, 0), -- The highlight color of attribute value "Enemy".
			
			--[[ Explanation ]]--
			
			-- You can add / remove categories as you want, Just change these two values for your liking.
			
			--[[
				["NAME"] = Color3.fromRGB(COLOR)
				
				"NAME" : The value of the attribute value.
				"COLOR" : The color of the highlight in RGB format.
			]]--
		}
	},

	["Device"] = { -- Device specific control settings.
		PhoneButton = true, -- Whether to display a button for mobile users. (Mobile support)
		PhoneButtonPosition = UDim2.new(0.9, 0, 0.9, 0), -- Position of the phone button (UDim2) on screen.
		PhoneButtonSize = UDim2.new(0.1, 0, 0.1, 0), -- Size of the phone button (UDim2).
		PhoneButtonImage = nil, -- Image ID for the button, set to nil if not using an image.
		
		Pc_KeyBind = Enum.KeyCode.F, -- Keybind for PC interaction, set to nil if you want PC Disabled.
		Controller_Keybind = Enum.KeyCode.ButtonSelect, -- Keybind for Controller interaction, set to nil if you want Controller Disabled.
	}
}

return Settings
