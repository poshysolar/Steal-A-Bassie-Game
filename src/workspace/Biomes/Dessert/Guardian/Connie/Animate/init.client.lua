-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-12-06 18:56:47
-- Luau version 6, Types version 3
-- Time taken: 0.002375 seconds

local Parent = script.Parent
local Humanoid = Parent:WaitForChild("Humanoid")
local Animations_upvr = Parent:WaitForChild("Animations")
local var4_upvw = "Standing"
local tbl_upvr = {}
local function loadAnimationsFromFolder_upvr(arg1) -- Line 28, Named "loadAnimationsFromFolder"
	local module = {}
	if arg1:IsA("Animation") then
		local tbl = {}
		tbl.anim = arg1
		tbl.weight = arg1:GetAttribute("Weight") or 1
		table.insert(module, tbl)
	else
		warn("Invalid object in folder "..arg1.Name..": "..arg1.Name)
	end
	if #module == 0 then
		warn("No animations found in folder: "..arg1.Name)
	end
	return module
end
local function _() -- Line 47, Named "configureAnimations"
	--[[ Upvalues[3]:
		[1]: tbl_upvr (readonly)
		[2]: loadAnimationsFromFolder_upvr (readonly)
		[3]: Animations_upvr (readonly)
	]]
	tbl_upvr.idle = loadAnimationsFromFolder_upvr(Animations_upvr:FindFirstChild("Idle"))
	tbl_upvr.walk = loadAnimationsFromFolder_upvr(Animations_upvr:FindFirstChild("Walk"))
	tbl_upvr.run = loadAnimationsFromFolder_upvr(Animations_upvr:FindFirstChild("Run"))
end
tbl_upvr.idle = loadAnimationsFromFolder_upvr(Animations_upvr:FindFirstChild("Idle"))
tbl_upvr.walk = loadAnimationsFromFolder_upvr(Animations_upvr:FindFirstChild("Walk"))
tbl_upvr.run = loadAnimationsFromFolder_upvr(Animations_upvr:FindFirstChild("Run"))
local function _(arg1, arg2) -- Line 57, Named "safeStopAnimation"
	if arg1 and typeof(arg1) == "Instance" and arg1.IsPlaying then
		arg1:Stop(arg2)
	end
end
local var8_upvw = ""
local var9_upvw
local Animator_upvr = Humanoid:WaitForChild("Animator")
local function playAnimation_upvr(arg1, arg2) -- Line 66, Named "playAnimation"
	--[[ Upvalues[4]:
		[1]: var8_upvw (read and write)
		[2]: var9_upvw (read and write)
		[3]: tbl_upvr (readonly)
		[4]: Animator_upvr (readonly)
	]]
	if var8_upvw == arg1 then
	else
		if var9_upvw then
			local var13 = var9_upvw
			if var13 and typeof(var13) == "Instance" and var13.IsPlaying then
				var13:Stop(arg2)
			end
		end
		local var14 = tbl_upvr[arg1]
		if not var14 or #var14 == 0 then
			warn("No animations available for "..arg1)
			return
		end
		var9_upvw = Animator_upvr:LoadAnimation(var14[1].anim)
		var9_upvw.Priority = Enum.AnimationPriority.Core
		var9_upvw.Looped = true
		var9_upvw:Play(arg2)
		var8_upvw = arg1
	end
end
local function _() -- Line 107, Named "handleIdle"
	--[[ Upvalues[2]:
		[1]: var4_upvw (read and write)
		[2]: playAnimation_upvr (readonly)
	]]
	if var4_upvw == "Standing" and lastPose ~= "Standing" then
		playAnimation_upvr("idle", 0.5)
	end
end
local function _() -- Line 114, Named "animate"
	--[[ Upvalues[2]:
		[1]: var4_upvw (read and write)
		[2]: playAnimation_upvr (readonly)
	]]
	if var4_upvw == "Standing" and lastPose ~= "Standing" then
		playAnimation_upvr("idle", 0.5)
	end
end
Humanoid.Running:Connect(function(arg1) -- Line 91, Named "onRunning"
	--[[ Upvalues[2]:
		[1]: playAnimation_upvr (readonly)
		[2]: var4_upvw (read and write)
	]]
	if 0.01 < arg1 then
		if 18 < arg1 then
			playAnimation_upvr("run", 0.2)
			var4_upvw = "Running"
		else
			playAnimation_upvr("walk", 0.2)
			var4_upvw = "Walking"
		end
	end
	playAnimation_upvr("idle", 0.2)
	var4_upvw = "Standing"
end)
while Parent.Parent ~= nil do
	local _, _ = wait(0.1)
	if var4_upvw == "Standing" and lastPose ~= "Standing" then
		playAnimation_upvr("idle", 0.5)
	end
	lastPose = var4_upvw -- Setting global
end