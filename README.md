# Inter View Module

## Overview

The **Inter View Module** is designed to apply a highlighting system to objects in Roblox based on the player's distance and specific categories ("Enemy," "Neutral"). It allows for different highlight colors to be assigned based on proximity, enhancing object visibility in the game world.

This module is versatile and supports easy customization for various object categories.

This module was made by @CordeliusVox

## Features

- **Distance-Based Highlighting:** Objects will fade in and out depending on their proximity to the player.
- **Category Support:** You can assign different colors to objects based on custom categories such as "Enemy" or "Neutral."
- **Player Speed & Jump Modifications:** Automatically adjusts the player's movement when the highlight system is enabled.
- **Customization:** Easily modify distances, colors, and categories.

## How to Use

### 1. Set Up

To begin using the Inter View Module, you need to require it in a LocalScript:

```lua
local InterView = require(game.ReplicatedStorage._Inter)
InterView.Toggle()
```
### 2. Customize Categories

You can add or change categories by modifying the HighlightCategories table in the script:

```lua
local HighlightCategories = {
    ["Neutral"] = Color3.fromRGB(225, 225, 225),
    ["Enemy"] = Color3.fromRGB(225, 0, 0),
    ["Cash"] = Color3.fromRGB(225, 225, 0),
    ["Cop"] = Color3.fromRGB(0, 0, 225),

    -- Add more categories here!
}
```

### 3. Settings

You can easily adjust the behavior of the module through several settings:

- **Cooldown:** Cooldown between toggling the system on and off. Default is 0.5 seconds.
- **MaxDistance:** Maximum distance at which the highlight will be fully visible. Default is 150.
- **MinDistance:** Minimum distance where the highlight is fully faded. Default is 10.
- **Enabled_WalkSpeed and Enabled_JumpHeight:** The player's walk speed and jump height when the system is active.

### 4. NOTES!

- Ensure objects that need highlighting have an attribute with the name defined in the Attribute_Name setting (default: "Object"). The attribute value should match one of the defined categories ("Enemy", "Neutral").
- This module makes use of Roblox's CollectionService, TweenService, and RunService for smooth performance and visuals.







