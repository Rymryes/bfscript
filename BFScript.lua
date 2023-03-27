--// Find the nearest NPC or player with the specified color
function FindTarget(Color)
    local Target = nil
    local TargetDist = math.huge
    
    for _, Character in pairs(game:GetService("Players"):GetPlayers()) do
        if Character ~= game:GetService("Players").LocalPlayer then
            local Humanoid = Character.Character:FindFirstChildOfClass("Humanoid")
            
            if Humanoid and Humanoid.Health > 0 then
                local Head = Character.Character:FindFirstChild("Head")
                
                if Head then
                    local HeadColor = Head.BillboardGui.Frame.ImageColor3
                    
                    if HeadColor == Color then
                        local TargetMagnitude = (Head.Position - game:GetService("Players").LocalPlayer.Character.Head.Position).magnitude
                        
                        if TargetMagnitude < TargetDist then
                            Target = Character.Character
                            TargetDist = TargetMagnitude
                        end
                    end
                end
            end
        end
    end
    
    for _, NPC in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        local Humanoid = NPC:FindFirstChildOfClass("Humanoid")
        
        if Humanoid and Humanoid.Health > 0 then
            local Head = NPC:FindFirstChild("Head")
            
            if Head then
                local HeadColor = Head.BillboardGui.Frame.ImageColor3
                
                if HeadColor == Color then
                    local TargetMagnitude = (Head.Position - game:GetService("Players").LocalPlayer.Character.Head.Position).magnitude
                    
                    if TargetMagnitude < TargetDist then
                        Target = NPC
                        TargetDist = TargetMagnitude
                    end
                end
            end
        end
    end
    
    return Target
end

--// Set up the aimbot
local AimbotColor = Color3.fromRGB(255, 0, 0) -- Replace with your desired color

while wait() do
    local Target = FindTarget(AimbotColor)
    
    if Target then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Target.HumanoidRootPart.CFrame
    end
end
