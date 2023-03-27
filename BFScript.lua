--// SETTINGS \\
local Settings = {
    AimAtNPCs = true, -- Set to true to aim at NPCs
    AimAtPlayers = true, -- Set to true to aim at players
    MaxDistance = 1000, -- Maximum distance to target (in studs)
    TargetPartName = "Head", -- Part to aim at
}

--// MAIN FUNCTION \\
local function GetClosestTarget()
    local Target = nil
    local ClosestDistance = Settings.MaxDistance
    for _, Character in pairs(game:GetService("Players"):GetPlayers()) do
        if Character.Character and Character.Character:FindFirstChild("HumanoidRootPart") and Character.Character:FindFirstChild(Settings.TargetPartName) then
            local Distance = (Character.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if Distance < ClosestDistance and Distance <= Settings.MaxDistance and Character.Character.Humanoid.Health > 0 then
                Target = Character.Character:FindFirstChild(Settings.TargetPartName)
                ClosestDistance = Distance
            end
        end
    end
    if Settings.AimAtNPCs then
        for _, NPC in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if NPC:FindFirstChild("HumanoidRootPart") and NPC:FindFirstChild(Settings.TargetPartName) then
                local Distance = (NPC.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if Distance < ClosestDistance and Distance <= Settings.MaxDistance and NPC.Humanoid.Health > 0 then
                    Target = NPC:FindFirstChild(Settings.TargetPartName)
                    ClosestDistance = Distance
                end
            end
        end
    end
    return Target
end

local function AimAt(Target)
    if not Target then return end
    local Camera = workspace.CurrentCamera
    local TargetPosition = Camera:WorldToViewportPoint(Target.Position)
    mousemoverel((TargetPosition.X - mouse.X) * 3, (TargetPosition.Y - mouse.Y) * 3)
end

--// MAIN LOOP \\
while wait() do
    AimAt(GetClosestTarget())
end
