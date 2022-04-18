local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua"))()
local plr = game:GetService("Players").LocalPlayer
local plrs = game:GetService("Players")
getgenv()["IrisAd"]=true

wait(1)
spawn(function()
    Notification.Notify("Please Wait", "Gui is Loading...", "rbxassetid://4914902889");
end)

wait(2)
spawn(function()
    wait(1)
		plr.Character.Humanoid.Health = 0
    Notification.Notify("Welcome!", "I have automatically created a Mafia for you :)", "rbxassetid://4914902889");
end)

wait(2)
spawn(function()
    Notification.Notify("ER:LC Fucker", "Alpha Version 0.5 by !$McletsHacks_YT#6141", "rbxassetid://4914902889");
end)

--This is a Updated Version of ERLC GUI (ADDED/Replaced stuff)
--Remake by McletsHacks

game:GetService("ReplicatedStorage").FE.StartMafia:InvokeServer("ANTIEXPLOIT MEME")

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

b:Label("This is a alpha version!",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(0,0,255); -- Self Explaining
    BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
}) 

b:Button("Infinite Stamina",function()
            plr.PlayerGui.GameGui.BottomLeft.Health["Stamina LS"].Stamina.Value = 100
end)

b:Toggle("AntiAresst",function(spawn)
        wait()
        if pcall(function() return plr["In_Handcuffs"] end) then
        local oldCFrame = plr.Character.HumanoidRootPart.CFrame
        plr.Character.UpperTorso:Destroy()
        wait(8)
        plr.Character.HumanoidRootPart.CFrame = oldCFrame
        end
    end)

b:DestroyGui()

c:Button("Spawn",function()
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

c:Button("Teleport CFrame Script", function()
        	wait(2)
        local playerCFrame = "game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = " .. "CFrame.new(" .. tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame) .. ")"
	    setclipboard(playerCFrame)
        Notification.Notify("ErLc Kiler Info", "CFrame successful copied", "rbxassetid://4914902889")
    end)
