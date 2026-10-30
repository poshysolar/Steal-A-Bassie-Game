-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-06 18:38:43
-- Luau version 6, Types version 3
-- Time taken: 0.009663 seconds

local Parent_upvr = script.Parent
local Humanoid_upvr = Parent_upvr:WaitForChild("Humanoid")
local Animator_upvr = Humanoid_upvr:WaitForChild("Animator")
local var6_upvw = "Standing"
local pcall_result1_2, pcall_result2 = pcall(function() -- Line 8
	return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop")
end)
local pcall_result1_3, pcall_result2_2 = pcall(function() -- Line 11
	return UserSettings():IsUserFeatureEnabled("UserAnimateScaleRun")
end)
local var13_upvr = pcall_result1_3 and pcall_result2_2
local function _() -- Line 14, Named "getRigScale"
	--[[ Upvalues[2]:
		[1]: var13_upvr (readonly)
		[2]: Parent_upvr (readonly)
	]]
	if var13_upvr then
		return Parent_upvr:GetScale()
	end
	return 1
end
local var14_upvw = 0
local var15_upvw = ""
local var16_upvw
local var17_upvw
local var18_upvw
local tbl_upvr = {}
local _ = {
	wave = false;
	point = false;
	dance = true;
	dance2 = true;
	dance3 = true;
	laugh = false;
	cheer = false;
}
local tbl_upvr_2 = {}
local var44_upvw = false
local pcall_result1, _ = pcall(function() -- Line 82
	--[[ Upvalues[1]:
		[1]: var44_upvw (read and write)
	]]
	var44_upvw = UserSettings():IsUserFeatureEnabled("UserPreloadAnimations")
end)
if not pcall_result1 then
	var44_upvw = false
end
math.randomseed(os.time())
function findExistingAnimationInSet(arg1, arg2) -- Line 91
	if arg1 == nil or arg2 == nil then
		return 0
	end
	for i = 1, arg1.count do
		if arg1[i].anim.AnimationId == arg2.AnimationId then
			return i
		end
	end
	return 0
end
function configureAnimationSet(arg1, arg2) -- Line 105
	--[[ Upvalues[2]:
		[1]: tbl_upvr (readonly)
		[2]: Humanoid_upvr (readonly)
	]]
	if tbl_upvr[arg1] ~= nil then
		for _, v in pairs(tbl_upvr[arg1].connections) do
			v:disconnect()
		end
	end
	local tbl = {
		count = 0;
		totalWeight = 0;
		connections = {};
	}
	local SOME = script:FindFirstChild(arg1)
	if SOME ~= nil then
		for _, v_2 in pairs(SOME:GetChildren()) do
			if v_2.Name == "weight" then
				tbl.totalWeight = v_2.Value
			end
		end
	end
	if tbl.totalWeight <= 0 then
		tbl.totalWeight = #arg2
	end
	for i_4, v_3 in pairs(arg2) do
		local Animation = Instance.new("Animation")
		Animation.Name = arg1..' '..i_4
		Animation.AnimationId = v_3.id
		Animation.Parent = Humanoid_upvr
		local findExistingAnimationInSet_result1 = findExistingAnimationInSet(tbl, Animation)
		if 0 < findExistingAnimationInSet_result1 then
			tbl[findExistingAnimationInSet_result1].count = tbl[findExistingAnimationInSet_result1].count + 1
		else
			table.insert(tbl, {
				anim = Animation;
				count = 1;
				totalWeight = v_3.weight;
				weight = v_3.weight;
			})
			tbl.count += 1
		end
	end
	tbl_upvr[arg1] = tbl
