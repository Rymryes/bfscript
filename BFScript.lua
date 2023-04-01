-- Blox Fruits FPS Boost Script for Mobile by Rymr

-- Set Graphics Quality to Medium
game:GetService("GraphicsSettings").QualityLevel = Enum.QualityLevel.Medium

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

-- Set FOV to 80
game:GetService("Camera").FieldOfView = 80

-- Set Anti-Aliasing to Off
game:GetService("GraphicsSettings").AntiAliasingMode = Enum.AntiAliasingMode.Disabled

-- Set Render Distance to 1000
game:GetService("Workspace").MaxDistance = 1000

-- Reduce Ping and Lag
game:GetService("NetworkClient"):SetOutgoingKBPSLimit(500)
game:GetService("NetworkClient"):SetIncomingKBPSLimit(500)

-- Enable Roblox's Experimental Graphics Mode for additional performance improvements
if game:GetService("UserInputService").GamepadEnabled then
    settings().Rendering.EnableExperimentalMapRendering = true
    settings().Rendering.EnableExperimentalVertexShading = true
end

-- Set the graphics quality for GUI elements
for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
    if gui:IsA("GuiObject") then
        gui.Quality = Enum.QualityLevel.Medium
        gui.AntiAliasing = false
        gui.DepthOfField = false
        gui.MotionBlur = false
        gui.SunRays = false
        gui.Bloom = false
    end
end

-- Reduce the number of parts in the game
for _, part in ipairs(game.Workspace:GetDescendants()) do
    if part:IsA("BasePart") then
        if part.Size.X * part.Size.Y * part.Size.Z > 1000000 then
            part.Transparency = 1
            part.CanCollide = false
        end
    end
end

print("Script loaded successfully.")
