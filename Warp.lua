-- UI Library
local UI = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Create a frame for the menu
local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Parent = game.CoreGui
MenuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MenuFrame.BorderSizePixel = 0
MenuFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MenuFrame.Size = UDim2.new(0, 250, 0, 300)
MenuFrame.Draggable = true

-- Create a text label for the title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MenuFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.BorderSizePixel = 0
TitleLabel.Text = "Blox Fruits Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.SourceSans
TitleLabel.Position = UDim2.new(0.5, 0, 0, 20)
TitleLabel.Size = UDim2.new(1, 0, 0, 25)

-- Create a text label for the user name
local PlayerLabel = Instance.new("TextLabel")
PlayerLabel.Name = "PlayerLabel"
PlayerLabel.Parent = MenuFrame
PlayerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayerLabel.BorderSizePixel = 0
PlayerLabel.Text = "User: " .. Players.LocalPlayer.Name
PlayerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerLabel.TextScaled = true
PlayerLabel.TextSize = 12
PlayerLabel.Font = Enum.Font.SourceSans
PlayerLabel.Position = UDim2.new(0, 5, 0.1, 0
