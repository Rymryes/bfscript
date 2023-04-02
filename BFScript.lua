local aimAssistEnabled = false
local aimAssistStrength = 0.5

local function calculateAimAssist(targetPlayer)
    local player = game.Players.LocalPlayer
    local targetPosition = targetPlayer.Character.Head.Position
    local aimDirection = (targetPosition - player.Character.Head.Position).unit
    player.Character.Humanoid.AutoRotate = false
    player.Character.Head.CFrame = CFrame.new(player.Character.Head.Position, player.Character.Head.Position + aimDirection)
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Touch and not gameProcessed and aimAssistEnabled then
        local touch = input:GetTouch()
        if touch and touch.State == Enum.UserInputState.End and touch.Target then
            local targetPlayer = touch.Target.Parent:FindFirstChildOfClass("Humanoid")
            if targetPlayer and targetPlayer.Parent and targetPlayer.Parent:FindFirstChildOfClass("Model") and targetPlayer.Parent:FindFirstChildOfClass("Model"):FindFirstChild("Head") then
                calculateAimAssist(targetPlayer.Parent:FindFirstChildOfClass("Model").Head)
            end
        end
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if aimAssistEnabled then
        local aimbotStrength = aimAssistStrength * 50
        local targetPlayer = game.Players:GetPlayers()[1]
        for _, player in ipairs(game.Players:GetPlayers()) do
            local distance = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if distance < aimbotStrength then
                targetPlayer = player
            end
        end
        calculateAimAssist(targetPlayer.Character.Head)
    end
end)

local aimAssistPercentage = 0

local gui = Instance.new("ScreenGui")
gui.Name = "Aim Assist GUI"
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Name = "Slider Frame"
frame.Size = UDim2.new(0, 200, 0, 50)
frame.Position = UDim2.new(0.5, -100, 0.5, -25)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Name = "Slider Label"
label.Size = UDim2.new(1, 0, 0.5, 0)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.BorderSizePixel = 0
label.Font = Enum.Font.SourceSans
label.Text = "Aim Assist Percentage: " .. aimAssistPercentage
label.TextColor3 = Color3.new(1, 1, 1)
label.TextScaled = true
label.Parent = frame

local slider = Instance.new("Slider")
slider.Name = "Aim Assist Slider"
slider.Size = UDim2.new(0.8, 0, 0.5, 0)
slider.Position = UDim2.new(0.1, 0, 0.5, 0)
slider.BackgroundColor3 = Color3.new(1, 1, 1)
slider.BackgroundTransparency = 1
slider.BorderSizePixel = 0
slider.MinValue = 0
slider.MaxValue = 100
slider.Value = 0
slider.Parent = frame

slider.ValueChanged:Connect(function(value)
    aimAssistPercentage = value
    label.Text = "Aim Assist Percentage: " .. aimAssistPercentage
end)
