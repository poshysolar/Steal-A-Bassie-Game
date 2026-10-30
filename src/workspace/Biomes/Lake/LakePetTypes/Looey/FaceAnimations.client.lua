-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-06 18:38:40
-- Luau version 6, Types version 3
-- Time taken: 0.001379 seconds

local Players_upvr = game:GetService("Players")
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local UserInputService_upvr = game:GetService("UserInputService")
;(function(arg1) -- Line 6, Named "setupIdleAndBlinking"
	--[[ Upvalues[3]:
		[1]: Players_upvr (readonly)
		[2]: ReplicatedStorage_upvr (readonly)
		[3]: UserInputService_upvr (readonly)
	]]
	local Animations = arg1:FindFirstChild("Animations")
	local Config = arg1:FindFirstChild("Config")
	if not Animations then
		warn("No Animations config found for character.")
	else
		local Quirk = Animations:FindFirstChild("Quirk")
		if not Quirk or not Quirk:IsA("Animation") then
			warn("No valid idle animation found in Animations config.")
			return
		end
		local BlinkTexture_upvr = Config:FindFirstChild("BlinkTexture")
		if not BlinkTexture_upvr or not BlinkTexture_upvr:IsA("Decal") then
			warn("No valid blink texture found in Config.")
			return
		end
		local Humanoid = arg1:FindFirstChild("Humanoid")
		if not Humanoid then
			warn("No Humanoid found in character.")
			return
		end
		if not Humanoid:FindFirstChild("Animator") then
		end
		local Head_upvr = arg1:FindFirstChild("Head")
		if not Head_upvr then
			warn("No head found in character.")
			return
		end
		local NormalTexture_upvr = Config:FindFirstChild("NormalTexture")
		if not NormalTexture_upvr then
			warn("No face decal found in Config.")
			return
		end
		if not UserInputService_upvr.TouchEnabled then
			local BlinkToggle_upvr = ReplicatedStorage_upvr.PlayerData:WaitForChild(tostring(Players_upvr.LocalPlayer.UserId)):WaitForChild("BlinkToggle")
			coroutine.wrap(function() -- Line 54
				--[[ Upvalues[4]:
					[1]: BlinkToggle_upvr (readonly)
					[2]: Head_upvr (readonly)
					[3]: BlinkTexture_upvr (readonly)
					[4]: NormalTexture_upvr (readonly)
				]]
				-- KONSTANTERROR: [0] 1. Error Block 10 start (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [0] 1. Error Block 10 end (CF ANALYSIS FAILED)
				-- KONSTANTERROR: [4] 4. Error Block 11 start (CF ANALYSIS FAILED)
				wait(math.random(3, 6))
				if Head_upvr then
					Head_upvr.TextureID = BlinkTexture_upvr.Texture
					wait(0.2)
					Head_upvr.TextureID = NormalTexture_upvr.Texture
					-- KONSTANTWARNING: GOTO [36] #28
				end
				-- KONSTANTERROR: [4] 4. Error Block 11 end (CF ANALYSIS FAILED)
			end)()
		end
	end
end)(script.Parent)