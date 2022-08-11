State = true
while State == true and wait() do
                    for i, v in pairs(
                        game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.ATM.Hacking:GetDescendants()
                    ) do
                        if
                            v.ClassName == "TextLabel" and
                                v.Text ==
                                    game:GetService("Players").LocalPlayer.PlayerGui.GameMenus.ATM.Hacking.SelectingCode.Text
                         then
                            if v.TextColor3 == Color3.new(0, 0, 0) then
                                mouse1press()
                                wait()
                                mouse1release()
                            end
                        end
                    end
                end

if state == true do
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(
        413.841522,
        -18.5722427,
        911.652039,
        0.618819654,
        3.26545084e-08,
        0.785533071,
        6.93876885e-08,
        1,
        -9.62314317e-08,
        -0.785533071,
        1.14056228e-07,
        0.618819654
    )
    wait(0.7)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(
        413.841522,
        -10.5722427,
        911.652039,
        0.618819654,
        3.26545084e-08,
        0.785533071,
        6.93876885e-08,
        1,
        -9.62314317e-08,
        -0.785533071,
        1.14056228e-07,
        0.618819654
    )
    wait(1.6)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(
        413.841522,
        -18.5722427,
        911.652039,
        0.618819654,
        3.26545084e-08,
        0.785533071,
        6.93876885e-08,
        1,
        -9.62314317e-08,
        -0.785533071,
        1.14056228e-07,
        0.618819654
    )                
    --wait between rob and server join
wait(4)

local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
   return Http:JSONDecode(Raw)
end

local Server, Next; repeat
   local Servers = ListServers(Next)
   Server = Servers.data[1]
   Next = Servers.nextPageCursor
until Server
TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)

end
