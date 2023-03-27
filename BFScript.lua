game:GetService("RunService").Stepped:connect(function()
    game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)*math.huge
end)
