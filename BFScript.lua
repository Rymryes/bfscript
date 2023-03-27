-- Script to lock onto players in Blox Fruits on mobile

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Toggle for aimlock
local AimlockEnabled = false

-- Function to find the nearest player
function findNearestPlayer()
    local minDist = math.huge
    local nearestPlayer = nil
    
    for i, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= LocalPlayer and player.Character.Humanoid.Health > 0 then
            local dist = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if dist < minDist then
                minDist = dist
                nearestPlayer = player
            end
        end
    end
    
    return nearestPlayer
end

-- Function to aim at a player
function aimAtPlayer(player)
    -- Get the player's character
    local character = player.Character
    if not character then return end
    
    -- Get the character's humanoid root part
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- Set the camera's CFrame to aim at the player's root part
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, rootPart.Position)
end

-- Function to toggle aimlock
function toggleAimlock()
    AimlockEnabled = not AimlockEnabled
    
    if AimlockEnabled then
        local nearestPlayer = findNearestPlayer()
        if nearestPlayer then
            aimAtPlayer(nearestPlayer)
        end
    end
end

-- Connect toggleAimlock to player input
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Touch and not gameProcessed then
        toggleAimlock()
    end
end)

-- Connect toggleAimlock to double tap
local lastTapTime = 0
game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Touch and not gameProcessed then
        local currentTime = os.clock()
        if currentTime - lastTapTime < 0.5 then
            toggleAimlock()
        end
        lastTapTime = currentTime
    end
end)
