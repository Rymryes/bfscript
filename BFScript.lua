-- Define the settings
local settings = {
    targetColors = {
        Color3.fromRGB(255, 0, 0), -- Red
        Color3.fromRGB(0, 255, 0), -- Green
        Color3.fromRGB(0, 0, 255)  -- Blue
    },
    fov = 70, -- Field of view
    maxDistance = 1000 -- Maximum distance to target
}

-- Define the user interface
local ui = Instance.new("ScreenGui")
ui.Name = "AimbotUI"
ui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Text = "Aimbot: OFF"
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0.5, -50, 0.9, 0)
toggleButton.Parent = ui

-- Define the aimbot function
local function aimbot()
    -- Get the player's camera and character
    local camera = workspace.CurrentCamera
    local character = game:GetService("Players").LocalPlayer.Character

    -- Get all NPCs and players within the field of view and maximum distance
    local targets = {}
    for _, target in ipairs(workspace:GetDescendants()) do
        if target:IsA("Model") and target:FindFirstChild("Humanoid") and target:FindFirstChild("HumanoidRootPart") then
            local targetPosition = target.HumanoidRootPart.Position
            local screenPosition, onScreen = camera:WorldToScreenPoint(targetPosition)
            if onScreen and screenPosition.Z > 0 and screenPosition.Z < camera.ViewportSize.Z then
                local distance = (targetPosition - character.HumanoidRootPart.Position).magnitude
                if distance <= settings.maxDistance then
                    for _, color in ipairs(settings.targetColors) do
                        if target.Humanoid.RootPart.Color == color then
                            table.insert(targets, {target = target, distance = distance})
                            break
                        end
                    end
                end
            end
        end
    end

    -- Find the closest target and aim at it
    if #targets > 0 then
        table.sort(targets, function(a, b) return a.distance < b.distance end)
        local closestTarget = targets[1].target
        local lookVector = (closestTarget.HumanoidRootPart.Position - character.HumanoidRootPart.Position).unit
        camera.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + (lookVector * settings.maxDistance))
    end
end

-- Connect the toggle button to the aimbot function
local isAimbotEnabled = false
toggleButton.MouseButton1Click:Connect(function()
    isAimbotEnabled = not isAimbotEnabled
    if isAimbotEnabled then
        toggleButton.Text = "Aimbot: ON"
        while isAimbotEnabled do
            aimbot()
            wait()
        end
    else
        toggleButton.Text = "Aimbot: OFF"
    end
end)
