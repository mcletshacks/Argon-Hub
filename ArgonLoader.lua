local loading = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local Bar = Instance.new("Frame")
local Filler = Instance.new("Frame")
local UIGradient_2 = Instance.new("UIGradient")
local Percent = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local Shadow = Instance.new("TextLabel")
local Fade = Instance.new("Frame")

--Properties:

loading.Name = "loading"
loading.Parent = game:GetService("CoreGui")
loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = loading
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Background.BorderColor3 = Color3.fromRGB(255, 255, 255)
Background.BorderSizePixel = 4
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, 700, 0, 328)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(199, 199, 199)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(199, 199, 199))}
UIGradient.Parent = Background

Bar.Name = "Bar"
Bar.Parent = Background
Bar.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Bar.Position = UDim2.new(0.164285704, 0, 0.87537998, 0)
Bar.Size = UDim2.new(0, 469, 0, 40)

Filler.Name = "Filler"
Filler.Parent = Bar
Filler.BackgroundColor3 = Color3.fromRGB(25, 168, 9)
Filler.Size = UDim2.new(0, 0, 1, 0)

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(209, 255, 178)), ColorSequenceKeypoint.new(0.99, Color3.fromRGB(0, 85, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
UIGradient_2.Parent = Filler

Percent.Name = "Percent"
Percent.Parent = Bar
Percent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Percent.BackgroundTransparency = 1.000
Percent.Position = UDim2.new(-0.00202557445, 0, -0.0246200562, 0)
Percent.Size = UDim2.new(0, 469, 0, 41)
Percent.Font = Enum.Font.DenkOne
Percent.Text = "4.0"
Percent.TextColor3 = Color3.fromRGB(255, 255, 255)
Percent.TextSize = 16.000
Percent.TextWrapped = true

Title.Name = "Title"
Title.Parent = Background
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.255714297, 0, 0.364741623, 0)
Title.Size = UDim2.new(0, 343, 0, 89)
Title.ZIndex = 2
Title.Font = Enum.Font.FredokaOne
Title.Text = "Welcome to Argon Hub"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Shadow.Name = "Shadow"
Shadow.Parent = Title
Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow.BackgroundTransparency = 1.000
Shadow.Position = UDim2.new(-0.0183383059, 0, 0, 0)
Shadow.Size = UDim2.new(0, 341, 0, 88)
Shadow.ZIndex = 0
Shadow.Font = Enum.Font.FredokaOne
Shadow.Text = "Welcome to Argon Hub"
Shadow.TextColor3 = Color3.fromRGB(255, 255, 255)
Shadow.TextScaled = true
Shadow.TextSize = 14.000
Shadow.TextWrapped = true

Fade.Name = "Fade"
Fade.Parent = loading
Fade.AnchorPoint = Vector2.new(0.5, 0.5)
Fade.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Fade.BackgroundTransparency = 1.000
Fade.Position = UDim2.new(0.5, 0, 0.5, 0)
Fade.Size = UDim2.new(0, 700, 0, 328)

-- Scripts:

local function IYGPOEY_fake_script() -- loading.Client 
	local script = Instance.new('LocalScript', loading)

	local gui = script.Parent
	local background = gui:WaitForChild("Background")
	local bar = background:WaitForChild("Bar")
	local filler = bar:WaitForChild("Filler")
	local percentage = bar:WaitForChild("Percent")
	
	wait(2)
	
	for i = 1, 100 do
		wait(0.04)
		percentage.Text = i.."%"
		
		local formula = i/100
		
		filler:TweenSize(UDim2.new(formula, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
		
		if i == 12 or i == 23 or i == 69 or i == 91 then
			wait(0.6)
			game.Players.LocalPlayer:Kick("Argon Hub getting updated withe a new autofarm! Server will be back soon!")
		end
	end
	
	local tween = game.TweenService:Create(gui.Fade, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {["BackgroundTransparency"] = 0})
	tween:Play()
	
	tween.Completed:wait()
	
	gui.Background.Visible = false
	wait()
	
	tween = game.TweenService:Create(gui.Fade, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {["BackgroundTransparency"] = 1})
	
	tween:Play()
	tween.Completed:wait()
	
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
	
	wait()
	gui:Destroy()
end


	local hi = Instance.new("Sound")
	hi.Name = "Sound"
	hi.SoundId = "http://www.roblox.com/asset/?id=11433523082"
	hi.Volume = 0.7
	hi.Looped = false
	hi.archivable = false
	hi.Parent = game.Workspace
	hi:Play()
	wait(2)
	coroutine.wrap(IYGPOEY_fake_script)()
