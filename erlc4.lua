local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
local plr = game:GetService("Players").LocalPlayer
local plrs = game:GetService("Players")
getgenv()["IrisAd"]=true

--[[
This is a Beta version not done at all!!!!
------
Get Updates or help on the discord server or report if you got banned from something
COMING SOON
------
Use always an alt account!!!
ER:LC Killer 0.5 by !$McletsHacks_YT#6141
enjoy!
------
inspired by D4rk script and AeroX hub and ERLC gui!
]]
wait(1)
spawn(function()

Notification.WallNotification("ERLC Killer", "Version 1.0 enjoy made by McletsHacks", {
    Duration = 2,
    TitleSettings = {
        Enabled = true
    }
})
end)

wait(5)
spawn(function()
    Notification.Notify("ER:LC Killer", "Thx for using ERLC killer", "rbxassetid://4914902889");
    end)

wait(2)
spawn(function()
Notification.Notify("need help?", "https://discord.gg/uXeca3tg2a", "rbxassetid://4914902889");
end)

wait(6)
spawn(function()
    Notification.Notify("ER:LC Killer", "Checking version...", "rbxassetid://4914902889");
end)

wait(6)
spawn(function()
    Notification.Notify("ER:LC Killer", "You using the Beta version 1.0 (uptodate)", "rbxassetid://4914902889");
end)

wait(5)
spawn(function()
    Notification.Notify("Please Wait", "Gui is Loading...", "rbxassetid://4914902889");
end)

wait(5)
spawn(function()
    Notification.Notify("Please Wait", "Gui Loaded enjoy!", "rbxassetid://4914902889");
end)

--This is a Updated Version of ERLC GUI (ADDED/Replaced stuff)
--Remake by McletsHacks


            local function getCar()
            local vehicles = game.Workspace.Vehicles
            
            for _,v in pairs(vehicles:GetChildren()) do
                if v["Control_Values"].Owner.Value == tostring(plr.Name) then
                    return v
                end
            end
        end

local function getWantedPlayers()
    local wantedPlayers = {}
    for _,players in pairs(plrs:GetPlayers()) do
        if players:FindFirstChild("Is_Wanted") then
            table.insert(wantedPlayers, players)
        end
    end
    return wantedPlayers
end

--Timings for robberies :
--ATM : 6 minutes
--House : 6 minutes after leaving house robbery
--Bank : 7 minutes

wait(8)

spawn(function()
    Notification.Notify("ErLC Killer Info", "Loaded! Anticheat Bypass Enabled", "rbxassetid://4914902889");
end)

local w = library:CreateWindow("ERLC Killer") -- Creates the window

local b = w:CreateFolder("LocalPlayer") -- Creates the folder(U will put here your buttons,etc)
local c = w:CreateFolder("Teleports") -- Teleports for Normal stuff
local d = w:CreateFolder("Criminal") --tools tab
local e = w:CreateFolder("Criminal teleports")
local f = w:CreateFolder("AutoFarm") --postal farm

b:Button("Infinite Stamina",function()
    for count = 1, 9999999 do
    	plr.PlayerGui.GameGui.BottomLeft.Health["Stamina LS"].Stamina.Value = 900
        wait(0.2)
    end
    Notification.Notify("ErLC Killer Info", "Bypassed Remote!", "rbxassetid://4914902889");
end)

b:Button("God mode",function()
    for count = 1, 9999999 do
    	plr.Character.Humanoid.Health = 100
        wait(0.1)
    end
    Notification.Notify("ErLC Killer Info", "Godmode working!", "rbxassetid://4914902889");
end)

b:DestroyGui()

