local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- UI Configuration
local ui = Instance.new("ScreenGui")
ui.Name = "AutoHopUI"
ui.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundTransparency = 1
mainFrame.BorderSizePixel = 0
mainFrame.Parent = ui
mainFrame.Visible = false

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.BackgroundColor3 = Color3.new(0.164, 0.164, 0.164)
toggleButton.BorderSizePixel = 0
toggleButton.Position = UDim2.new(0.85, 0, 0.85, 0)
toggleButton.Size = UDim2.new(0.1, 0, 0.1, 0)
toggleButton.Text = "Auto Hop"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.Code
toggleButton.TextSize = 14
toggleButton.Parent = ui

-- Small Button UI
local smallButton = Instance.new("TextButton")
smallButton.Name = "SmallButton"
smallButton.BackgroundColor3 = Color3.new(0.164, 0.164, 0.164)
smallButton.BorderSizePixel = 0
smallButton.Position = UDim2.new(0.85, 0, 0.95, 0)
smallButton.Size = UDim2.new(0.1, 0, 0.1, 0)
smallButton.Text = "Open"
smallButton.TextColor3 = Color3.new(1, 1, 1)
smallButton.Font = Enum.Font.Code
smallButton.TextSize = 14
smallButton.Parent = ui

-- Auto Hop Function
local function AutoHop()
    -- Your auto hop server logic here
    
