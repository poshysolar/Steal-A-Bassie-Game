--Put the script in StarterPlayer --> StarterCharacterScripts

local Player = game:GetService("Players").LocalPlayer
local Character = workspace:WaitForChild(Player.Name)
local Humanoid = Character:WaitForChild('Humanoid')

--Editable--
local ID = 0  --Your animation ID!--
local RunningSpeed = 25 --Running speed--
local NormalSpeed = 16  --Normal speed/walkspeed--
local FieldOfView = 80  --Field of view when running--
local key = "LeftShift"  --Sprint/Run key--

--Animation--
local RunAnimation = Instance.new('Animation')
RunAnimation.AnimationId = 'rbxassetid://'..ID
RAnimation = Humanoid:LoadAnimation(RunAnimation)
Running = false

--FieldOfView--
local Info = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local Properties = {FieldOfView = FieldOfView}
local T = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, Info, Properties)
local rProperties = {FieldOfView = 70}
local rInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local rT = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, rInfo, rProperties)

--Keypress function--
function Handler(BindName, InputState)
	if InputState == Enum.UserInputState.Begin and BindName == 'RunBind' then
		Running = true
		Humanoid.WalkSpeed = RunningSpeed
		T:Play()
	elseif InputState == Enum.UserInputState.End and BindName == 'RunBind' then
		Running = false
		if RAnimation.IsPlaying then
			RAnimation:Stop()
		end
		Humanoid.WalkSpeed = NormalSpeed
		rT:Play()
	end
end

--Running with animation and field of view--
Humanoid.Running:connect(function(Speed)
	if Speed >= 10 and Running and not RAnimation.IsPlaying then
		RAnimation:Play()
		Humanoid.WalkSpeed = RunningSpeed
		T:Play()
	elseif Speed >= 10 and not Running and RAnimation.IsPlaying then
		RAnimation:Stop()
		Humanoid.WalkSpeed = NormalSpeed
		rT:Play()
	elseif Speed < 10 and RAnimation.IsPlaying then
		RAnimation:Stop()
		Humanoid.WalkSpeed = NormalSpeed
		rT:Play()
	end
end)

game:GetService('ContextActionService'):BindAction('RunBind', Handler, true, Enum.KeyCode[key])

--Stop animation if...--
Humanoid.Changed:connect(function()
	if Humanoid.Jump and RAnimation.IsPlaying then
		RAnimation:Stop()
	end
end)