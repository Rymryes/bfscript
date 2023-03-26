--// Settings //--
local aimbotEnabled = true
local aimRadius = 50 -- the radius of the circle used to find targets
local lockOnTime = 0.2 -- the time in seconds to wait before locking on to a target
local aimColor = Color3.fromRGB(255, 255, 0) -- the color of the aim assist circle

--// Variables //--
local player = game:GetService("Players").LocalPlayer
local inputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local aimGui = Instance.new("ScreenGui")
aimGui.Name = "AimGui"
aimGui.Parent = game.CoreGui

local aimCircle = Instance.new("ImageLabel")
aimCircle.Name = "AimCircle"
aimCircle.AnchorPoint = Vector2.new(0.5, 0.5)
aimCircle.BackgroundTransparency = 1
aimCircle.Image = "rbxassetid://5574609988"
aimCircle.ImageColor3 = aimColor
aimCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
aimCircle.Size = UDim2.new(0, aimRadius * 2, 0, aimRadius * 2)
aimCircle.Visible = false
aimCircle.Parent = aimGui

local aimLock = false
local aimTarget = nil
local aimTime = 0

--// Functions //--
local function getNearestTarget()
    local nearestDist = math.huge
    local nearestTarget = nil
    for _, npc in pairs(game.Workspace.NPCs:GetChildren()) do
        if npc:FindFirstChild("HumanoidRootPart") and npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
            local targetPos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(npc.HumanoidRootPart.Position)
            local dist = (Vector2.new(targetPos.X, targetPos.Y) - Vector2.new(inputService:GetMouseLocation().X, inputService:GetMouseLocation().Y)).magnitude
            if onScreen and dist < aimRadius and dist < nearestDist then
                nearestDist = dist
                nearestTarget = npc.HumanoidRootPart
            end
        end
    end
    return nearestTarget
end

--// Main Loop //--
runService.RenderStepped:Connect(function()
    if aimbotEnabled then
        if aimLock then
            if aimTarget and aimTarget.Parent and aimTarget.Parent.Humanoid.Health > 0 then
                aimCircle.Position = UDim2.new(0, aimTarget.Position.X - workspace.CurrentCamera.ViewportSize.X / 2, 0, aimTarget.Position.Y - workspace.CurrentCamera.ViewportSize.Y / 2)
                aimCircle.Visible = true
            else
                aimLock = false
                aimTarget = nil
                aimCircle.Visible = false
            end
        else
            local nearestTarget = getNearestTarget()
            if nearestTarget then
                aimTime = tick()
            end
            if tick() - aimTime >= lockOnTime then
                aimLock = true
                aimTarget = nearestTarget
                aimTime = 0
            end
        end
    else
        aimLock = false
        aimTarget = nil
        aimTime = 0
        aimCircle.Visible = false
    end
end)