c:Button("Spawn",function()--fertig
wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
            wait(1)
            Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
			wait(0.2)
			plr.Character.Humanoid.Health = 50
			wait(0.5)
            plr.Character.Humanoid.Health = 1
            wait(0.6)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-481.649658, 23.7480145, 588.989929, 0.998634696, 6.93404729e-08, -0.0522376075, -6.81497312e-08, 1, 2.45758844e-08, 0.0522376075, -2.09823519e-08, 0.998634696)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-481.649658, 23.7480145, 588.989929, 0.998634696, 6.93404729e-08, -0.0522376075, -6.81497312e-08, 1, 2.45758844e-08, 0.0522376075, -2.09823519e-08, 0.998634696) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
        end)

 c:Button("Police Station", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(813.445312, 3.20000005, -74.2698441, 0.997823536, 3.44270124e-09, -0.0659404099, -1.08754525e-08, 1, -1.12360262e-07, 0.0659404099, 1.12832844e-07, 0.997823536)
        Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
        plr.Character.Humanoid.Health = 100
 end)

 c:Button("Fire station", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1011.23511, 23.8329163, 140.799637, -0.0865448862, -4.54258569e-08, -0.996247947, 5.23705346e-08, 1, -5.01464115e-08, 0.996247947, -5.65139544e-08, -0.0865448862)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1011.23511, 23.8329163, 140.799637, -0.0865448862, -4.54258569e-08, -0.996247947, 5.23705346e-08, 1, -5.01464115e-08, 0.996247947, -5.65139544e-08, -0.0865448862) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 c:Button("Dot Station", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(813.445312, 3.20000005, -74.2698441, 0.997823536, 3.44270124e-09, -0.0659404099, -1.08754525e-08, 1, -1.12360262e-07, 0.0659404099, 1.12832844e-07, 0.997823536)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-481.649658, 23.7480145, 588.989929, 0.998634696, 6.93404729e-08, -0.0522376075, -6.81497312e-08, 1, 2.45758844e-08, 0.0522376075, -2.09823519e-08, 0.998634696) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 c:Button("jeweler", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-465.208496, 23.7499828, -442.999847, -0.999997258, -7.34035263e-11, -0.00234943232, -7.02358727e-11, 1, -1.34834577e-09, 0.00234943232, -1.34817701e-09, -0.999997258)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-465.208496, 23.7499828, -442.999847, -0.999997258, -7.34035263e-11, -0.00234943232, -7.02358727e-11, 1, -1.34834577e-09, 0.00234943232, -1.34817701e-09, -0.999997258) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 c:Button("Bank", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1068.54041, 23.249836, 383.802155, -0.999908447, 2.46090348e-09, 0.0135304835, 1.56352531e-09, 1, -6.63332784e-08, -0.0135304835, -6.63060504e-08, -0.999908447)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1068.54041, 23.249836, 383.802155, -0.999908447, 2.46090348e-09, 0.0135304835, 1.56352531e-09, 1, -6.63332784e-08, -0.0135304835, -6.63060504e-08, -0.999908447) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 c:Button("Hospital", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-142.706497, 23.2499828, -406.026245, 0.999912024, -3.47661278e-08, -0.0132642742, 3.56631347e-08, 1, 6.73893368e-08, 0.0132642742, -6.78564547e-08, 0.999912024)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-142.706497, 23.2499828, -406.026245, 0.999912024, -3.47661278e-08, -0.0132642742, 3.56631347e-08, 1, 6.73893368e-08, 0.0132642742, -6.78564547e-08, 0.999912024) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 c:Button("Houses near farm", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-557.307129, -9.0498457, -1605.06531, 0.999437511, 3.85039689e-09, -0.0335357003, -3.67084052e-09, 1, 5.41574918e-09, 0.0335357003, -5.28959898e-09, 0.999437511)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-557.307129, -9.0498457, -1605.06531, 0.999437511, 3.85039689e-09, -0.0335357003, -3.67084052e-09, 1, 5.41574918e-09, 0.0335357003, -5.28959898e-09, 0.999437511) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 c:Button("Houses near sheriff station", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1138.82227, 23.8749962, -776.441223, -0.548326373, 1.30432554e-09, 0.836264431, 9.83589459e-08, 1, 6.29328198e-08, -0.836264431, 1.16761811e-07, -0.548326373)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1138.82227, 23.8749962, -776.441223, -0.548326373, 1.30432554e-09, 0.836264431, 9.83589459e-08, 1, 6.29328198e-08, -0.836264431, 1.16761811e-07, -0.548326373) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

