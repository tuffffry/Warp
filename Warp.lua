local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- UI Configuration
local ui = Instance.new("ScreenGui")
ui.Name = "AutoHopUI"
ui.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundTransparency = 1
mainFrame.BorderSizePixel = 0
mainFrame.Size = UDim2.new(0.3, 0, 0.3, 0) -- Set size of the frame
mainFrame.Position = UDim2.new(0.35, 0, 0.35, 0) -- Center the frame
mainFrame.Parent = ui
mainFrame.Visible = true -- Make it visible by default

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.BackgroundColor3 = Color3.new(0.164, 0.164, 0.164)
toggleButton.BorderSizePixel = 0
toggleButton.Size = UDim2.new(1, 0, 0.4, 0) -- Adjust size to fit the frame
toggleButton.Text = "Auto Hop"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.Code
toggleButton.TextSize = 14
toggleButton.Parent = mainFrame

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

-- Auto Hop Variables
local autoHopEnabled = false

-- Function to hop to the next server
local function hopToNextServer()
    local placeId = game.PlaceId
    local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100"
    
    local success, response = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        local data = HttpService:JSONDecode(response)
        local servers = data.data

        -- Filter out full servers
        local availableServers = {}
        for _, server in ipairs(servers) do
            if server.playing < server.maxPlayers then
                table.insert(availableServers, server)
            end
        end

        if #availableServers > 0 then
            local randomServer = availableServers[math.random(1, #availableServers)]
            TeleportService:TeleportToPlaceInstance(placeId, randomServer.id, LocalPlayer)
        else
            warn("No available servers to join.")
        end
    else
        warn("Failed to get server data: " .. response)
    end
end

-- Auto Hop Function
local function AutoHop()
    while autoHopEnabled do
        hopToNextServer()
        wait(5) -- Wait for 5 seconds before hopping again
    end
end

-- Toggle Button Functionality
toggleButton.MouseButton1Click:Connect(function()
    autoHopEnabled = not autoHopEnabled
    toggleButton.Text = autoHopEnabled and "Stop Hop" or "Auto Hop"
    
    if autoHopEnabled then
        AutoHop()
    end
end)

-- Small Button to Toggle UI Visibility
smallButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
