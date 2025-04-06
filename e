local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourlink-to-rayfield-library"))()

local Window = Rayfield:CreateWindow({
    Name = "Dhelan and Sherzaahd's Trolling Gui",
    LoadingTitle = "Loading",
    LoadingSubtitle = "?Secret?",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "DeadRailsScripts", -- You can change this folder name
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
        Invite = "your-discord-invite-code", -- Change this if you want to link your Discord
        RememberJoins = true,
    },
    KeySystem = false, -- Set to true if you want to lock with a key
    Key = "YourSecretKey", -- You can add your secret key here
})

local MainTab = Window:CreateTab("Dead Rails", 4483362458)

Rayfield:Notify({
    Title = "From Dhelan",
    Content = "Sup Broskiee!!",
    Duration = 8.5,
    Image = 4483362458,
})

-- Noclip Functionality
local noclipEnabled = false

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        game:GetService("RunService").Heartbeat:Connect(function()
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CanCollide = false
            end
        end)
    else
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CanCollide = true
        end
    end
end

-- Speed Customizer
local speed = 16

local function setSpeed(value)
    speed = value
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

-- Kill Aura Functionality
local killAuraEnabled = false

local function toggleKillAura()
    killAuraEnabled = not killAuraEnabled
    while killAuraEnabled do
        for _, npc in pairs(game.Workspace:GetChildren()) do
            if npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                if npc:FindFirstChild("HumanoidRootPart") then
                    local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude
                    if dist < 10 then
                        npc.Humanoid.Health = 0
                    end
                end
            end
        end
        wait(0.1) -- Adjust delay as needed
    end
end

-- Aimbot Functionality
local aimbotEnabled = false

local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    while aimbotEnabled do
        local closestNPC = nil
        local shortestDistance = math.huge
        for _, npc in pairs(game.Workspace:GetChildren()) do
            if npc:FindFirstChild("HumanoidRootPart") then
                local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestNPC = npc
                end
            end
        end

        if closestNPC then
            -- Aim at the closest NPC's HumanoidRootPart
            local targetPos = closestNPC.HumanoidRootPart.Position
            local direction = (targetPos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).unit
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, targetPos)
        end
        wait(0.1) -- Adjust delay as needed
    end
end

-- Creating Buttons and Sliders on the GUI
MainTab:CreateButton({
    Name = "Toggle Noclip",
    Callback = toggleNoclip
})

MainTab:CreateSlider({
    Name = "Set Speed",
    Range = {16, 100},
    Increment = 1,
    Suffix = " Speed",
    CurrentValue = 16,
    Callback = setSpeed
})

MainTab:CreateButton({
    Name = "Toggle Kill Aura",
    Callback = toggleKillAura
})

MainTab:CreateButton({
    Name = "Toggle Aimbot",
    Callback = toggleAimbot
})