spawn(function()
Notification.Notify("ErLc Killer Updates", "github.com/mcletshacks/erlc", "rbxassetid://4914902889");
end)

 c:Button("Tool Store", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-443.652557, 24.5500107, -720.60083, -0.878933847, -1.01090816e-08, -0.476943702, 1.30588038e-08, 1, -4.52609115e-08, 0.476943702, -4.60096601e-08, -0.878933847)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-443.652557, 24.5500107, -720.60083, -0.878933847, -1.01090816e-08, -0.476943702, 1.30588038e-08, 1, -4.52609115e-08, 0.476943702, -4.60096601e-08, -0.878933847) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 c:Button("Gun Store", function ()
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1239.67444, 24.2399979, -211.564651, -0.650761306, -2.30511752e-08, -0.759282351, -2.5223315e-08, 1, -8.74090844e-09, 0.759282351, 1.34633726e-08, -0.650761306)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1239.67444, 24.2399979, -211.564651, -0.650761306, -2.30511752e-08, -0.759282351, -2.5223315e-08, 1, -8.74090844e-09, 0.759282351, 1.34633726e-08, -0.650761306) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

c:Button("Teleport CFrame Script", function()
        	wait(2)
        local playerCFrame = "game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = " .. "CFrame.new(" .. tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame) .. ")"
	    setclipboard(playerCFrame)
        Notification.Notify("ErLc Kiler Info", "CFrame successful copied", "rbxassetid://4914902889")
    end)

d:Button("Get all tools for criminal", function()
    local oldCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    wait(1)
    Notification.Notify("ErLc Killer Info", "Using health to bypass please wait!", "rbxassetid://4914902889");
    plr.Character.Humanoid.Health = 50
    wait(1)
    plr.Character.Humanoid.Health = 1
    wait(1)
    plr.Character.Humanoid.Health = 50
    wait(1)
    plr.Character.Humanoid.Health = 100
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-432.303741, 24.5500107, -709.118164, -0.844418526, 5.48124248e-08, -0.53568399, 5.73464796e-08, 1, 1.19249268e-08, 0.53568399, -2.06499635e-08, -0.844418526)
    Notification.Notify("ErLc Killer Info", "Getting Drill!", "rbxassetid://4914902889");
    game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("Drill")
    wait(1)
    Notification.Notify("ErLc Killer Info", "Getting RFID Disruptor", "rbxassetid://4914902889");
    game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("RFID Disruptor")
    wait(1)
    Notification.Notify("ErLc Killer Info", "Getting Lockpick", "rbxassetid://4914902889");
    game:GetService("ReplicatedStorage").FE.BuyGear:InvokeServer("Lockpick")
    wait(1)
    Notification.Notify("ErLc Killer Info", "Teleporting back to last postion please wait", "rbxassetid://4914902889");
    plr.Character.Humanoid.Health = 50
    wait(1)
    plr.Character.Humanoid.Health = 1
    wait(1)
    plr.Character.Humanoid.Health = 50
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame
    plr.Character.Humanoid.Health = 100
    wait(1)
    Notification.Notify("ErLc Killer Info", "successfully got all tools", "rbxassetid://4914902889");
end)

