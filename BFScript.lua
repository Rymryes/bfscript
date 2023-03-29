game:GetService("RunService").RenderStepped:Connect(function()
    game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)*math.huge*math.huge
end)
