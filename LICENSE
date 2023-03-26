-- Configuration
local aimAssistDistance = 20 -- adjust this value to control the distance at which aim assist is active

-- Create the button
local button = Instance.new("TextButton")
button.Text = "Open"
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0, 10, 0, 10)
button.BackgroundTransparency = 0.5
button.Parent = game.Players.LocalPlayer.PlayerGui

-- Create the aim assist function
local function aimAssist()
    -- Get the player's camera and character
    local camera = game.Workspace.CurrentCamera
    local character = game.Players.LocalPlayer.Character
    if not camera or not character then
        return
    end
    
    -- Get the closest NPC or player within the aim assist distance
    local closestObject, closestDistance
    for _, object in ipairs(game.Workspace:GetChildren()) do
        if object:IsA("Model") and (object.Name == "NPC" or object:IsDescendantOf(game.Players)) then
            local distance = (object.PrimaryPart.Position - camera.CFrame.Position).magnitude
            if distance <= aimAssistDistance and (not closestDistance or distance < closestDistance) then
                closestObject = object
                closestDistance = distance
            end
        end
    end
    
    -- Aim at the closest NPC or player
    if closestObject then
        local target = closestObject.PrimaryPart.Position
        local targetScreenPos = camera:WorldToScreenPoint(target)
        local screenSize = game:GetService("GuiService"):GetScreenResolution()
        local aimPos = Vector2.new(targetScreenPos.X, targetScreenPos.Y)
        local aimCenter = screenSize / 2
        local aimDelta = (aimPos - aimCenter) / screenSize
        character.Humanoid.AutoRotate = false
        character.HumanoidRootPart.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position + (camera.CFrame.LookVector + Vector3.new(aimDelta.x, 0, aimDelta.y)).unit * 1000)
    else
        character.Humanoid.AutoRotate = true
    end
end

-- Hook up the button
local isOpen = false
button.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    button.Text = isOpen and "Off" or "Open"
    if isOpen then
        button.BackgroundColor3 = Color3.new(0, 1, 0)
        aimAssistConnection = game:GetService("RunService").Heartbeat:Connect(aimAssist)
    else
        button.BackgroundColor3 = Color3.new(1, 0, 0)
        aimAssistConnection:Disconnect()
    end
end)
