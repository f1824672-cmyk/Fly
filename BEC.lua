-- BEC HUB FULL SCRIPT

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI ROOT
local gui = Instance.new("ScreenGui")
gui.Name = "BEC_HUB"
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

-- MAIN FRAME
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,260)
frame.Position = UDim2.new(0.05,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.ZIndex = 10

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "BEC HUB"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(80,0,150)
title.ZIndex = 11

-- BUTTON FUNCTION
local function btn(text, y)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,0,0,40)
    b.Position = UDim2.new(0,0,0,y)
    b.Text = text
    b.BackgroundColor
