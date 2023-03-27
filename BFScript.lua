local fpsUnlocker = Instance.new("ScreenGui")
local fpsLabel = Instance.new("TextLabel")

fpsUnlocker.Parent = game:GetService("CoreGui")
fpsUnlocker.Name = "FPS Unlocker"

fpsLabel.Parent = fpsUnlocker
fpsLabel.Name = "FPSLabel"
fpsLabel.BackgroundColor3 = Color3.new(1, 1, 1)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Position = UDim2.new(0, 0, 0, 0)
fpsLabel.Size = UDim2.new(0, 100, 0, 20)
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.TextSize = 20
fpsLabel.Text = "FPS: "

game:GetService("RunService").Stepped:Connect(function()
    fpsLabel.Text = "FPS: " .. tostring(math.floor(1 / game:GetService("RunService").RenderStepped:Wait()))
end)
