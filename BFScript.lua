local UIS = game:GetService("UserInputService")
local AimbotEnabled = false
local function GetClosestPlayer()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local ClosestMagnitude = math.huge
    local ClosestPlayer = nil
    for _, Player in pairs(Players:GetPlayers()) do
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player ~= LocalPlayer and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 then
            local Magnitude = (Player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if Magnitude < ClosestMagnitude then
                ClosestMagnitude = Magnitude
                ClosestPlayer = Player
            end
        end
    end
    return ClosestPlayer
end
UIS.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Touch and Input.UserInputState == Enum.UserInputState.Begin then
        AimbotEnabled = not AimbotEnabled
        if AimbotEnabled then
            while AimbotEnabled do
                wait()
                local ClosestPlayer = GetClosestPlayer()
                if ClosestPlayer then
                    local Camera = workspace.CurrentCamera
                    local CharPart = ClosestPlayer.Character.HumanoidRootPart
                    local ScreenPos = Camera:WorldToViewportPoint(CharPart.Position)
                    if ScreenPos.Z > 0 and ScreenPos.X > 0 and ScreenPos.X < Camera.ViewportSize.X and ScreenPos.Y > 0 and ScreenPos.Y < Camera.ViewportSize.Y then
                        UIS:SendTouchInput(1, ScreenPos.X, ScreenPos.Y, 0, false, Input.UserInputType)
                    end
                end
            end
        end
    end
end)
