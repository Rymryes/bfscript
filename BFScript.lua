-- Configuration
local aimAtNPCs = true -- Set to true to aim at NPCs
local aimAtPlayers = true -- Set to true to aim at other players
local aimDelay = 0.5 -- Delay in seconds between aiming

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Functions
local function getClosestEntity()
    local closestEntity = nil
    local closestDistance = math.huge
    
    for _, npc in pairs(ReplicatedStorage.NPCs:GetChildren()) do
        if npc:FindFirstChild("HumanoidRootPart") and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
            local distance = (npc.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestEntity = npc
                closestDistance = distance
            end
        end
    end
    
    if aimAtPlayers then
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 and player.TeamColor ~= Players.LocalPlayer.TeamColor then
                local distance = (player.Character.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if distance < closestDistance then
                    closestEntity = player.Character
                    closestDistance = distance
                end
            end
        end
    end
    
    return closestEntity
end

-- Main loop
while true do
    local entity = getClosestEntity()
    
    if entity then
        local targetColor = entity.Head.BrickColor
        local remote = ReplicatedStorage.Remotes.Aim

        remote:InvokeServer(targetColor)
    end
    
    wait(aimDelay)
end
