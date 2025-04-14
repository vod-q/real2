local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "d0632c30c8af0316aae11552dcb2a21d"
local sigmakey
local KeyCheckingButtonSex
local ApiStatusCode

local function makeUI()
	local scringui = Instance.new("ScreenGui")
	scringui.Name = "KeySystem"
	scringui.Parent = game.CoreGui
	local blurEffect = Instance.new("BlurEffect")
	blurEffect.Size = 0
	blurEffect.Name = "KeySystemBlur"
	blurEffect.Parent = game:GetService("Lighting")
	local Background = Instance.new("Frame")
	Background.Name = "Background"
	Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Background.BackgroundTransparency = 0.5
	Background.Size = UDim2.new(1.5, 0, 1.5, 0)
	Background.Position = UDim2.new(0.5, 0, 0.3, 0)
	Background.AnchorPoint = Vector2.new(0.5, 0.5)
	Background.ZIndex = 10
	Background.Parent = scringui

	local Frame = Instance.new("Frame")
	Frame.Size = UDim2.new(0, 0, 0, 0)
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(30, 35, 30)
	Frame.BorderSizePixel = 0
	Frame.ZIndex = 11
	Frame.Parent = scringui

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner.Parent = Frame

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.fromRGB(97, 255, 140)
	UIStroke.Thickness = 2
	UIStroke.Parent = Frame

	local TitleBar = Instance.new("Frame")
	TitleBar.Name = "TitleBar"
	TitleBar.BackgroundColor3 = Color3.fromRGB(40, 45, 40)
	TitleBar.Size = UDim2.new(1, 0, 0, 40)
	TitleBar.ZIndex = 12
	TitleBar.Parent = Frame

	local TitleUICorner = Instance.new("UICorner")
	TitleUICorner.CornerRadius = UDim.new(0, 8)
	TitleUICorner.Parent = TitleBar

	local CornerFix = Instance.new("Frame")
	CornerFix.Name = "CornerFix"
	CornerFix.BackgroundColor3 = Color3.fromRGB(40, 45, 40)
	CornerFix.BorderSizePixel = 0
	CornerFix.Position = UDim2.new(0, 0, 1, -10)
	CornerFix.Size = UDim2.new(1, 0, 0, 10)
	CornerFix.ZIndex = 12
	CornerFix.Parent = TitleBar

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, 0, 1, 0)
	Title.AnchorPoint = Vector2.new(0.5, 0.5)
	Title.Position = UDim2.new(0.5, 0, 0.5, 0)
	Title.Text = "Key Authentication"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1
	Title.TextSize = 16
	Title.Font = Enum.Font.GothamBold
	Title.ZIndex = 13
	Title.Parent = TitleBar

	local CloseButton = Instance.new("TextButton")
	CloseButton.Size = UDim2.new(0, 30, 0, 30)
	CloseButton.Position = UDim2.new(1, -35, 0, 5)
	CloseButton.AnchorPoint = Vector2.new(0, 0)
	CloseButton.Text = "X"
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
	CloseButton.BackgroundTransparency = 0.7
	CloseButton.BorderSizePixel = 0
	CloseButton.Font = Enum.Font.GothamBold
	CloseButton.TextSize = 14
	CloseButton.ZIndex = 14
	CloseButton.Parent = TitleBar
	CloseButton.AutoButtonColor = false

	local CloseCorner = Instance.new("UICorner")
	CloseCorner.CornerRadius = UDim.new(0, 6)
	CloseCorner.Parent = CloseButton

	CloseButton.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), { BackgroundTransparency = 0.3 }):Play()
	end)

	CloseButton.MouseLeave:Connect(function()
		game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.2), { BackgroundTransparency = 0.7 }):Play()
	end)

	CloseButton.Activated:Connect(function()
		game:GetService("TweenService"):Create(blurEffect, TweenInfo.new(0.3), { Size = 0 }):Play()

		local closeTween = game:GetService("TweenService"):Create(
			Frame,
			TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
			{ Size = UDim2.new(0, 0, 0, 0) }
		)
		closeTween:Play()

		closeTween.Completed:Connect(function()
			blurEffect:Destroy()
			scringui:Destroy()
		end)
	end)

	local KeyIcon = Instance.new("ImageLabel")
	KeyIcon.Name = "KeyIcon"
	KeyIcon.BackgroundTransparency = 1
	KeyIcon.AnchorPoint = Vector2.new(0.5, 0)
	KeyIcon.Position = UDim2.new(0.5, 0, 0, 60)
	KeyIcon.Size = UDim2.new(0, 48, 0, 48)
	KeyIcon.ZIndex = 12
	KeyIcon.Image = "rbxassetid://6031302931"
	KeyIcon.ImageColor3 = Color3.fromRGB(230, 255, 180)
	KeyIcon.Parent = Frame

	local TextBox = Instance.new("TextBox")
	TextBox.Size = UDim2.new(0.85, 0, 0, 40)
	TextBox.Position = UDim2.new(0.5, 0, 0, 130)
	TextBox.AnchorPoint = Vector2.new(0.5, 0)
	TextBox.Text = ""
	TextBox.PlaceholderText = "Enter Key Here"
	TextBox.Parent = Frame
	TextBox.BackgroundColor3 = Color3.fromRGB(60, 65, 60)
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.BorderSizePixel = 0
	TextBox.Font = Enum.Font.Gotham
	TextBox.TextSize = 16
	TextBox.ClearTextOnFocus = true
	TextBox.ZIndex = 12

	local UICornerTextBox = Instance.new("UICorner")
	UICornerTextBox.CornerRadius = UDim.new(0, 6)
	UICornerTextBox.Parent = TextBox

	local StatusLabel = Instance.new("TextLabel")
	StatusLabel.Size = UDim2.new(0.85, 0, 0, 25)
	StatusLabel.Position = UDim2.new(0.5, 0, 1, -95)
	StatusLabel.AnchorPoint = Vector2.new(0.5, 0)
	StatusLabel.Text = "Enter your key to continue"
	StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	StatusLabel.BackgroundTransparency = 1
	StatusLabel.TextSize = 15
	StatusLabel.Font = Enum.Font.Gotham
	StatusLabel.ZIndex = 12
	StatusLabel.Parent = Frame

	local LoadingBarContainer = Instance.new("Frame")
	LoadingBarContainer.Size = UDim2.new(0.85, 0, 0, 10)
	LoadingBarContainer.Position = UDim2.new(0.5, 0, 1, -65)
	LoadingBarContainer.AnchorPoint = Vector2.new(0.5, 0)
	LoadingBarContainer.BackgroundColor3 = Color3.fromRGB(50, 55, 50)
	LoadingBarContainer.BorderSizePixel = 0
	LoadingBarContainer.ZIndex = 12
	LoadingBarContainer.Visible = false
	LoadingBarContainer.Parent = Frame

	local UICornerLoading = Instance.new("UICorner")
	UICornerLoading.CornerRadius = UDim.new(0, 4)
	UICornerLoading.Parent = LoadingBarContainer

	local LoadingBarFill = Instance.new("Frame")
	LoadingBarFill.Size = UDim2.new(0, 0, 1, 0)
	LoadingBarFill.BackgroundColor3 = Color3.fromRGB(97, 255, 140)
	LoadingBarFill.BorderSizePixel = 0
	LoadingBarFill.ZIndex = 13
	LoadingBarFill.Parent = LoadingBarContainer

	local UICornerFill = Instance.new("UICorner")
	UICornerFill.CornerRadius = UDim.new(0, 4)
	UICornerFill.Parent = LoadingBarFill

	-- Loading Text
	local LoadingText = Instance.new("TextLabel")
	LoadingText.Size = UDim2.new(0.85, 0, 0, 20)
	LoadingText.Position = UDim2.new(0.5, 0, 1, -85)
	LoadingText.AnchorPoint = Vector2.new(0.5, 0)
	LoadingText.Text = "Loading..."
	LoadingText.TextColor3 = Color3.fromRGB(97, 255, 140)
	LoadingText.BackgroundTransparency = 1
	LoadingText.TextSize = 14
	LoadingText.Font = Enum.Font.GothamBold
	LoadingText.ZIndex = 12
	LoadingText.Visible = false
	LoadingText.Parent = Frame

	local ButtonsFrame = Instance.new("Frame")
	ButtonsFrame.Name = "ButtonsFrame"
	ButtonsFrame.BackgroundTransparency = 1
	ButtonsFrame.AnchorPoint = Vector2.new(0.5, 1)
	ButtonsFrame.Position = UDim2.new(0.5, 0, 1, -20)
	ButtonsFrame.Size = UDim2.new(0.9, 0, 0, 50)
	ButtonsFrame.ZIndex = 12
	ButtonsFrame.Parent = Frame

	local listLayout = Instance.new("UIListLayout")
	listLayout.FillDirection = Enum.FillDirection.Horizontal
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	listLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	listLayout.Padding = UDim.new(0, 20)
	listLayout.Parent = ButtonsFrame

	local function MakeSigmaButton(text, color, hoverColor)
		local Button = Instance.new("TextButton")
		Button.Size = UDim2.new(0, 145, 0, 42)
		Button.Text = text
		Button.Parent = ButtonsFrame
		Button.BackgroundColor3 = color
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.BorderSizePixel = 0
		Button.Font = Enum.Font.GothamBold
		Button.TextSize = 15
		Button.ZIndex = 12
		Button.AutoButtonColor = false

		local UICornerButton = Instance.new("UICorner")
		UICornerButton.CornerRadius = UDim.new(0, 6)
		UICornerButton.Parent = Button

		Button.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), { BackgroundColor3 = hoverColor }):Play()
		end)

		Button.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), { BackgroundColor3 = color }):Play()
		end)

		return Button
	end

	local GetFartButton = MakeSigmaButton("Get Key", Color3.fromRGB(60, 65, 60), Color3.fromRGB(80, 85, 80))
	GetFartButton.Activated:Connect(function()
		GetFartButton.Active = false
		GetFartButton.AutoButtonColor = false
		game:GetService("TweenService"):Create(
			GetFartButton,
			TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
			{ Size = UDim2.new(0, 100, 0, 35), BackgroundTransparency = 0.5 }
		):Play()

		game:GetService("TweenService"):Create(
			GetFartButton,
			TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{ Size = UDim2.new(0, 0, 0, 35), Position = UDim2.new(-0.2, 0, 0, 0) }
		):Play()

		local text = GetFartButton.Text
		local len = string.len(text)

		for i = len, 1, -1 do
			task.delay(0.015 * (len - i + 1), function()
				GetFartButton.Text = string.sub(text, 1, i - 1)
			end)
		end
		task.delay(0.1, function()
			GetFartButton:Destroy()
		end)

		task.delay(0.17, function()
			GetFartButton:Destroy()
		end)

		local KeyProvidersPanel = Instance.new("Frame")
		KeyProvidersPanel.Size = UDim2.new(0.8, 0, 0, 0)
		KeyProvidersPanel.Position = UDim2.new(0.5, 0, 1, 10)
		KeyProvidersPanel.AnchorPoint = Vector2.new(0.5, 0)
		KeyProvidersPanel.BackgroundColor3 = Color3.fromRGB(30, 35, 30)
		KeyProvidersPanel.BorderSizePixel = 0
		KeyProvidersPanel.ZIndex = 20
		KeyProvidersPanel.Parent = Frame

		local PanelCorner = Instance.new("UICorner")
		PanelCorner.CornerRadius = UDim.new(0, 8)
		PanelCorner.Parent = KeyProvidersPanel

		local PanelStroke = Instance.new("UIStroke")
		PanelStroke.Color = Color3.fromRGB(97, 255, 140)
		PanelStroke.Thickness = 2
		PanelStroke.Parent = KeyProvidersPanel

		local ProvidersContainer = Instance.new("Frame")
		ProvidersContainer.Size = UDim2.new(1, -20, 1, -10)
		ProvidersContainer.Position = UDim2.new(0.5, 0, 0, 5)
		ProvidersContainer.AnchorPoint = Vector2.new(0.5, 0)
		ProvidersContainer.BackgroundTransparency = 1
		ProvidersContainer.ZIndex = 21
		ProvidersContainer.Parent = KeyProvidersPanel

		local ProvidersList = Instance.new("UIListLayout")
		ProvidersList.FillDirection = Enum.FillDirection.Horizontal
		ProvidersList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ProvidersList.VerticalAlignment = Enum.VerticalAlignment.Center
		ProvidersList.Padding = UDim.new(0, 10)
		ProvidersList.Parent = ProvidersContainer

		game:GetService("TweenService"):Create(
			KeyProvidersPanel,
			TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
			{Size = UDim2.new(1, 0, 0, 80)}
		):Play()

		local PanelGlow = Instance.new("ImageLabel")
		PanelGlow.BackgroundTransparency = 1
		PanelGlow.Image = "rbxassetid://7331400934"
		PanelGlow.ImageColor3 = Color3.fromRGB(97, 255, 140)
		PanelGlow.ImageTransparency = 0.7
		PanelGlow.Size = UDim2.new(1.2, 0, 1.2, 0)
		PanelGlow.Position = UDim2.new(-0.1, 0, -0.1, 0)
		PanelGlow.ZIndex = 19
		PanelGlow.Parent = KeyProvidersPanel

		game:GetService("TweenService"):Create(
			PanelGlow,
			TweenInfo.new(0.8),
			{ImageTransparency = 0.9}
		):Play()

		local function MakeKeyProviderButton(text, icon, color, hoverColor)
			local Button = Instance.new("Frame")
			Button.Size = UDim2.new(0.3, 6, 0, 65)
			Button.BackgroundColor3 = color
			Button.BorderSizePixel = 0
			Button.ZIndex = 22
			Button.Parent = ProvidersContainer

			local UICornerButton = Instance.new("UICorner")
			UICornerButton.CornerRadius = UDim.new(0, 6)
			UICornerButton.Parent = Button

			local Gradient = Instance.new("UIGradient")
			Gradient.Rotation = 90
			Gradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, color),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(
					math.clamp(color.R * 0.8, 0, 1) * 255,
					math.clamp(color.G * 0.8, 0, 1) * 255,
					math.clamp(color.B * 0.8, 0, 1) * 255
				))
			})
			Gradient.Parent = Button

			local Keypoopericon = Instance.new("ImageLabel")
			Keypoopericon.BackgroundTransparency = 1
			Keypoopericon.AnchorPoint = Vector2.new(0.5, 0)
			Keypoopericon.Position = UDim2.new(0.5, 0, 0, 6)
			Keypoopericon.Size = UDim2.new(0, 24, 0, 24)
			Keypoopericon.ZIndex = 23
			Keypoopericon.Image = "rbxassetid://" .. icon
			Keypoopericon.Parent = Button

			local PooperName = Instance.new("TextLabel")
			PooperName.Size = UDim2.new(1, 0, 0, 20)
			PooperName.Position = UDim2.new(0, 0, 1, -24)
			PooperName.Text = text
			PooperName.TextColor3 = Color3.fromRGB(255, 255, 255)
			PooperName.BackgroundTransparency = 1
			PooperName.TextSize = 12
			PooperName.Font = Enum.Font.GothamBold
			PooperName.ZIndex = 23
			PooperName.Parent = Button

			local ButtonForgot = Instance.new("TextButton")
			ButtonForgot.Size = UDim2.new(1, 0, 1, 0)
			ButtonForgot.Position = UDim2.new(0, 0, 0, 0)
			ButtonForgot.BackgroundTransparency = 1
			ButtonForgot.Text = ""
			ButtonForgot.ZIndex = 24
			ButtonForgot.Parent = Button

			local GlowyButtonThing = Instance.new("ImageLabel")
			GlowyButtonThing.BackgroundTransparency = 1
			GlowyButtonThing.Image = "rbxassetid://7331400934"
			GlowyButtonThing.ImageColor3 = Color3.fromRGB(255, 255, 255)
			GlowyButtonThing.ImageTransparency = 1
			GlowyButtonThing.Size = UDim2.new(1.2, 0, 1.2, 0)
			GlowyButtonThing.Position = UDim2.new(-0.1, 0, -0.1, 0)
			GlowyButtonThing.ZIndex = 21
			GlowyButtonThing.Parent = Button

			ButtonForgot.MouseEnter:Connect(function()
				game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), { BackgroundColor3 = hoverColor }):Play()
				game:GetService("TweenService"):Create(GlowyButtonThing, TweenInfo.new(0.2), { ImageTransparency = 0.7 }):Play()
			end)

			ButtonForgot.MouseLeave:Connect(function()
				game:GetService("TweenService"):Create(Button, TweenInfo.new(0.2), { BackgroundColor3 = color }):Play()
				game:GetService("TweenService"):Create(GlowyButtonThing, TweenInfo.new(0.2), { ImageTransparency = 1 }):Play()
			end)

			return ButtonForgot
		end

		local Lootlibs = MakeKeyProviderButton(
			"LootLabs",
			"89429366953434",
			Color3.fromRGB(60, 65, 60),
			Color3.fromRGB(80, 85, 80)
		)

		local Workinky = MakeKeyProviderButton(
			"WorKink",
			"80731952209461",
			Color3.fromRGB(60, 65, 60),
			Color3.fromRGB(80, 85, 80)
		)

		local Linkvertis = MakeKeyProviderButton(
			"Linkvertise",
			"91094527924039",
			Color3.fromRGB(60, 65, 60),
			Color3.fromRGB(80, 85, 80)
		)

		local function MakeParticleSystsmeWHATUNITYPARTICLESYSTEM(button)
			for i = 1, 6 do
				local PARTICL = Instance.new("Frame")
				PARTICL.BackgroundColor3 = Color3.fromRGB(97, 255, 140)
				PARTICL.BackgroundTransparency = 0.7
				PARTICL.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
				PARTICL.Position = UDim2.new(0.5, math.random(-50, 50), 0.5, math.random(-20, 20))
				PARTICL.ZIndex = 30
				PARTICL.Parent = button

				local particleCorner = Instance.new("UICorner")
				particleCorner.CornerRadius = UDim.new(1, 0)
				particleCorner.Parent = PARTICL

				game:GetService("TweenService"):Create(
					PARTICL, 
					TweenInfo.new(0.5),
					{
						BackgroundTransparency = 1,
						Position = UDim2.new(PARTICL.Position.X.Scale, PARTICL.Position.X.Offset, 
											PARTICL.Position.Y.Scale - 0.3, PARTICL.Position.Y.Offset)
					}
				):Play()

				game:GetService("Debris"):AddItem(PARTICL, 0.5)
			end
		end

		Lootlibs.Activated:Connect(function()
			setclipboard("https://loot-labs.com/fartsaken-key")
			StatusLabel.Text = "LootLabs link copied to clipboard!"
			MakeParticleSystsmeWHATUNITYPARTICLESYSTEM(Lootlibs.Parent)
		end)

		Workinky.Activated:Connect(function()
			setclipboard("https://workink.net/1Q8c/fartsaken-key")
			StatusLabel.Text = "WorKink link copied to clipboard!"
			MakeParticleSystsmeWHATUNITYPARTICLESYSTEM(Workinky.Parent)
		end)

		Linkvertis.Activated:Connect(function()
			setclipboard("https://link-target.net/506927/fartsaken-key-link")
			StatusLabel.Text = "Linkvertise link copied to clipboard!"
			MakeParticleSystsmeWHATUNITYPARTICLESYSTEM(Linkvertis.Parent)
		end)
	end)

	local function BESTLOADINGANIMATIONNOTFAKE()
		TextBox.Visible = false
		StatusLabel.Visible = false
		ButtonsFrame.Visible = false

		LoadingBarContainer.Visible = true
		LoadingText.Visible = true

		LoadingText.Text = "Validating key..."

		local startTime = tick()
		local duration = 1.5
		local connection

		connection = game:GetService("RunService").RenderStepped:Connect(function()
			local elapsed = tick() - startTime
			local progress = math.min(elapsed / duration, 1)

			local easedProgress = 1 - (1 - progress) ^ 3

			LoadingBarFill.Size = UDim2.new(easedProgress, 0, 1, 0)

			if progress < 0.3 then
				LoadingText.Text = "Checking key..."
			elseif progress < 0.6 then
				LoadingText.Text = "Authenticating..."
			elseif progress < 0.9 then
				LoadingText.Text = "This totaly does something..."
			else
				LoadingText.Text = "Authenticated."
			end

			if math.random() < 0.1 and progress > 0.5 then
				local particle = Instance.new("Frame")
				particle.BackgroundColor3 = Color3.fromRGB(97, 255, 140)
				particle.BackgroundTransparency = 0.7
				particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
				particle.Position =
					UDim2.new(easedProgress * math.random(80, 100) / 100, 0, math.random(-10, 10) / 10, 0)
				particle.ZIndex = 14
				particle.Parent = LoadingBarContainer

				local particleCorner = Instance.new("UICorner")
				particleCorner.CornerRadius = UDim.new(1, 0)
				particleCorner.Parent = particle

				game:GetService("TweenService")
					:Create(particle, TweenInfo.new(0.5), {
						BackgroundTransparency = 1,
						Position = UDim2.new(particle.Position.X.Scale, 0, particle.Position.Y.Scale - 0.3, 0),
					})
					:Play()

				game:GetService("Debris"):AddItem(particle, 0.5)
			end

			if progress >= 1 then
				connection:Disconnect()

				game:GetService("TweenService")
					:Create(
						LoadingBarFill,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ BackgroundColor3 = Color3.fromRGB(170, 255, 200) }
					)
					:Play()

				task.delay(0.3, function()
					game:GetService("TweenService"):Create(blurEffect, TweenInfo.new(0.3), { Size = 0 }):Play()

					local closeTween = game:GetService("TweenService"):Create(
						Frame,
						TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
						{ Size = UDim2.new(0, 0, 0, 0) }
					)
					closeTween:Play()

					closeTween.Completed:Connect(function()
						blurEffect:Destroy()
						scringui:Destroy()
					end)
				end)
			end
		end)
	end

	KeyCheckingButtonSex = MakeSigmaButton("Check Key", Color3.fromRGB(80, 180, 100), Color3.fromRGB(100, 200, 120))
	KeyCheckingButtonSex.Activated:Connect(function()
		local key = TextBox.Text:gsub("%s+", "") -- Get the entered key
		local presetKey = "bypasskey" -- Define your preset key
	
		if key == presetKey then
			StatusLabel.Text = "Key Validated!"
			StatusLabel.TextColor3 = Color3.fromRGB(97, 255, 140)
			sigmakey = key
			ApiStatusCode = "KEY_VALID"
	
			-- Directly proceed to load the main script
			task.delay(0.5, function()
				BESTLOADINGANIMATIONNOTFAKE() -- Simulate loading animation
			end)
		else
			StatusLabel.Text = "Invalid Key. Try Again."
			StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
	end)
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function SigmaDrag(input)
		local delta = input.Position - dragStart
		local targetPosition =
			UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService("TweenService")
			:Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = targetPosition,
			})
			:Play()
	end

	TitleBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	TitleBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			SigmaDrag(input)
		end
	end)

	game:GetService("TweenService"):Create(blurEffect, TweenInfo.new(0.3), { Size = 10 }):Play()

	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local tween = game:GetService("TweenService"):Create(Frame, tweenInfo, { Size = UDim2.new(0, 380, 0, 280) })
	tween:Play()

	return scringui
end

makeUI()