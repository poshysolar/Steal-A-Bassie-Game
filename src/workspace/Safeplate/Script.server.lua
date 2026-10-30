local part = script.Parent

-- Remove an existing SAFE ZONE GUI to prevent duplicates
local existingGui = part:FindFirstChild("SafeZoneSurfaceGui")
if existingGui then
	existingGui:Destroy()
end

-- Create the SurfaceGui
local surfaceGui = Instance.new("SurfaceGui")
surfaceGui.Name = "SafeZoneSurfaceGui"
surfaceGui.Face = Enum.NormalId.Top
surfaceGui.Adornee = part
surfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
surfaceGui.PixelsPerStud = 10
surfaceGui.AlwaysOnTop = false
surfaceGui.Parent = part

-- Create the text
local textLabel = Instance.new("TextLabel")
textLabel.Name = "SafeZoneText"
textLabel.Size = UDim2.fromScale(1, 1)
textLabel.Position = UDim2.fromScale(0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "SAFE ZONE"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.GothamBold
textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
textLabel.TextStrokeTransparency = 0
textLabel.TextXAlignment = Enum.TextXAlignment.Center
textLabel.TextYAlignment = Enum.TextYAlignment.Center
textLabel.Parent = surfaceGui

-- Keep the text within the GUI bounds
local textConstraint = Instance.new("UITextSizeConstraint")
textConstraint.MinTextSize = 20
textConstraint.MaxTextSize = 200
textConstraint.Parent = textLabel

print("SAFE ZONE surface text created successfully!")
