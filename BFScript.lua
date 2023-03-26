local aiming = false -- whether or not aim assist is currently enabled
local aimButton = script.Parent -- the UI button that toggles aim assist

-- function to enable aim assist
local function enableAimAssist()
    aiming = true
    aimButton.Text = "Disable Aim Assist"
end

-- function to disable aim assist
local function disableAimAssist()
    aiming = false
    aimButton.Text = "Enable Aim Assist"
end

-- connect the button to the enable/disable functions
aimButton.Activated:Connect(function()
    if aiming then
        disableAimAssist()
    else
        enableAimAssist()
    end
end)

-- main loop to update aim assist
while true do
    wait(0.1) -- adjust this value to control how frequently the aim is updated
    
    if aiming then
        local player = game.Players.LocalPlayer
        local character = player.Character
        local mouse = player:GetMouse()
        local target
        
        -- detect if the player is targeting an NPC or another player
        local hit = mouse.Hit
        local hitPart = hit and hit.Instance and hit.Instance.Parent
        if hitPart and hitPart:IsA("Model") then
            if hitPart:FindFirstChild("Humanoid") then
                -- targeting an NPC
                target = hitPart
            end
        else
            -- targeting a player
            local targetCharacter = workspace:FindFirstChild(hitPart.Name)
            if targetCharacter and targetCharacter ~= character then
                target = targetCharacter
            end
        end
        
        -- lock on to the target if one is found
        if target then
            local targetPart = target:FindFirstChild("HumanoidRootPart")
            if targetPart then
                -- aim at the target
                local direction = (targetPart.Position - character.HumanoidRootPart.Position).unit
                character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.Position, targetPart.Position) * CFrame.new(0, 0, -10)
                
                -- lock on to the target
                character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
                character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            end
        end
    end
end
