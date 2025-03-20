local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "624a0bc4ce8a5660f80ecd8d6d16b2a4"

local CODE_WORD = "skibidi" -- The code word to unlock the script

local function makeUI()
    local scringui = Instance.new("ScreenGui")
    scringui.Name = "CodeSystem"
    scringui.Parent = game.CoreGui

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 320, 0, 220)
    Frame.Position = UDim2.new(0.5, -160, 0.5, -110)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.BorderSizePixel = 0
    Frame.Parent = scringui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -20, 0, 30)
    Title.Position = UDim2.new(0, 10, 0, 10)
    Title.Text = "Code Authentication"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Frame

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, -20, 0, 20)
    StatusLabel.Position = UDim2.new(0, 10, 0, 180)
    StatusLabel.Text = "Enter the code word to continue"
    StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.TextSize = 14
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Parent = Frame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -40, 0, 36)
    TextBox.Position = UDim2.new(0, 20, 0, 50)
    TextBox.Text = ""
    TextBox.PlaceholderText = "Enter Code Here"
    TextBox.Parent = Frame
    TextBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.BorderSizePixel = 0
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 14
    TextBox.ClearTextOnFocus = true

    local UICornerTextBox = Instance.new("UICorner")
    UICornerTextBox.CornerRadius = UDim.new(0, 6)
    UICornerTextBox.Parent = TextBox

    local SubmitButton = Instance.new("TextButton")
    SubmitButton.Size = UDim2.new(0, 140, 0, 36)
    SubmitButton.Position = UDim2.new(0.5, -70, 0, 100)
    SubmitButton.Text = "Submit"
    SubmitButton.Parent = Frame
    SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 158, 73)
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.BorderSizePixel = 0
    SubmitButton.Font = Enum.Font.GothamBold
    SubmitButton.TextSize = 14

    local UICornerButton = Instance.new("UICorner")
    UICornerButton.CornerRadius = UDim.new(0, 6)
    UICornerButton.Parent = SubmitButton

    SubmitButton.Activated:Connect(function()
        local enteredCode = TextBox.Text:gsub("%s+", "")
        if enteredCode == CODE_WORD then
            StatusLabel.Text = "Code valid! Loading script..."
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)

            task.delay(1, function()
                scringui:Destroy()
                api.load_script() -- Load the script after successful code entry
            end)
        else
            StatusLabel.Text = "Invalid code! Try again."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)

    -- Dragging functionality for the UI
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function SigmaDrag(input)
        local delta = input.Position - dragStart
        local targetPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = targetPosition
        }):Play()
    end

    Frame.InputBegan:Connect(function(input)
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

    Frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            SigmaDrag(input)
        end
    end)

    return scringui
end

-- Show the code input UI
makeUI()