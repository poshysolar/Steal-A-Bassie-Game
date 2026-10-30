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

-- Function to change animations dynamically
local function changeAnims(newAnimationIds)
	for name, id in pairs(newAnimationIds) do
		if animations[name] then
			animations[name]:Stop() -- Stop the current animation before replacing it
		end
		local newAnimation = Instance.new("Animation")
		newAnimation.AnimationId = id
		animations[name] = humanoid:LoadAnimation(newAnimation)
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

-- Example usage of ChangeAnims to dynamically change animations
local newAnimationSet = {
	idle = "rbxassetid://NEW_IDLE_ANIMATION_ID",
	walk = "rbxassetid://NEW_WALK_ANIMATION_ID",
	jump = "rbxassetid://NEW_JUMP_ANIMATION_ID",
	fall = "rbxassetid://NEW_FALL_ANIMATION_ID"
}

-- You can call changeAnims(newAnimationSet) whenever you want to switch animations
-- Uncomment the line below to change animations on script run
-- changeAnims(newAnimationSet)