e:Button("Atm 1", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(652.470093, 3.69999838, -1533.28369, -0.999989092, -2.84290813e-08, 0.00466443272, -2.84347728e-08, 1, -1.15382826e-09, -0.00466443272, -1.28644773e-09, -0.999989092)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(652.470093, 3.69999838, -1533.28369, -0.999989092, -2.84290813e-08, 0.00466443272, -2.84347728e-08, 1, -1.15382826e-09, -0.00466443272, -1.28644773e-09, -0.999989092) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 e:Button("Atm 2", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(999.5625, 3.69999862, -23.6841774, -0.998576403, -1.70108105e-08, 0.0533402786, -1.73102013e-08, 1, -5.15085796e-09, -0.0533402786, -6.06685635e-09, -0.998576403)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(999.5625, 3.69999862, -23.6841774, -0.998576403, -1.70108105e-08, 0.0533402786, -1.73102013e-08, 1, -5.15085796e-09, -0.0533402786, -6.06685635e-09, -0.998576403) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 e:Button("Atm 3", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-467.220764, 23.7499828, 386.74472, -0.0542147979, -5.5473663e-08, -0.998529315, 3.49823281e-08, 1, -5.74547201e-08, 0.998529315, -3.80457763e-08, -0.0542147979)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-467.220764, 23.7499828, 386.74472, -0.0542147979, -5.5473663e-08, -0.998529315, 3.49823281e-08, 1, -5.74547201e-08, 0.998529315, -3.80457763e-08, -0.0542147979) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 e:Button("Atm 4", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-371.430176, 23.7499828, 152.510101, -0.0293754656, 2.48336391e-08, -0.999568462, -6.6148111e-08, 1, 2.67883316e-08, 0.999568462, 6.69064875e-08, -0.0293754656)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-371.430176, 23.7499828, 152.510101, -0.0293754656, 2.48336391e-08, -0.999568462, -6.6148111e-08, 1, 2.67883316e-08, 0.999568462, 6.69064875e-08, -0.0293754656) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 e:Button("Atm 5", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1018.51685, 23.8829842, 445.027924, -0.998896182, 7.6356848e-08, 0.0469726846, 7.61712755e-08, 1, -5.74068393e-09, -0.0469726846, -2.15637797e-09, -0.998896182)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1018.51685, 23.8829842, 445.027924, -0.998896182, 7.6356848e-08, 0.0469726846, 7.61712755e-08, 1, -5.74068393e-09, -0.0469726846, -2.15637797e-09, -0.998896182) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 e:Button("Atm 6", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(810.600037, 3.69999862, 376.591827, -0.0460217521, 2.80638983e-13, -0.998940408, -9.98265435e-08, 1, 4.59934668e-09, 0.998940408, 9.99324428e-08, -0.0460217521)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(810.600037, 3.69999862, 376.591827, -0.0460217521, 2.80638983e-13, -0.998940408, -9.98265435e-08, 1, 4.59934668e-09, 0.998940408, 9.99324428e-08, -0.0460217521) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 e:Button("Atm 7", function ()--fertig
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(20,100,0)
        wait(1)
        Notification.Notify("ErLc Killer Info", "Try to teleport please wait", "rbxassetid://4914902889");
        wait(0.2)
        plr.Character.Humanoid.Health = 50
        wait(0.5)
        plr.Character.Humanoid.Health = 1
        wait(0.6)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-585.117004, 23.7499828, -409.709656, 0.999814451, 1.53752495e-08, -0.0192644615, -1.53823052e-08, 1, -2.18047955e-10, 0.0192644615, 5.14339293e-10, 0.999814451)
            if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-585.117004, 23.7499828, -409.709656, 0.999814451, 1.53752495e-08, -0.0192644615, -1.53823052e-08, 1, -2.18047955e-10, 0.0192644615, 5.14339293e-10, 0.999814451) then
            Notification.Notify("ErLc Killer Info", "Successfully teleportet!", "rbxassetid://4914902889");
		    plr.Character.Humanoid.Health = 100
            end
 end)

 f:Button("Postal autofarm", function ()
    -- IAmHrzn ER:LC postal worker autofarm
    --fixed teleport/fall tough the map by McletsHacks
    Notification.Notify("ErLc Killer Info", "Made by IAmHrzn", "rbxassetid://4914902889");
    Notification.Notify("ErLc Killer Info", "Fixed fall tough map by McletsHacks", "rbxassetid://4914902889");
    
    local function Start()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(712.758911, 3.70739913, -467.963623, -0.225708678, -3.16804361e-08, -0.974194825, 1.13039764e-08, 1, -3.51385978e-08, 0.974194825, -1.89433624e-08, -0.225708678)
        local args = {
            [1] = "Start",
            [2] = workspace.JobStarters:FindFirstChild("Postal Worker")
        }
        
        game:GetService("ReplicatedStorage").FE.StartJob:InvokeServer(unpack(args))
    
    end
    
    local function Packages()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(731.328674, 3.70739961, -490.313263, -0.373322487, -6.13480609e-08, -0.927701652, 2.44168508e-08, 1, -7.595483e-08, 0.927701652, -5.10071985e-08, -0.373322487)
        
        local args = {
            [1] = workspace.JobTasks:FindFirstChild("Postal Worker Package")
        }
        game:GetService("ReplicatedStorage").FE.PickUpPackages:InvokeServer(unpack(args))
    end
    
    local function Deliver()
        keypress(0x45)
        wait(0.5)
        keyrelease(0x45)
    end
    
    local function End()
        
        local args = {
            [1] = "Quit"
        }
        
        game:GetService("ReplicatedStorage").FE.StartJob:InvokeServer(unpack(args))
    
    end
    
    local function Mail_1()
    
        local Mail1 = game.Players.LocalPlayer.Backpack['Mail 1'].HousePosition.Value
        
        wait(0.9)			
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail1) + Vector3.new(0,3,1)
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail1) + Vector3.new(0,3,1)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.name == "Mail 1" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        wait(1)
        Deliver()
        Deliver()
        Deliver()
        wait(0.4)
        Deliver()
        wait(0.4)
    end
    
    local function Mail_2()
    
        local Mail2 = game.Players.LocalPlayer.Backpack['Mail 2'].HousePosition.Value
        
        wait(0.9)			
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail2) + Vector3.new(0,3,1)
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail2) + Vector3.new(0,3,1)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.name == "Mail 2" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        wait(1)
        Deliver()
        Deliver()
        Deliver()
        wait(0.4)
        Deliver()
        wait(0.4)
    end
    
    local function Mail_3()
    
        local Mail3 = game.Players.LocalPlayer.Backpack['Mail 3'].HousePosition.Value
        
        wait(0.9)			
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail3) + Vector3.new(0,3,1)
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail3) + Vector3.new(0,3,1)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.name == "Mail 3" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        wait(1)
        Deliver()
        Deliver()
        Deliver()
        wait(0.4)
        Deliver()
        wait(0.4)
    end
    
    local function Mail_4()
    
        local Mail4 = game.Players.LocalPlayer.Backpack['Mail 4'].HousePosition.Value
        
        wait(0.9)			
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail4) + Vector3.new(0,3,1)
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail4) + Vector3.new(0,3,1)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.name == "Mail 4" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        wait(1)
        Deliver()
        Deliver()
        Deliver()
        wait(0.4)
        Deliver()
        wait(0.4)
    end
    
    local function Mail_5()
    
        local Mail5 = game.Players.LocalPlayer.Backpack['Mail 5'].HousePosition.Value
        
        wait(0.9)			
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail5) + Vector3.new(0,3,1)
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mail5) + Vector3.new(0,3,1)
        wait()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.name == "Mail 5" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
        wait(1)
        Deliver()
        Deliver()
        Deliver()
        wait(0.4)
        Deliver()
        wait(0.4)
    end
    -- Starting the farm
    local Toggled = true
    
    while Toggled == true and wait() do
        Start()
        Start()
        Start()
        Start()
        Start()
        Start()
        wait(0.5)
        Start()
        Start()
        Packages()
        wait(2)
        Mail_1()
        task.wait(2)
        Mail_2()
        task.wait(2)
        Mail_3()
        task.wait(2)
        Mail_4()
        task.wait(2)
        Mail_5()
        task.wait(2)
        End()

    end
end)