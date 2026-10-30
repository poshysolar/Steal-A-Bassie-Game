-- LocalScript: CustomAnimateScript

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Animation IDs (Replace these with your custom animation IDs)
local animationIds = {
	idle = "rbxassetid://YOUR_IDLE_ANIMATION_ID",
	walk = "rbxassetid://YOUR_WALK_ANIMATION_ID",
	jump = "rbxassetid://YOUR_JUMP_ANIMATION_ID",
	fall = "rbxassetid://YOUR_FALL_ANIMATION_ID"
}

-- Load animations
local animations = {}
for name, id in pairs(animationIds) do
	local animation = Instance.new("Animation")
	animation.AnimationId = id
	animations[name] = humanoid:LoadAnimation(animation)
end

-- Function to play animations based on state
local function playAnimation(state)
	for _, anim in pairs(animations) do
		anim:Stop()
	end

	if animations[state] then
		animations[state]:Play()
	end
end

-- Connect to humanoid state changes
humanoid.StateChanged:Connect(function(oldState, newState)
	if newState == Enum.HumanoidStateType.Running then
		playAnimation("walk")
	elseif newState == Enum.HumanoidStateType.Jumping then
		playAnimation("jump")
	elseif newState == Enum.HumanoidStateType.Freefall then
		playAnimation("fall")
	elseif newState == Enum.HumanoidStateType.Landed then
		playAnimation("idle")
	elseif newState == Enum.HumanoidStateType.Seated then
		playAnimation("idle")
	end
end)

-- Play idle animation when the character is first loaded
humanoid.Died:Connect(function()
	playAnimation("idle")
end)
