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
