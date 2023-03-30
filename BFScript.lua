-- Load Blox Fruits game
game:GetService('Players').LocalPlayer:RequestStreamAroundAsync(Vector3.new(0, 0, 0))

-- Unlock FPS
game:GetService('RunService').RenderStepped:Connect(function()
    game:GetService('RunService').RenderStepped:Fire()
end)

-- Find all fruits on the map
local fruitTable = {
    'Bomb',
    'Spike',
    'Chop',
    'Spring',
    'Kilo',
    'Smoke',
    'Spin',
    'Flame',
    'Falcon',
    'Ice',
    'Sand',
    'Dark',
    'Revive',
    'Daimond',
    'Light',
    'Love',
    'Rubber',
    'Barrier',
    'Magma',
    'Door',
    'Quake',
    'Buddha',
    'String',
    'Phoenix',
    'Rumble',
    'Paw',
    'Gravity',
    'Dough',
    'Shadow',
    'Venom',
    'Control',
    'Soul',
    'Dragon',
    'Leopard'
}
local function findFruits()
    for i, fruit in ipairs(fruitTable) do
        local fruitModel = game:GetService('Workspace'):FindFirstChild(fruit)
        if fruitModel then
            local fruitPart = fruitModel:FindFirstChild('SpawnPart')
            if fruitPart and fruitPart.Transparency ~= 1 then
                local fruitName = fruitModel.Name
                print('Found '..fruitName..'!')
                repeat
                    wait(1)
                until not fruitPart or fruitPart.Transparency == 1
                print(fruitName..' is no longer available.')
            end
        end
    end
end
findFruits()

-- Apply FPS booster
local function setFpsCap(newCap)
    for i,v in pairs(getreg()) do
        if type(v) == "function" and debug.getinfo(v).name == "setfpscap" then
            v(newCap)
        end
    end
end
setFpsCap(math.huge)
