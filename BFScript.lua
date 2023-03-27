-- Script by ChatGPT
-- Blox Fruits Aimlock Script for Mobile
-- Version 2.0

-- Settings
local aimbotToggle = false -- Set to false to disable aimbot on start

-- Variables
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Functions
local function getNearestPlayer()
    local closestDist = math.huge
    local closestPlayer = nil
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local magnitude = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < closestDist then
                closestDist = magnitude
                closestPlayer = player
            end
        end
    end
    return closestPlayer
end

-- Main Loop
while true do
    wait(0.1)
    if aimbotToggle and Mouse.Target == nil then
        local nearestPlayer = getNearestPlayer()
        if nearestPlayer then
            local targetPos = nearestPlayer.Character.Head.Position
            local playerPos = LocalPlayer.Character.HumanoidRootPart.Position
            local direction = (targetPos - playerPos).unit
            LocalPlayer.Character.Humanoid:Move(direction * 0.1, false)
        end
    end
end

-- Toggle Aimbot
Mouse.Button1Down:Connect(function()
    if aimbotToggle then
        aimbotToggle = false
        print("Aimbot Disabled")
    else
        aimbotToggle = true
        print("Aimbot Enabled")
    end
end)
