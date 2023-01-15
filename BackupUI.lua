local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService") 

local Library = {
    Connections = {}
}  

local function AddConnection(Signal, Function)
	if (not Library:IsRunning()) then return end
    local Connection = Signal:Connect(Function)
	table.insert(Library.Connections, Connection)
    return Connection
end

pcall(function()
    shared.NapkinLibrary:Destroy()
end)

local function Create(Name, Properties, Children)
    local Object = Instance.new(Name)
    for i, v in next, Properties or {} do
        Object[i] = v
    end
    for i, v in next, Children or {} do
		v.Parent = Object
	end
    return Object
end

local function Round(Number, Factor)
    local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
    if Result < 0 then Result = Result + Factor end
    return Result
end

local function MakeDraggable(DragPoint, Main)
    pcall(function()
        local Dragging, DragInput, MousePos, FramePos = false
        AddConnection(DragPoint.InputBegan, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                MousePos = Input.Position
                FramePos = Main.Position
    
                AddConnection(Input.Changed, function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)
        AddConnection(DragPoint.InputChanged, function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement then
                DragInput = Input
            end
        end)
        AddConnection(UserInputService.InputChanged, function(Input)
            if Input == DragInput and Dragging then
                local Delta = Input.Position - MousePos
                Main.Position  = UDim2.new(FramePos.X.Scale,FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
            end
        end)
    end)
end

local WhitelistedMouse = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}
local BlacklistedKeys = {Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Up,Enum.KeyCode.Left,Enum.KeyCode.Down,Enum.KeyCode.Right,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.Escape}

local function CheckKey(Table, Key)
    for _, v in next, Table do
        if v == Key then
            return true
        end
    end
end

local function Ripple(Object)
    local Circle = Create("ImageLabel", {
        Parent = Object,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Image = "rbxassetid://266543268",
        ImageColor3 = Color3.fromRGB(210,210,210),
        ImageTransparency = 0.88
    })
    Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
    local Size = Object.AbsoluteSize.X / 1.5
    TweenService:Create(Circle, TweenInfo.new(0.5), {Position = UDim2.fromScale(math.clamp(Mouse.X - Object.AbsolutePosition.X, 0, Object.AbsoluteSize.X)/Object.AbsoluteSize.X,Object,math.clamp(Mouse.Y - Object.AbsolutePosition.Y, 0, Object.AbsoluteSize.Y)/Object.AbsoluteSize.Y) - UDim2.fromOffset(Size/2,Size/2), ImageTransparency = 1, Size = UDim2.fromOffset(Size,Size)}):Play()
    spawn(function()
        wait(0.5)
        Circle:Destroy()
    end)
end 


local GUI = Create("ScreenGui", {
	Parent = game:GetService("CoreGui"),
    Name = "HorizonLib"
})

shared.NapkinLibrary = GUI

function Library:IsRunning()
	return GUI.Parent == game:GetService("CoreGui")
end

task.spawn(function()
	while (Library:IsRunning()) do wait() end
	for _, Connection in next, Library.Connections do Connection:Disconnect() end
end)

local NotificationHolder = Create("Frame", {
    Position = UDim2.new(1, -15, 1, -15),
    Size = UDim2.new(0, 230, 1, -15),
	AnchorPoint = Vector2.new(1, 1),
    BackgroundTransparency = 1,
	Parent = GUI
}, {
    Create("UIListLayout", {
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Bottom
    })
})


function Library.Notification(NotificationConfig)
	NotificationConfig.Title = NotificationConfig.Title or "Notification"
	NotificationConfig.Content = NotificationConfig.Content or "Content"
	NotificationConfig.Delay = NotificationConfig.Delay or 5

    local NotificationBody = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
        Text = "",
		Parent = NotificationHolder
    })

    local DurationBar = Create("Frame", {
        Parent = NotificationBody,
        Size = UDim2.new(1, -24, 0, 3),
        Position = UDim2.new(0, 12, 1, -12),
        BackgroundColor3 = Color3.fromRGB(37, 37, 37),
        BorderSizePixel = 0
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 3)})
    })

    local NotificationFrame = Create("Frame", {
        Parent = NotificationBody,
        Size = UDim2.new(1, 0, 0, 0),
        Position = UDim2.new(1, 15, 0, 5),
        BackgroundColor3 = Color3.fromRGB(27, 27, 27)
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 8)}),
        Create("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 12),
            Size = UDim2.new(1, -24, 0, 10),
            Font = Enum.Font.GothamSemibold,
            Text = NotificationConfig.Title,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = Color3.fromRGB(180, 180, 180),
            TextSize = 13,
            RichText = true,
            Name = "Title"
        }),
        Create("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 12),
            Size = UDim2.new(1, -24, 0, 10),
            Font = Enum.Font.GothamSemibold,
            Text = "",
            TextXAlignment = Enum.TextXAlignment.Right,
            TextColor3 = Color3.fromRGB(180, 180, 180),
            TextSize = 13,
            RichText = true,
            Name = "Time"
        }),
        Create("TextLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 12, 0, 11),
            Size = UDim2.new(1, -24, 1, -15),
            Font = Enum.Font.Gotham,
            Text = NotificationConfig.Content,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = 13,
            RichText = true,
            TextWrapped = true,
            Name = "Content"
        }),
        Create("Frame", {
            Parent = NotificationBody,
            Size = UDim2.new(1, -24, 0, 3),
            Position = UDim2.new(0, 12, 1, -12),
            BackgroundColor3 = Color3.fromRGB(32, 32, 32),
            BorderSizePixel = 0
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 3)})
        }),
        DurationBar
    })

    spawn(function()
		for i = NotificationConfig.Delay, 0, -1 do
			NotificationFrame.Time.Text = i .. "s"
			wait(1)
		end
	end)

    NotificationFrame.Size = UDim2.new(1, 0, 0, NotificationFrame.Content.TextBounds.Y + 42)
    TweenService:Create(NotificationBody,TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{Size = UDim2.new(1, 0, 0, NotificationFrame.Content.TextBounds.Y + 48)}):Play()
    TweenService:Create(DurationBar,TweenInfo.new(NotificationConfig.Delay, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Size = UDim2.new(0, 0, 0, 3)}):Play()
    delay(0.15, function()
        TweenService:Create(NotificationFrame,TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{Position = UDim2.new(0,0,0,5)}):Play()
    end)
    delay(NotificationConfig.Delay, function()
        TweenService:Create(NotificationFrame,TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{Position = UDim2.new(1,15,0,5)}):Play()
        delay(0.15, function()
            TweenService:Create(NotificationBody,TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{Size = UDim2.new(1, 0, 0, 0)}):Play()
        end)
    end)