end
for i_5, v_4 in pairs({
	idle = {{
		id = "http://www.roblox.com/asset/?id=78197156369403";
		weight = 10;
	}};
	quirk = {{
		id = "http://www.roblox.com/asset/?id=103731301723965";
		weight = 10;
	}};
	walk = {{
		id = "rbxassetid://124245470232056";
		weight = 10;
	}};
	run = {{
		id = "rbxassetid://131545440842534";
		weight = 10;
	}};
	swim = {{
		id = "http://www.roblox.com/asset/?id=507784897";
		weight = 10;
	}};
	swimidle = {{
		id = "http://www.roblox.com/asset/?id=507785072";
		weight = 10;
	}};
	jump = {{
		id = "http://www.roblox.com/asset/?id=507765000";
		weight = 10;
	}};
	fall = {{
		id = "http://www.roblox.com/asset/?id=507767968";
		weight = 10;
	}};
	climb = {{
		id = "http://www.roblox.com/asset/?id=507765644";
		weight = 10;
	}};
	sit = {{
		id = "http://www.roblox.com/asset/?id=2506281703";
		weight = 10;
	}};
}) do
	configureAnimationSet(i_5, v_4)
end
local function _(arg1) -- Line 164, Named "preloadAnimation"
	--[[ Upvalues[2]:
		[1]: Animator_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
	]]
	if arg1 and arg1.AnimationId then
		local var73 = Animator_upvr
		if var73 then
			local any_LoadAnimation_result1_3 = var73:LoadAnimation(arg1)
			if any_LoadAnimation_result1_3 then
				any_LoadAnimation_result1_3:Play(0)
				any_LoadAnimation_result1_3:Stop()
				any_LoadAnimation_result1_3:Destroy()
				tbl_upvr_2[arg1.AnimationId] = true
			end
		end
	end
end
;(function() -- Line 180, Named "preloadAnimations"
	--[[ Upvalues[3]:
		[1]: tbl_upvr (readonly)
		[2]: tbl_upvr_2 (readonly)
		[3]: Animator_upvr (readonly)
	]]
	for _, v_5 in pairs(tbl_upvr) do
		for i_7 = 1, v_5.count do
			if v_5[i_7] and v_5[i_7].anim and not tbl_upvr_2[v_5[i_7].anim.AnimationId] then
				local anim = v_5[i_7].anim
				if anim and anim.AnimationId then
					local var91 = Animator_upvr
					if var91 then
						local any_LoadAnimation_result1 = var91:LoadAnimation(anim)
						if any_LoadAnimation_result1 then
							any_LoadAnimation_result1:Play(0)
							any_LoadAnimation_result1:Stop()
							any_LoadAnimation_result1:Destroy()
							tbl_upvr_2[anim.AnimationId] = true
						end
					end
				end
			end
		end
	end
end)()
function rollAnimation(arg1) -- Line 195
	--[[ Upvalues[1]:
		[1]: tbl_upvr (readonly)
	]]
	local var95
	if not tbl_upvr[arg1] then
		var95 = "Animation set "..arg1.." not found"
		warn(var95)
		return 1
	end
	var95 = tbl_upvr[arg1]
	local function INLINED() -- Internal function, doesn't exist in bytecode
		var95 = 0
		var95 = tbl_upvr[arg1]
		return var95.totalWeight <= var95
	end
	if not var95.totalWeight or INLINED() then
		var95 = "Animation set "..arg1.." has no weight"
		warn(var95)
		return 1
	end
	var95 = 1
	var95 = 1
	for i_8 = 1, #tbl_upvr[arg1] do
		if math.random(var95, tbl_upvr[arg1].totalWeight) <= 0 + (tbl_upvr[arg1][i_8].weight or 1) then
			var95 = i_8
			return var95
		end
	end
	return var95
end
local tick_result1_upvw_2 = tick()
function tryPlayQuirk() -- Line 221
	--[[ Upvalues[4]:
		[1]: var15_upvw (read and write)
		[2]: var18_upvw (read and write)
		[3]: tick_result1_upvw_2 (read and write)
		[4]: Humanoid_upvr (readonly)
	]]
	if var15_upvw == "idle" and not var18_upvw and 8 < tick() - tick_result1_upvw_2 and math.random() < 0.1 then
		playAnimation("quirk", 0.4, Humanoid_upvr)
		tick_result1_upvw_2 = tick()
	end
