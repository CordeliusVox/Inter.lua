Old eme sword client:
Name = LocalScript
Class = LocalScript
Path = ReplicatedStorage.Old Weapons.Scythe.LocalScript

JUMPIF			0		repeat
GETIMPORT		0			var0 = wait -- [REDUNDANT]
CALL			2			var0 = var0()
GETIMPORT		3			var2 = game -- [REDUNDANT]
GETTABLEKS		5			var1 = var2["Players"] -- [REDUNDANT]
GETTABLEKS		7			var0 = var1["LocalPlayer"] -- [REDUNDANT]
GETTABLEKS		8		until var0
GETIMPORT		1		var2 = game -- [REDUNDANT]
GETTABLEKS		3		var1 = var2["Players"] -- [REDUNDANT]
JUMPIF			5		repeat
GETTABLEKS		0			var0 = var1["LocalPlayer"]
GETIMPORT		2			var1 = wait -- [REDUNDANT]
CALL			4			var1 = var1()
GETTABLEKS		5			var1 = var0["Character"] -- [REDUNDANT]
GETTABLEKS		6		until var1
GETTABLEKS		6		var1 = var0["Character"]
LOADK			8		var4 = "Right Arm" -- [REDUNDANT]
NAMECALL		9		var2 = var1:WaitForChild(var4)
LOADK			11		var5 = "Humanoid"
NAMECALL		12		var3 = var1:WaitForChild(var5)
LOADK			14		var6 = "Animator"
NAMECALL		15		var4 = var3:WaitForChild(var6)
LOADNIL			17		var5 = nil
LOADNIL			18		var6 = nil
LOADB			19		var7 = true -- [REDUNDANT]
GETIMPORT		20		var10 = script -- [REDUNDANT]
GETTABLEKS		22		var9 = var10["Parent"] -- [REDUNDANT]
LOADK			24		var11 = "Cooldown"
NAMECALL		25		var9 = var9:WaitForChild(var11)
GETTABLEKS		27		var8 = var9["Value"] -- [REDUNDANT]
GETIMPORT		29		var9 = game -- [REDUNDANT]
LOADK			31		var11 = "RunService" -- [REDUNDANT]
NAMECALL		32		var9 = var9:GetService(var11)
GETIMPORT		34		var11 = script -- [REDUNDANT]
GETTABLEKS		36		var10 = var11["Parent"] -- [REDUNDANT]
LOADK			38		var12 = "DamageRemote" -- [REDUNDANT]
NAMECALL		39		var10 = var10:WaitForChild(var12)
GETIMPORT		41		var12 = script -- [REDUNDANT]
GETTABLEKS		43		var11 = var12["Parent"] -- [REDUNDANT]
LOADK			45		var13 = "Blade" -- [REDUNDANT]
NAMECALL		46		var11 = var11:WaitForChild(var13)
LOADK			48		var14 = "HitSound" -- [REDUNDANT]
NAMECALL		49		var12 = var11:WaitForChild(var14)
LOADK			51		var15 = "SwingSound" -- [REDUNDANT]
NAMECALL		52		var13 = var11:WaitForChild(var15)
DUPCLOSURE		54		upvalue[1_var11] = var11
DUPCLOSURE		55		upvalue[2_var10] = var10
DUPCLOSURE		56		upvalue[3_var12] = var12
DUPCLOSURE		57		upvalue[4_var9] = var9
DUPCLOSURE		58		local Damage = function() -- line: 20
LOADB			0			var0 = false
GETIMPORT		1			var1 = pairs -- [REDUNDANT]
GETUPVAL		3			var2 = upvalue[upvalue[1_var11]] -- [REDUNDANT]
NAMECALL		4			var2 = var2:GetChildren()
CALL			6			var1, var2, var3 = var1(var2)
FORGPREP_NEXT	7			for var4, var5 in var1, var2, var3 do
GETTABLEKS		0				var6 = var5["ClassName"] -- [REDUNDANT]
JUMPXEQKS		2				if var6 == "Attachment" then
NEWCLOSURE		0					upvalue[1_var5] = var5
NEWCLOSURE		1					upvalue[2_var0] = var0
NEWCLOSURE		2					upvalue[3_upvalue[2_var10]] = upvalue[2_var10]
NEWCLOSURE		3					upvalue[4_upvalue[3_var12]] = upvalue[3_var12]
NEWCLOSURE		4					upvalue[5_upvalue[4_var9]] = upvalue[4_var9]
NEWCLOSURE		5					local Cast = function() -- line: 24
GETUPVAL		0						var1 = upvalue[upvalue[1_var5]] -- [REDUNDANT]
GETTABLEKS		1						var0 = var1["WorldPosition"]
NEWTABLE		3						var1 = {}
GETIMPORT		5						var6 = script -- [REDUNDANT]
GETTABLEKS		7						var5 = var6["Parent"] -- [REDUNDANT]
GETTABLEKS		9						var4 = var5["Parent"]
MOVE			12						var3 = var1
GETIMPORT		13						var2 = table["insert"] -- [REDUNDANT]
CALL			15						var2 = var2(var3, var4) -- [REDUNDANT]
FORNPREP		19						for var4 = 1, 40, 1 do
GETIMPORT		0							var5 = Ray["new"] -- [REDUNDANT]
MOVE			2							var6 = var0 -- [REDUNDANT]
GETUPVAL		3							var9 = upvalue[upvalue[1_var5]] -- [REDUNDANT]
GETTABLEKS		4							var8 = var9["WorldPosition"] -- [REDUNDANT]
SUB				6							var7 = var8 - var0 -- [REDUNDANT]
CALL			7							var5 = var5(var6, var7) -- [REDUNDANT]
GETUPVAL		8							var6 = upvalue[upvalue[1_var5]] -- [REDUNDANT]
GETTABLEKS		9							var0 = var6["WorldPosition"]
GETIMPORT		11							var7 = game -- [REDUNDANT]
GETTABLEKS		13							var6 = var7["Workspace"] -- [REDUNDANT]
MOVE			15							var8 = var5 -- [REDUNDANT]
MOVE			16							var9 = var1 -- [REDUNDANT]
NAMECALL		17							var6, var7 = var6:FindPartOnRayWithIgnoreList(var8, var9)
JUMPIFNOT		19							if var6 then
GETTABLEKS		0								var8 = var6["Parent"] -- [REDUNDANT]
LOADK			2								var10 = "Humanoid" -- [REDUNDANT]
NAMECALL		3								var8 = var8:FindFirstChild(var10)
JUMPIFNOT		5								if var8 then
GETTABLEKS		0									var8 = var6["Parent"] -- [REDUNDANT]
GETIMPORT		2									var11 = script -- [REDUNDANT]
GETTABLEKS		4									var10 = var11["Parent"] -- [REDUNDANT]
GETTABLEKS		6									var9 = var10["Parent"]
JUMPIFEQ		8									if var8 ~= var9 then
GETUPVAL		0										var8 = upvalue[upvalue[2_var0]]
JUMPXEQKB		1										if var8 == false then
LOADB			0											var8 = true -- [REDUNDANT]
SETUPVAL		1											upvalue[upvalue[2_var0]] = var8
GETUPVAL		2											var8 = upvalue[upvalue[3_upvalue[2_var10]]] -- [REDUNDANT]
GETTABLEKS		3											var11 = var6["Parent"] -- [REDUNDANT]
GETTABLEKS		5											var10 = var11["Humanoid"] -- [REDUNDANT]
NAMECALL		7											var8 = var8:FireServer(var10)
GETUPVAL		9											var8 = upvalue[upvalue[4_upvalue[3_var12]]] -- [REDUNDANT]
NAMECALL		10											var8 = var8:Play()
NAMECALL		11										end
JUMPXEQKB		2									end
JUMPIFEQ		9								end
JUMPIFEQ		9							end
GETUPVAL		20							var9 = upvalue[upvalue[5_upvalue[4_var9]]] -- [REDUNDANT]
GETTABLEKS		21							var8 = var9["RenderStepped"] -- [REDUNDANT]
NAMECALL		23							var8 = var8:Wait()
NAMECALL		24						end
RETURN			20						return 
RETURN			20					end
GETIMPORT		6					var7 = spawn -- [REDUNDANT]
MOVE			8					var8 = Cast -- [REDUNDANT]
CALL			9					var7 = var7(var8)
CALL			9				end
JUMPXEQKS		3			end
RETURN			9			return 
RETURN			9		end
GETIMPORT		59		var17 = script -- [REDUNDANT]
GETTABLEKS		61		var16 = var17["Parent"] -- [REDUNDANT]
GETTABLEKS		63		var15 = var16["Equipped"] -- [REDUNDANT]
NEWCLOSURE		65		upvalue[1_var2] = var2
NEWCLOSURE		66		upvalue[2_var5] = var5
NEWCLOSURE		67		upvalue[3_var4] = var4
NEWCLOSURE		68		upvalue[4_var6] = var6
NEWCLOSURE		69		var17 = function() -- line: 51
GETUPVAL		0			var0 = upvalue[upvalue[1_var2]] -- [REDUNDANT]
LOADK			1			var2 = "ToolMotor6D" -- [REDUNDANT]
NAMECALL		2			var0 = var0:WaitForChild(var2)
GETUPVAL		4			var1 = upvalue[upvalue[3_var4]] -- [REDUNDANT]
GETIMPORT		5			var4 = script -- [REDUNDANT]
GETTABLEKS		7			var3 = var4["Parent"] -- [REDUNDANT]
LOADK			9			var5 = "Idle"
NAMECALL		10			var3 = var3:WaitForChild(var5)
NAMECALL		12			var1 = var1:LoadAnimation(var3)
SETUPVAL		14			upvalue[upvalue[2_var5]] = var1
GETUPVAL		15			var1 = upvalue[upvalue[3_var4]] -- [REDUNDANT]
GETIMPORT		16			var4 = script -- [REDUNDANT]
GETTABLEKS		18			var3 = var4["Parent"] -- [REDUNDANT]
LOADK			20			var5 = "Attack" -- [REDUNDANT]
NAMECALL		21			var3 = var3:WaitForChild(var5)
NAMECALL		23			var1 = var1:LoadAnimation(var3)
SETUPVAL		25			upvalue[upvalue[4_var6]] = var1
GETUPVAL		26			var1 = upvalue[upvalue[2_var5]] -- [REDUNDANT]
NAMECALL		27			var1 = var1:Play()
RETURN			29			return 
RETURN			29		end
NAMECALL		70		var15 = var15:Connect(var17)
GETIMPORT		72		var17 = script -- [REDUNDANT]
GETTABLEKS		74		var16 = var17["Parent"] -- [REDUNDANT]
GETTABLEKS		76		var15 = var16["Unequipped"] -- [REDUNDANT]
NEWCLOSURE		78		upvalue[1_var5] = var5
NEWCLOSURE		79		var17 = function() -- line: 58
GETUPVAL		0			var0 = upvalue[upvalue[1_var5]] -- [REDUNDANT]
NAMECALL		1			var0 = var0:Stop()
RETURN			3			return 
RETURN			3		end
NAMECALL		80		var15 = var15:Connect(var17)
GETIMPORT		82		var17 = script -- [REDUNDANT]
GETTABLEKS		84		var16 = var17["Parent"] -- [REDUNDANT]
GETTABLEKS		86		var15 = var16["Activated"] -- [REDUNDANT]
NEWCLOSURE		88		upvalue[1_var3] = var3
NEWCLOSURE		89		upvalue[2_var7] = var7
NEWCLOSURE		90		upvalue[3_var13] = var13
NEWCLOSURE		91		upvalue[4_var6] = var6
NEWCLOSURE		92		upvalue[5_Damage] = Damage
NEWCLOSURE		93		upvalue[6_var8] = var8
NEWCLOSURE		94		var17 = function() -- line: 61
GETUPVAL		0			var1 = upvalue[upvalue[1_var3]]
GETTABLEKS		1			var0 = var1["Health"]
LOADN			3			var1 = 0 -- [REDUNDANT]
JUMPIFNOTLT		4			if var1 < var0 then
GETUPVAL		0				var0 = upvalue[upvalue[2_var7]]
JUMPXEQKB		1				if var0 == true then
LOADB			0					var0 = false -- [REDUNDANT]
SETUPVAL		1					upvalue[upvalue[2_var7]] = var0
GETUPVAL		2					var0 = upvalue[upvalue[3_var13]] -- [REDUNDANT]
NAMECALL		3					var0 = var0:Play()
GETUPVAL		5					var0 = upvalue[upvalue[4_var6]] -- [REDUNDANT]
NAMECALL		6					var0 = var0:Play()
GETIMPORT		8					var0 = spawn -- [REDUNDANT]
GETUPVAL		10					var1 = upvalue[upvalue[5_Damage]] -- [REDUNDANT]
CALL			11					var0 = var0(var1)
GETIMPORT		12					var0 = wait -- [REDUNDANT]
GETUPVAL		14					var1 = upvalue[upvalue[6_var8]] -- [REDUNDANT]
CALL			15					var0 = var0(var1) -- [REDUNDANT]
LOADB			16					var0 = true -- [REDUNDANT]
SETUPVAL		17					upvalue[upvalue[2_var7]] = var0
SETUPVAL		17				end
JUMPXEQKB		2			end
RETURN			6			return 
RETURN			6		end
NAMECALL		95		var15 = var15:Connect(var17)
RETURN			97		return