end    

function Library.Load(LibConfig)
    LibConfig = LibConfig or {}
    LibConfig.Title = LibConfig.Title or "Title"
    local MenuToggle = false
    local FirstTab = false
    


    function CheckForValidScript()
        print('nil')
    end

    CheckForValidScript()

    local ExitBtn = Create("TextButton", {
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -34, 0, 4),
        Size = UDim2.new(1, -8, 1, -8),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        Text = ""
    }, {
        Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(38, 38, 38),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0.8, 0, 0.8, 0),
            Name = "Hover"
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 8)})
        }),
        Create("ImageLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, -9, 0.5, -9),
            Size = UDim2.new(0, 18, 0, 18),
            Image = "rbxassetid://6235536018",
            ImageColor3 = Color3.fromRGB(180, 180, 180),
            ScaleType = Enum.ScaleType.Crop,
            Name = "Ico"
        })
    })

    AddConnection(ExitBtn.MouseEnter, function()
        TweenService:Create(ExitBtn.Hover, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0}):Play()
        TweenService:Create(ExitBtn.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 0, 68)}):Play()
    end)

    AddConnection(ExitBtn.MouseLeave, function()
        TweenService:Create(ExitBtn.Hover, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0.8, 0, 0.8, 0), BackgroundTransparency = 1}):Play()
        TweenService:Create(ExitBtn.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(180, 180, 180)}):Play()
    end)
    AddConnection(ExitBtn.MouseButton1Click, function()
        shared.NapkinLibrary:Destroy()
    end)
    
    local MenuBtn = Create("TextButton", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 4, 0, 4),
        Size = UDim2.new(1, -8, 1, -8),
        SizeConstraint = Enum.SizeConstraint.RelativeYY,
        Text = ""
    }, {
        Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(38, 38, 38),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0.8, 0, 0.8, 0),
            Name = "Hover"
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 8)})
        }),
        Create("ImageLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, -8, 0.5, -8),
            Size = UDim2.new(0, 16, 0, 16),
            Image = "rbxassetid://7072718840",
            ImageColor3 = Color3.fromRGB(180, 180, 180),
            ScaleType = Enum.ScaleType.Crop,
            Name = "Ico"
        })
    })

    AddConnection(MenuBtn.MouseEnter, function()
        TweenService:Create(MenuBtn.Hover, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0}):Play()
        TweenService:Create(MenuBtn.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        CheckForValidScript()
    end)

    AddConnection(MenuBtn.MouseLeave, function()
        TweenService:Create(MenuBtn.Hover, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0.8, 0, 0.8, 0), BackgroundTransparency = 1}):Play()
        TweenService:Create(MenuBtn.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(180, 180, 180)}):Play()
    end)
    
       

    local MenuFrame = Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(27, 27, 27),
        BorderSizePixel = 0,
        Position = UDim2.new(-1, -5, 0, 0),
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
        Create("Frame", {
            BackgroundColor3 = Color3.fromRGB(27, 27, 27),
            BorderSizePixel = 0,
            Position = UDim2.new(1, -5, 0, 0),
            Size = UDim2.new(0, 5, 1, 0)
        }),
        Create("Frame", {
            BackgroundColor3 = Color3.fromRGB(27, 27, 27),
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 5)
        }),
        Create("Frame", {
            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            Position = UDim2.new(1, -1, 0, 0),
            Size = UDim2.new(0, 1, 1, 0)
        }),
        Create("Frame", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            Name = "Container"
        }, {
            Create("UIPadding", {
                PaddingBottom = UDim.new(0, 10),
                PaddingTop = UDim.new(0, 10)
            }),
            Create("UIListLayout")
        })
    })

    local MainFrame = Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(25, 25, 25),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 480, 0, 380),
        Parent = GUI
    }, {
        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
        Create("ImageLabel", {
            BackgroundTransparency = 1,
            Position = UDim2.new(0, -15, 0, -15),
            Size = UDim2.new(1, 30, 1, 30),
            Image = "http://www.roblox.com/asset/?id=5554236805",
            ImageColor3 = Color3.fromRGB(10, 10, 10),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(23, 23, 277, 277)
        }),
        Create("Folder", {Name = "Container"}),
        Create("TextButton", {
            Size = UDim2.new(1, 0, 1, -38),
            Position = UDim2.new(0, 0, 0, 38),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            Name = "Darken",
            BorderSizePixel = 0,
            Visible = false
        }),
        Create("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Position = UDim2.new(0, 0, 0, 36),
            Size = UDim2.new(0.4, 0, 1, -36)
        }, {
            MenuFrame
        }),
        Create("Frame", {
            BackgroundColor3 = Color3.fromRGB(27, 27, 27),
            Size = UDim2.new(1, 0, 0, 38),
            Position = UDim2.new(0, 0, 0, -1),
            Name = "TopBar"
        }, {
            Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
            Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(27, 27, 27),
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 1, -5),
                Size = UDim2.new(1, 0, 0, 5)
            }),
            Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 0, 1, 0),
                Size = UDim2.new(1, 0, 0, 1)
            }),
            Create("TextLabel", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.Gotham,
                Text = LibConfig.Title,
                TextColor3 = Color3.fromRGB(180, 180, 180),
                TextSize = 14,
                RichText = true
            }),
            ExitBtn,
            MenuBtn
        })
    })

    AddConnection(MenuBtn.MouseButton1Click, function()
        MenuToggle = not MenuToggle
        TweenService:Create(MenuFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = MenuToggle and UDim2.new(0, 0, 0, 0) or UDim2.new(-1, -5, 0, 0)}):Play()
        TweenService:Create(MainFrame.Darken, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = MenuToggle and 0.8 or 1}):Play()
        MainFrame.Darken.Visible = MenuToggle 	
    end)

    MakeDraggable(MainFrame.TopBar, MainFrame)
    
    return {AddTab = function(TabTitle, PremiumEnabled)
        local TabBtn = Create("TextButton", {
            Parent = MenuFrame.Container,
            BackgroundColor3 = Color3.fromRGB(0, 150, 100),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 35),
            Text = "",
            AutoButtonColor = false
        }, {
            Create("TextLabel", {
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 10, 0, 0),
                Size = UDim2.new(1, -10, 1, 0),
                Font = Enum.Font.Gotham,
                Text = TabTitle,
                TextColor3 = Color3.fromRGB(165, 165, 165),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                Name = "Title"
            })
        })

        local Container = Create("ScrollingFrame", {
            Parent = MainFrame.Container,
            Size = UDim2.new(1, 0, 1, -38),
            Position = UDim2.new(0, 0, 0, 38),
            BackgroundTransparency = 1,
            Visible = false,
            MidImage = "rbxassetid://7445543667",
            BottomImage = "rbxassetid://7445542488",
            TopImage = "rbxassetid://7445543667",
            ScrollBarImageColor3 = Color3.fromRGB(27, 27, 27),
            ScrollBarThickness = 6,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            BorderSizePixel = 0
        }, {
            Create("UIPadding", {
                PaddingBottom = UDim.new(0, 14),
                PaddingTop = UDim.new(0, 14),
                PaddingLeft = UDim.new(0, 16),
                PaddingRight = UDim.new(0, 16),
            }),
            Create("UIListLayout", {Padding = UDim.new(0, 12)})
        })

        AddConnection(Container.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
            Container.CanvasSize = UDim2.new(0,0,0,Container.UIListLayout.AbsoluteContentSize.Y + 28)
        end)

        if FirstTab == false then
            FirstTab = true
            Container.Visible = true
            TabBtn.BackgroundTransparency = 0
            TabBtn.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        end    

        AddConnection(TabBtn.MouseButton1Click, function()
            if PremiumEnabled then
                Library.Notification({
                    Title = ('Premium'),
                    Content = ('This tab/section is unable to you because you are not a premium user.'),
                    Delay = 5
                })
            else
                for i, v in next, MenuFrame.Container:GetChildren() do
                    if v:IsA("TextButton") then
                        TweenService:Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(v.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(165, 165, 165)}):Play()
                    end    
                end
                for i, v in next, MainFrame.Container:GetChildren() do
                    if v:IsA("ScrollingFrame") then
                        v.Visible = false
                    end    
                end
                TweenService:Create(TabBtn, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()    
                TweenService:Create(TabBtn.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                Container.Visible = true
            end
        end)

        return {AddSection = function(SectionName) 
            local SectionContainer = Create("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.new(0, 0, 0, 16),
                Size = UDim2.new(1, 0, 0, 0),
                Name = "Container"
            }, {
                Create("UIListLayout", {Padding = UDim.new(0, 6)})
            })

            local SectionFrame = Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 0),
                Parent = Container
            }, {
                Create("TextLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, -10, 0, 10),
                    Font = Enum.Font.GothamSemibold,
                    TextColor3 = Color3.fromRGB(165, 165, 165),
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    Text = string.upper(SectionName)
                }),
                SectionContainer
            })

            AddConnection(SectionContainer.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
                SectionContainer.Size = UDim2.new(1,0,0,SectionContainer.UIListLayout.AbsoluteContentSize.Y)
                SectionFrame.Size = UDim2.new(1,0,0,SectionContainer.UIListLayout.AbsoluteContentSize.Y + 16)
            end)

            return {
                AddButton = function(ButtonConfig)
                    ButtonConfig = ButtonConfig or {}
                    ButtonConfig.Name = ButtonConfig.Name or "Button"
                    ButtonConfig.Premium = ButtonConfig.Premium or false
                    ButtonConfig.Callback = ButtonConfig.Callback or function() end

                    local ButtonFrame = Create("TextButton", {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Size = UDim2.new(1, 0, 0, 32),
                        Parent = SectionContainer,
                        AutoButtonColor = false,
                        ClipsDescendants = true,
                        Text = ""
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Text = ButtonConfig.Name
                        })
                    })

                    AddConnection(ButtonFrame.MouseEnter, function()
                        TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                    end)

                    AddConnection(ButtonFrame.MouseLeave, function()
                        TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(28, 28, 28)}):Play()
                    end)

                    AddConnection(ButtonFrame.MouseButton1Down, function()
                        TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(33, 33, 33)}):Play()
                    end)

                    AddConnection(ButtonFrame.MouseButton1Up, function()
                        TweenService:Create(ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                        Ripple(ButtonFrame)
                        if ButtonConfig.Premium then
                            Library.Notification({
                                Title = ('Premium'),
                                Content = ('This is a premium feature'),
                                Delay = 5
                            })
                        elseif ButtonConfig.Premium == false then
                            ButtonConfig.Callback()
                        end
                    end)
                end,
                AddToggle = function(ToggleConfig)
                    ToggleConfig = ToggleConfig or {}
                    ToggleConfig.Name = ToggleConfig.Name or "Toggle"
                    ToggleConfig.Premium = ToggleConfig.Premium or false
                    ToggleConfig.Default = ToggleConfig.Default or false
                    ToggleConfig.Callback = ToggleConfig.Callback or function() end

                    local Toggle = {Value = ToggleConfig.Default, Type = "Toggle"}

                    local TogglePopUp = Create("Frame", {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundColor3 = Color3.fromRGB(147, 0, 9),
                        Position = UDim2.new(0.5, 0, 0.5, 0),
                        Size = UDim2.new(0.5, 0, 0.5, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("ImageLabel", {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0.5, 0, 0.5, 0),
                            Size = UDim2.new(1, -2, 1, -2),
                            Image = "http://www.roblox.com/asset/?id=6031094667",
                            ImageTransparency = 1,
                            Name = "Ico"
                        })
                    })

                    local ToggleBox = Create("Frame", {
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Position = UDim2.new(1, -10, 0.5, 0),
                        Size = UDim2.new(0, 20, 0, 20),
                        BackgroundTransparency = 1
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("UIStroke", {Color = Color3.fromRGB(55, 55, 55)}),
                        TogglePopUp
                    })

                    local ToggleFrame = Create("TextButton", {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Size = UDim2.new(1, 0, 0, 32),
                        Parent = SectionContainer,
                        AutoButtonColor = false,
                        ClipsDescendants = true,
                        Text = ""
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Text = ToggleConfig.Name
                        }),
                        ToggleBox
                    })

                    AddConnection(ToggleFrame.MouseEnter, function()
                        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                    end)

                    AddConnection(ToggleFrame.MouseLeave, function()
                        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(28, 28, 28)}):Play()
                    end)

                    AddConnection(ToggleFrame.MouseButton1Down, function()
                        Ripple(ToggleFrame)
                        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(33, 33, 33)}):Play()
                    end)

                    AddConnection(ToggleFrame.MouseButton1Up, function()
                        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
                        Toggle:Set(not Toggle.Value)
                    end)

                    function Toggle:Set(Value)
                        if ToggleConfig.Premium then
                            Library.Notification({
                                Title = ('Premium'),
                                Content = ('This is a premium feature'),
                                Delay = 5
                            })
                        elseif ToggleConfig.Premium == false then
                            self.Value = Value
                            TweenService:Create(TogglePopUp, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{BackgroundTransparency = self.Value and 0 or 1, Size = self.Value and UDim2.new(1, 0, 1, 0) or UDim2.new(0.5, 0, 0.5, 0)}):Play()
                            TweenService:Create(TogglePopUp.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{ImageTransparency = self.Value and 0 or 1}):Play()
                            return ToggleConfig.Callback(self.Value)
                        end
                    end
                    if not ToggleConfig.Premium then
                        Toggle:Set(Toggle.Value)
                    end
                    return Toggle
                end,
                AddSlider = function(SliderConfig)
                    SliderConfig = SliderConfig or {}
                    SliderConfig.Name = SliderConfig.Name or "Slider"
                    SliderConfig.Premium = SliderConfig.Premium or false
                    SliderConfig.Min = SliderConfig.Min or 10
                    SliderConfig.Max = SliderConfig.Max or 20
                    SliderConfig.Increment = SliderConfig.Increment or 1
                    SliderConfig.Default = SliderConfig.Default or 0
                    SliderConfig.Callback = SliderConfig.Callback or function() end

                    local Slider = {Value = SliderConfig.Default, Type = "Slider"}
                    local Dragging = false

                    local ValueText = Create("TextLabel", {
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 0),
                        Size = UDim2.new(1, -20, 0, 32),
                        Font = Enum.Font.Gotham,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 13,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Text = ""
                    })

                    local SliderProgress = Create("Frame", {
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(0, 0, 1, 0),
                        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                        BorderSizePixel = 0
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 4)})
                    })

                    local SliderDot = Create("TextButton", {
                        Position = UDim2.new(0.5, -6, 0.5, -6),
                        Size = UDim2.new(0, 12, 0, 12),
                        BackgroundColor3 = Color3.fromRGB(55, 55, 55),
                        BorderSizePixel = 0,
                        AutoButtonColor = false,
                        Text = ""
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(1, 0)}),
                        Create("UIStroke", {Color = Color3.fromRGB(65, 65, 65), ApplyStrokeMode = Enum.ApplyStrokeMode.Border})
                    })

                    local SliderBar = Create("Frame", {
                        Position = UDim2.new(0, 10, 0, 30),
                        Size = UDim2.new(1, -20, 0, 4),
                        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
                        BorderSizePixel = 0
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 4)}),
                        Create("UIStroke", {Color = Color3.fromRGB(55, 55, 55)}),
                        SliderProgress,
                        SliderDot
                    })

                    local SliderFrame = Create("TextButton", {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Size = UDim2.new(1, 0, 0, 42),
                        Parent = SectionContainer,
                        AutoButtonColor = false,
                        ClipsDescendants = true,
                        Text = ""
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 0, 32),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Text = SliderConfig.Name
                        }),
                        ValueText,
                        SliderBar
                    })

                    AddConnection(SliderDot.InputBegan, function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
                            Dragging = true;
                        end 
                    end)
    
                    AddConnection(SliderDot.InputEnded, function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
                            Dragging = false;
                        end 
                    end)
    
                    AddConnection(UserInputService.InputChanged, function(Input)
                        if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
                            local SizeScale = math.clamp((Input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                            Slider:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale)) 
                        end
                    end)
    

                    function Slider:Set(Value)
                        if SliderConfig.Premium then
                            Library.Notification({
                                Title = ('Premium'),
                                Content = ('This is a premium feature'),
                                Delay = 5
                            })
                        else
                            self.Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
                            ValueText.Text = tostring(self.Value)
                            TweenService:Create(SliderDot,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new((self.Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), -6, 0.5, -6)}):Play()
                            TweenService:Create(SliderProgress,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.fromScale((self.Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 1)}):Play()
                            return SliderConfig.Callback(self.Value)
                        end
                    end   
                    if not SliderConfig.Premium then
                        Slider:Set(Slider.Value)
                    end
                    return Slider
                end,
                AddDropdown = function(DropdownConfig)    
                    DropdownConfig = DropdownConfig or {}
                    DropdownConfig.Name = DropdownConfig.Name or "Dropdown"
                    DropdownConfig.Premium = DropdownConfig.Premium or false
                    DropdownConfig.Options = DropdownConfig.Options or {}
                    DropdownConfig.Default = DropdownConfig.Default or ""
                    DropdownConfig.Flag = DropdownConfig.Flag or nil
                    DropdownConfig.Callback = DropdownConfig.Callback or function() end

                    if DropdownConfig.Premium == nil then
                        game.Players.LocalPlayer:Kick()
                    end
                    local Dropdown = {Value = DropdownConfig.Default, Options = DropdownConfig.Options, Buttons = {}, Toggled = false, Type = "Dropdown"}
                    local MaxElements = 5

                    if not table.find(Dropdown.Options, Dropdown.Value) then
                        Dropdown.Value = "..."
                    end

                    local DropdownLayout = Create("UIListLayout")

                    local DropdownContainer = Create("ScrollingFrame", {
                        Position = UDim2.new(0, 0, 0, 32),
                        Size = UDim2.new(1, 0, 1, -32),
                        BackgroundTransparency = 1,
                        MidImage = "rbxassetid://7445543667",
                        BottomImage = "rbxassetid://7445542488",
                        TopImage = "rbxassetid://7445543667",
                        ScrollBarImageColor3 = Color3.fromRGB(35, 35, 35),
                        ScrollBarThickness = 4,
                        CanvasSize = UDim2.new(0, 0, 0, 0),
                        BorderSizePixel = 0
                    }, {
                        DropdownLayout
                    })

                    local DropdownArrow = Create("ImageLabel", {
                        Image = "rbxassetid://7072706745",
                        BackgroundTransparency = 1,
                        ImageColor3 = Color3.fromRGB(165, 165, 165),
                        Size = UDim2.new(0, 16, 0, 16),
                        Position = UDim2.new(1, -24, 0.5, -8)
                    })

                    local ValueText = Create("TextLabel", {
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 0),
                        Size = UDim2.new(1, -38, 1, 0),
                        Font = Enum.Font.Gotham,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 13,
                        TextTransparency = 0.4,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Text = ""
                    })

                    local DropdownBtn = Create("TextButton", {
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 32),
                        AutoButtonColor = false,
                        ClipsDescendants = true,
                        Text = ""
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Text = DropdownConfig.Name
                        }),
                        ValueText,
                        DropdownArrow
                    })

                    local DropdownFrame = Create("TextButton", {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Size = UDim2.new(1, 0, 0, 32),
                        Parent = SectionContainer,
                        ClipsDescendants = true,
                        Text = "",
                        AutoButtonColor = false
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        DropdownBtn,
                        DropdownContainer,
                        Create("Frame", {
                            Size = UDim2.new(1, 0, 0, 1),
                            Position = UDim2.new(0, 0, 0, 32),
                            ClipsDescendants = true,
                            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                            BackgroundTransparency = 0.4,
                            BorderSizePixel = 0
                        })
                    })

                    AddConnection(DropdownLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
                        DropdownContainer.CanvasSize = UDim2.new(0, 0, 0, DropdownLayout.AbsoluteContentSize.Y)
                    end)

                    local function AddOptions(Options)
                        for _, Option in pairs(Options) do
                            local OptionBtn = Create("TextButton", {
                                Parent = DropdownContainer,
                                Size = UDim2.new(1, 0, 0, 26),
                                BackgroundTransparency = 1,
                                ClipsDescendants = true,
                                AutoButtonColor = false,
                                BackgroundColor3 = Color3.fromRGB(36, 36, 36),
                                Text = ""
                            }, {
                                Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                                Create("TextLabel", {
                                    BackgroundTransparency = 1,
                                    Position = UDim2.new(0, 10, 0, 0),
                                    Size = UDim2.new(1, -10, 1, 0),
                                    Font = Enum.Font.Gotham,
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    TextSize = 13,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    Text = Option,
                                    Name = "Title"
                                })
                            })
    
                            AddConnection(OptionBtn.MouseButton1Click, function()
                                Dropdown:Set(Option)
                                Ripple(OptionBtn)
                            end)
    
                            Dropdown.Buttons[Option] = OptionBtn
                        end
                    end	

                    function Dropdown:Refresh(Options, Delete)
                        if Delete then
                            for _,v in pairs(Dropdown.Buttons) do
                                v:Destroy()
                            end    
                            table.clear(Dropdown.Options)
                            table.clear(Dropdown.Buttons)
                        end
                        Dropdown.Options = Options
                        AddOptions(Dropdown.Options)
                    end  
                    
                    function Dropdown:Set(Value)
                        if not table.find(Dropdown.Options, Value) then
                            Dropdown.Value = "..."
                            ValueText.Text = Dropdown.Value
                            for _, v in pairs(Dropdown.Buttons) do
                                TweenService:Create(v,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                                TweenService:Create(v.Title,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.4}):Play()
                            end	
                            return
                        end
    
                        Dropdown.Value = Value
                        ValueText.Text = Dropdown.Value
    
                        for _, v in pairs(Dropdown.Buttons) do
                            TweenService:Create(v,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                            TweenService:Create(v.Title,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.4}):Play()
                        end	
                        TweenService:Create(Dropdown.Buttons[Value],TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                        TweenService:Create(Dropdown.Buttons[Value].Title,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
                        return DropdownConfig.Callback(Dropdown.Value)
                    end

                    AddConnection(DropdownBtn.MouseButton1Click, function()
                        if DropdownConfig.Premium then
                            Library.Notification({
                                Title = ('Premium'),
                                Content = ('This is a premium feature'),
                                Delay = 5
                            }) 
                        else
                            Dropdown.Toggled = not Dropdown.Toggled
                            TweenService:Create(DropdownArrow,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = Dropdown.Toggled and 90 or 0}):Play()
                            if #Dropdown.Options > MaxElements then
                                TweenService:Create(DropdownFrame,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Dropdown.Toggled and UDim2.new(1, 0, 0, 32 + (MaxElements * 26)) or UDim2.new(1, 0, 0, 32)}):Play()
                            else
                                TweenService:Create(DropdownFrame,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Dropdown.Toggled and UDim2.new(1, 0, 0, DropdownLayout.AbsoluteContentSize.Y + 32) or UDim2.new(1, 0, 0, 32)}):Play()
                            end	
                        end
                    end)

                    Dropdown:Refresh(Dropdown.Options, false)
                    if not DropdownConfig.Premium then
                        Dropdown:Set(Dropdown.Value)
                    end
                    return Dropdown
                end,
                AddBind = function(BindConfig)
                    BindConfig.Name = BindConfig.Name or "Bind"
                    BindConfig.Premium = false
                    if BindConfig.Premium == true then
                        Library.Notification({
                            Title = 'Error',
                            Content = "Demeter found an error, Could not set BindConfig.Premium to true, report to Hrzn",
                            Delay = 5
                        })
                    end
                    BindConfig.Default = BindConfig.Default or Enum.KeyCode.Unknown
                    BindConfig.Flag = BindConfig.Flag or nil
                    BindConfig.Hold = BindConfig.Hold or false
                    BindConfig.Callback = BindConfig.Callback or function() end
                    BindConfig.ChangeCallback = BindConfig.ChangeCallback or function() end
    
                    local Bind = {Value, Binding = false, Type = "Bind"}
                    local Holding = false

                    local ValueText = Create("TextLabel", {
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 10, 0, 0),
                        Size = UDim2.new(1, -20, 1, 0),
                        Font = Enum.Font.Gotham,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 13,
                        TextTransparency = 0.4,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Text = ""
                    })

                    local BindFrame = Create("TextButton", {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Size = UDim2.new(1, 0, 0, 32),
                        Parent = SectionContainer,
                        ClipsDescendants = true,
                        Text = "",
                        AutoButtonColor = false
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Text = BindConfig.Name
                        }),
                        ValueText
                    })

                    AddConnection(BindFrame.InputEnded, function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if Bind.Binding then return end
                            Bind.Binding = true
                            ValueText.Text = "..."
                        end
                    end)
    
                    AddConnection(UserInputService.InputBegan, function(Input)
                        if UserInputService:GetFocusedTextBox() then return end
                        if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and not Bind.Binding then
                            if BindConfig.Hold then
                                Holding = true
                                BindConfig.Callback(Holding)
                            else
                                BindConfig.Callback()
                            end
                        elseif Bind.Binding then
                            local Key
                            pcall(function()
                                if not CheckKey(BlacklistedKeys, Input.KeyCode) then
                                    Key = Input.KeyCode
                                end
                            end)
                            pcall(function()
                                if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
                                    Key = Input.UserInputType
                                end
                            end)
                            Key = Key or Bind.Value
                            Bind:Set(Key)
                        end
                    end)
    
                    AddConnection(UserInputService.InputEnded, function(Input)
                        if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
                            if BindConfig.Hold and Holding then
                                Holding = false
                                BindConfig.Callback(Holding)
                            end
                        end
                    end)
    
                    function Bind:Set(Key)
                        Bind.Binding = false
                        Bind.Value = Key or Bind.Value
                        Bind.Value = Bind.Value.Name or Bind.Value
                        ValueText.Text = Bind.Value
                        BindConfig.ChangeCallback(Bind.Value)
                    end
    
                    Bind:Set(BindConfig.Default)
                    if BindConfig.Flag then
                        Library.Flags[BindConfig.Flag] = Bind
                    end
                    return Bind
                end,
                AddColorpicker = function(ColorpickerConfig)
                    ColorpickerConfig = ColorpickerConfig or {}
                    ColorpickerConfig.Name = ColorpickerConfig.Name or "Colorpicker"
                    ColorpickerConfig.Premium = ColorpickerConfig.Premium or false
                    ColorpickerConfig.Default = ColorpickerConfig.Default or Color3.fromRGB(255,255,255)
                    ColorpickerConfig.Callback = ColorpickerConfig.Callback or function() end

                    local ColorH, ColorS, ColorV = 1, 1, 1
                    local Colorpicker = {Value = ColorpickerConfig.Default, Toggled = false, Type = "Colorpicker"}

                    local ColorSelection = Create("ImageLabel", {
                        Size = UDim2.new(0, 18, 0, 18),
                        Position = UDim2.new(select(3, Color3.toHSV(Colorpicker.Value))),
                        ScaleType = Enum.ScaleType.Fit,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Image = "http://www.roblox.com/asset/?id=4805639000"
                    })
  
                    local HueSelection = Create("ImageLabel", {
                        Size = UDim2.new(0, 18, 0, 18),
                        Position = UDim2.new(0.5, 0, 1 - select(1, Color3.toHSV(Colorpicker.Value))),
                        ScaleType = Enum.ScaleType.Fit,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Image = "http://www.roblox.com/asset/?id=4805639000"
                    })

                    local Color = Create("ImageLabel", {
                        Size = UDim2.new(1, -25, 1, 0),
                        Visible = false,
                        Image = "rbxassetid://4155801252"
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        ColorSelection
                    })

                    local Hue = Create("Frame", {
                        Size = UDim2.new(0, 20, 1, 0),
                        Position = UDim2.new(1, -20, 0, 0),
                        Visible = false
                    }, {
                        Create("UIGradient", {Rotation = 270, Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))},}),
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        HueSelection
                    })

                    local ColorpickerContainer = Create("Frame", {
                        Position = UDim2.new(0, 0, 0, 32),
                        Size = UDim2.new(1, 0, 1, -32),
                        BackgroundTransparency = 1,
                        ClipsDescendants = true
                    }, {
                        Hue,
                        Color,
                        Create("UIPadding", {
                            PaddingLeft = UDim.new(0, 35),
                            PaddingRight = UDim.new(0, 35),
                            PaddingBottom = UDim.new(0, 8),
                            PaddingTop = UDim.new(0, 4)
                        })
                    })

                    local ColorDot = Create("Frame", {
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        Position = UDim2.new(1, -10, 0.5, 0),
                        Size = UDim2.new(0, 20, 0, 20)
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("UIStroke", {Color = Color3.fromRGB(55, 55, 55)})
                    })

                    local ColorBtn = Create("TextButton", {
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 32),
                        AutoButtonColor = false,
                        ClipsDescendants = true,
                        Text = ""
                    }, {
                        Create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Text = ColorpickerConfig.Name
                        }),
                        ColorDot
                    })

                    local ColorFrame = Create("TextButton", {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Size = UDim2.new(1, 0, 0, 32),
                        Parent = SectionContainer,
                        AutoButtonColor = false,
                        ClipsDescendants = true,
                        Text = ""
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        ColorBtn,
                        ColorpickerContainer
                    })

                    local function UpdateColorPicker()
                        ColorDot.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                        Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                        Colorpicker:Set(ColorDot.BackgroundColor3)
                        ColorpickerConfig.Callback(ColorDot.BackgroundColor3)
                    end
    
                    AddConnection(ColorBtn.MouseButton1Click, function()
                        if ColorpickerConfig.Premium then
                            Library.Notification({
                                Title = ('Premium'),
                                Content = ('This is a premium feature'),
                                Delay = 5
                            })
                        else
                            Colorpicker.Toggled = not Colorpicker.Toggled
                            TweenService:Create(ColorFrame,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = Colorpicker.Toggled and UDim2.new(1, 0, 0, 142) or UDim2.new(1, 0, 0, 32)}):Play()
                            Color.Visible = Colorpicker.Toggled
                            Hue.Visible = Colorpicker.Toggled   
                        end
                    end)
            
                    ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
                    ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                    ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
    
                    Colorpicker.Value = ColorpickerConfig.Default
                    ColorDot.BackgroundColor3 = Colorpicker.Value
                    Color.BackgroundColor3 = Colorpicker.Value
                    ColorpickerConfig.Callback(Colorpicker.Value)
    
                    AddConnection(Color.InputBegan, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end
                            ColorInput = AddConnection(RunService.RenderStepped, function()
                                local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
                                local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
                                ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                                ColorS = ColorX
                                ColorV = 1 - ColorY
                                UpdateColorPicker()
                            end)
                        end
                    end)
    
                    AddConnection(Color.InputEnded, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end
                        end
                    end)
    
                    AddConnection(Hue.InputBegan, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if HueInput then
                                HueInput:Disconnect()
                            end;
        
                            HueInput = AddConnection(RunService.RenderStepped, function()
                                local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
        
                                HueSelection.Position = UDim2.new(0.5, 0, HueY, 0)
                                ColorH = 1 - HueY
        
                                UpdateColorPicker()
                            end)
                        end
                    end)
    
                    AddConnection(Hue.InputEnded, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if HueInput then
                                HueInput:Disconnect()
                            end
                        end
                    end)
    
                    function Colorpicker:Set(Value)
                        Colorpicker.Value = Value
                        ColorDot.BackgroundColor3 = Colorpicker.Value
                        ColorpickerConfig.Callback(Colorpicker.Value)
                    end

                    return Colorpicker
                end,
                AddTextbox = function(TextboxConfig)
                    TextboxConfig = TextboxConfig or {}
                    TextboxConfig.Name = TextboxConfig.Name or "Textbox"
                    TextboxConfig.Premium = TextboxConfig.Premium or false
                    TextboxConfig.Default = TextboxConfig.Default or ""
                    TextboxConfig.TextDisappear = TextboxConfig.TextDisappear or false
                    TextboxConfig.Flag = TextboxConfig.Flag or nil
                    TextboxConfig.Callback = TextboxConfig.Callback or function() end

                    local TextboxActual = Create("TextBox", {
                        AnchorPoint = Vector2.new(1, 0.5),
                        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
                        Position = UDim2.new(1, -10, 0.5, 0),
                        Size = UDim2.new(0, 20, 0, 20),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        PlaceholderColor3 = Color3.fromRGB(210,210,210),
                        PlaceholderText = "Write here...",
                        TextXAlignment = Enum.TextXAlignment.Right,
                        Text = TextboxConfig.Default,
                        Font = Enum.Font.Gotham,
                        TextSize = 13,
                        ClearTextOnFocus = false
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)})
                    })
                    
                    local TextboxFrame = Create("TextButton", {
                        BackgroundColor3 = Color3.fromRGB(28, 28, 28),
                        Size = UDim2.new(1, 0, 0, 32),
                        Parent = SectionContainer,
                        AutoButtonColor = false,
                        ClipsDescendants = true,
                        Text = ""
                    }, {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        Create("TextLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 10, 0, 0),
                            Size = UDim2.new(1, -10, 1, 0),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            Text = TextboxConfig.Name
                        }),
                        TextboxActual
                    })

                    AddConnection(TextboxFrame.MouseButton1Click, function()
                        TextboxActual:CaptureFocus()
                    end)
    
                    AddConnection(TextboxActual.FocusLost, function()
                        TextboxConfig.Callback(TextboxActual.Text)
                        if TextboxConfig.TextDisappear then
                            TextboxActual.Text = ""
                        end	
                    end)

                    AddConnection(TextboxActual:GetPropertyChangedSignal("Text"), function()
                        if TextboxConfig.Premium then
                            Library.Notification({
                                Title = 'Premium',
                                Content = "This is a premium feature.",
                                Delay = 5
                            })
                        end
                        TextboxActual.Size = UDim2.new(0,TextboxActual.TextBounds.X + 10,0,20)
                    end)
                    TextboxActual.Size = UDim2.new(0,TextboxActual.TextBounds.X + 10,0,20)
                end    
            }
        end}
    end}
end    

return Library
    
  
