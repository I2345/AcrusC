local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local DrawingLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/I2345/FelixDrawinglib/main/main.lua', true))()

local MainUI = UILibrary.Load("AcrusC")

local page_world = MainUI.AddPage("World")

page_world.AddButton("Full-bright", function()
    game.Lighting:FindFirstChild("ColorCorrection").Enabled = false
end)

local Visuals = MainUI.AddPage("Visual")

Visuals.AddButton("ESP", function()
    DrawingLib:BoxESP()
end)

local Rage = MainUI.AddPage("Rage")

Rage.AddToggle("Anti-Hit", false, function(v)
    local s,e = pcall(function()
        while true do
            if not v then return end
    
            local killer
            for _,v in pairs(game.Players:GetPlayers()) do
                if v.Team == game.Teams.Killer then
                    killer = v
                end
            end
    
            if killer == game.Players.LocalPlayer then return end
    
            local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - killer.Character.HumanoidRootPart.Position).Magnitude

            if dist <= 10 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position = workspace.Map.Holder:GetChildren()[1].vaults:GetChildren()[math.random(1, #workspace.Map.Holder:GetChildren()[1].vaults:GetChildren())].Position
            end
            task.wait()
        end
    end)
    if e then
        print(e)
    end
end)

Rage.AddToggle("Speed Hacks", false, function(v)
    while true do
        if not v then return end

        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed =  50
        task.wait()

    end
end)

local Legit = MainUI.AddPage("Legit")
Legit.AddToggle("Subtile Speed hacks", false, function(v)
    while true do
        if not v then return end

        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed =  20
        task.wait()

    end
end)
