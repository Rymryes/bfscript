-- Blox Fruits FPS Boost Script for Mobile by Rymr

-- Set Graphics Quality to Low
game:GetService("GraphicsSettings").QualityLevel = Enum.QualityLevel.Low

-- Disable Shadows
game.Lighting.GlobalShadows = false

-- Disable Reflections
game.Lighting:SetReflectionsEnabled(false)

-- Turn off Water Reflections
game.Lighting.WaterReflections = false

-- Reduce Particle Count
game.Lighting.ParticleCount = 100

-- Disable Ambient Occlusion
game:GetService("Lighting").Technology.AmbientOcclusion = false

-- Disable Depth of Field
game:GetService("DepthOfField").Enabled = false

-- Disable Motion Blur
game:GetService("Camera").MotionBlur = false

-- Disable Vignette
game:GetService("PostEffect").Vignette.Enabled = false

-- Set FOV to 70
game:GetService("Camera").FieldOfView = 70

-- Set Anti-Aliasing to Off
game:GetService("GraphicsSettings").AntiAliasingMode = Enum.AntiAliasingMode.Disabled

-- Set Render Distance to 200
game:GetService("Workspace").MaxDistance = 200

-- Reduce Ping and Lag
game:GetService("NetworkClient"):SetOutgoingKBPSLimit(500)
game:GetService("NetworkClient"):SetIncomingKBPSLimit(500)

print("Script loaded pal.")
