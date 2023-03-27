local player = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local graphicsSettings = game:GetService("GraphicsSettings")

player:WaitForChild("PlayerGui")

-- Unlock FPS
rs:SetTargetFPS(0)

-- Increase FPS
settings().Rendering.FrameRateManager:Destroy()

-- Add shaders and shadows
graphicsSettings:SetPerformanceThrottlingEnabled(false)
graphicsSettings:SetShaderQuality(Enum.ShaderQuality.Level13)
graphicsSettings:SetShadowQuality(Enum.ShadowQuality.Level13)
