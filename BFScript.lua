--// Gui Creation
local Gui = Instance.new("ScreenGui")
Gui.Name = "Aimbot"
Gui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 150, 0, 100)
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.Parent = Gui

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 20)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundColor3 = Color3.new(0, 0, 0)
Title.Text = "Aimbot"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(1, 0, 0, 30)
ToggleButton.Position = UDim2.new(0, 0, 0, 40)
ToggleButton.BackgroundColor3 = Color3.new(1, 1, 1)
ToggleButton.Text = "Off"
ToggleButton.Parent = MainFrame

--// Aimbot Logic
local function GetNearestPlayer()
    local Players = game:GetService("Players"):GetPlayers()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Closest = nil
    local ShortestDistance = math.huge

    for i, v in pairs(Players) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local Distance = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
            if Distance < ShortestDistance then
                Closest = v.Character.HumanoidRootPart
                ShortestDistance = Distance
            end
        end
    end

    return Closest
end

local function AimAt(Part)
    local Camera = workspace.CurrentCamera
    local Position = Camera:WorldToScreenPoint(Part.Position)

    mousemoverel((Position.X - mouse.x), (Position.Y - mouse.y))
end

local function ToggleAimbot()
    if ToggleButton.Text == "Off" then
        ToggleButton.Text = "On"
        while ToggleButton.Text == "On" do
            local ClosestPlayer = GetNearestPlayer()
            if ClosestPlayer then
                AimAt(ClosestPlayer)
            end
            wait()
        end
    else
        ToggleButton.Text = "Off"
    end
end

ToggleButton.MouseButton1Click:Connect(ToggleAimbot)
