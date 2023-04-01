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

-- Set Render Distance to 1000
game:GetService("Workspace").MaxDistance = 1000

-- Set FOV to 80
game:GetService("Camera").FieldOfView = 80
