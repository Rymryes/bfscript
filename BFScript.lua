-- -- The fixer v5

local network = game:GetService("NetworkClient")

network:SetOutgoingKBPSLimit(1024)
network:SetIncomingKBPSLimit(1024)
network:SetOutgoingVoiceKBPSLimit(16)
network:SetIncomingVoiceKBPSLimit(16)
network:SetOutgoingPacketThrottleBurstSize(20)
network:SetOutgoingPacketThrottleRate(10)
network:SetIncomingPacketThrottleBurstSize(20)
network:SetIncomingPacketThrottleRate(10)

-- Set Render Distance to 1500
game:GetService("Workspace").MaxDistance = 1500

-- Set FOV to 100
game:GetService("Camera").FieldOfView = 100
