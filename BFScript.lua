game:GetService("RunService").Stepped:Connect(function()
    game:GetService("Players").LocalPlayer.MaximumSimulationRadius = math.pow(math.huge, math.huge) * math.huge
    game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
    game:GetService("RenderStepped"):wait()
    game:GetService("Players").LocalPlayer.ReplicationFocus = nil
end)