end
local var97_upvr = pcall_result1_2 and pcall_result2
function keyFrameReachedFunc(arg1) -- Line 230
	--[[ Upvalues[4]:
		[1]: var15_upvw (read and write)
		[2]: var97_upvr (readonly)
		[3]: var16_upvw (read and write)
		[4]: Humanoid_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 6. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [8] 6. Error Block 4 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 5 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 8. Error Block 5 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 15. Error Block 7 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [20] 15. Error Block 7 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [27] 21. Error Block 9 start (CF ANALYSIS FAILED)
	playAnimation(var15_upvw, 0, Humanoid_upvr)
	-- KONSTANTERROR: [27] 21. Error Block 9 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [34] 27. Error Block 10 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [34] 27. Error Block 10 end (CF ANALYSIS FAILED)
end
local var98_upvw = 1
function setAnimationSpeed(arg1) -- Line 249
	--[[ Upvalues[2]:
		[1]: var98_upvw (read and write)
		[2]: var16_upvw (read and write)
	]]
	if arg1 ~= var98_upvw then
		var98_upvw = arg1
		if var16_upvw then
			var16_upvw:AdjustSpeed(var98_upvw)
		end
	end
end
local var99_upvw
local var100_upvw
function playAnimation(arg1, arg2, arg3) -- Line 258
	--[[ Upvalues[7]:
		[1]: tbl_upvr (readonly)
		[2]: var16_upvw (read and write)
		[3]: var17_upvw (read and write)
		[4]: var15_upvw (read and write)
		[5]: var99_upvw (read and write)
		[6]: var18_upvw (read and write)
		[7]: var100_upvw (read and write)
	]]
	local anim_3 = tbl_upvr[arg1][rollAnimation(arg1)].anim
	if arg1 == "idle" then
		safeStopAnimation(var16_upvw, arg2)
		safeStopAnimation(var17_upvw, arg2)
		var17_upvw = arg3:LoadAnimation(anim_3)
		var17_upvw.Priority = Enum.AnimationPriority.Core
		var17_upvw.Looped = true
		var17_upvw:Play(arg2)
		var15_upvw = arg1
		var99_upvw = anim_3
		var16_upvw = nil
	elseif arg1 == "quirk" then
		safeStopAnimation(var18_upvw, arg2)
		var18_upvw = arg3:LoadAnimation(anim_3)
		var18_upvw.Priority = Enum.AnimationPriority.Action
		var18_upvw.Looped = false
		var18_upvw:Play(arg2)
		var18_upvw.Stopped:Connect(function() -- Line 283
			--[[ Upvalues[1]:
				[1]: var18_upvw (copied, read and write)
			]]
			if var18_upvw then
				var18_upvw:Destroy()
				var18_upvw = nil
			end
		end)
	else
		safeStopAnimation(var16_upvw, arg2)
		safeStopAnimation(var17_upvw, arg2)
		safeStopAnimation(var18_upvw, arg2)
		var16_upvw = arg3:LoadAnimation(anim_3)
		var16_upvw.Priority = Enum.AnimationPriority.Core
		var16_upvw.Looped = true
		var16_upvw:Play(arg2)
		var15_upvw = arg1
		var99_upvw = anim_3
		var17_upvw = nil
		var18_upvw = nil
	end
	if var100_upvw ~= nil then
		var100_upvw:disconnect()
		local var103
	end
	if arg1 ~= "quirk" then
		var103 = var16_upvw
		if not var103 then
			var103 = var17_upvw
		end
		if var103 then
			var100_upvw = var103.KeyframeReached:connect(keyFrameReachedFunc)
		end
	end
end
function onRunning(arg1) -- Line 317
	--[[ Upvalues[3]:
		[1]: var15_upvw (read and write)
		[2]: Humanoid_upvr (readonly)
		[3]: var6_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 17 start (CF ANALYSIS FAILED)
	if 18 < arg1 then
		if var15_upvw ~= "run" then
			playAnimation("run", 0.2, Humanoid_upvr)
			-- KONSTANTWARNING: GOTO [25] #20
		end
	elseif var15_upvw ~= "walk" then
		playAnimation("walk", 0.2, Humanoid_upvr)
	end
	-- KONSTANTERROR: [3] 3. Error Block 17 end (CF ANALYSIS FAILED)
end
function safeStopAnimation(arg1, arg2) -- Line 337
	if arg1 and typeof(arg1) == "Instance" then
		if arg1.IsPlaying then
			arg1:Stop(arg2)
		end
		arg1:Destroy()
	end
end
function stopAllAnimations() -- Line 346
	--[[ Upvalues[4]:
		[1]: var16_upvw (read and write)
		[2]: var17_upvw (read and write)
		[3]: var18_upvw (read and write)
		[4]: var15_upvw (read and write)
	]]
	safeStopAnimation(var16_upvw, 0)
	safeStopAnimation(var17_upvw, 0)
	safeStopAnimation(var18_upvw, 0)
	var16_upvw = nil
	var17_upvw = nil
	var18_upvw = nil
	var15_upvw = ""
end
function onDied() -- Line 356
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	var6_upvw = "Dead"
end
function onJumping() -- Line 360
	--[[ Upvalues[3]:
		[1]: Humanoid_upvr (readonly)
		[2]: var14_upvw (read and write)
		[3]: var6_upvw (read and write)
	]]
	playAnimation("jump", 0.1, Humanoid_upvr)
	var14_upvw = tick()
	var6_upvw = "Jumping"
end
function onClimbing(arg1) -- Line 366
	--[[ Upvalues[2]:
		[1]: Humanoid_upvr (readonly)
		[2]: var6_upvw (read and write)
	]]
	playAnimation("climb", 0.1, Humanoid_upvr)
	setAnimationSpeed(arg1 / 12)
	var6_upvw = "Climbing"
end
function onGettingUp() -- Line 372
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	var6_upvw = "GettingUp"
end
function onFreeFall() -- Line 376
	--[[ Upvalues[3]:
		[1]: var14_upvw (read and write)
		[2]: Humanoid_upvr (readonly)
		[3]: var6_upvw (read and write)
	]]
	if 0.3 < tick() - var14_upvw then
		playAnimation("fall", 0.2, Humanoid_upvr)
	end
	var6_upvw = "FreeFall"
end
function onSeated() -- Line 383
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	var6_upvw = "Seated"
end
function onPlatformStanding() -- Line 387
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	var6_upvw = "PlatformStanding"
end
function onSwimming(arg1) -- Line 391
	--[[ Upvalues[1]:
		[1]: var6_upvw (read and write)
	]]
	if 0 < arg1 then
		var6_upvw = "Running"
	else
		var6_upvw = "Standing"
	end
end
local tick_result1_upvw = tick()
function animate(arg1) -- Line 399
	--[[ Upvalues[5]:
		[1]: tick_result1_upvw (read and write)
		[2]: var14_upvw (read and write)
		[3]: var6_upvw (read and write)
		[4]: Humanoid_upvr (readonly)
		[5]: var15_upvw (read and write)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	tick_result1_upvw = arg1
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 6. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [6] 6. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [10] 9. Error Block 3 start (CF ANALYSIS FAILED)
	var14_upvw = 0
	-- KONSTANTERROR: [10] 9. Error Block 3 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 11. Error Block 4 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [12] 11. Error Block 4 end (CF ANALYSIS FAILED)
end
Humanoid_upvr.Running:connect(onRunning)
while Parent_upvr.Parent ~= nil do
	local _, wait_result2 = wait(0.1)
	animate(wait_result2)
end