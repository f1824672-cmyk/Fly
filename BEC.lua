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
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.new(1,1,1)
    b.ZIndex = 11
    return b
end

local flyBtn = btn("Fly",40)
local speedBtn = btn("Speed",90)
local espBtn = btn("ESP Player",140)

-- LOGO TOGGLE
local toggleBtn = Instance.new("ImageButton", gui)
toggleBtn.Size = UDim2.new(0,50,0,50)
toggleBtn.Position = UDim2.new(0.02,0,0.2,0)
toggleBtn.Image = "rbxassetid://7072719338"
toggleBtn.BackgroundTransparency = 1
toggleBtn.ZIndex = 20

local opened = true

toggleBtn.MouseButton1Click:Connect(function()
    opened = not opened

    if opened then
        frame.Visible = true
        toggleBtn:TweenSize(UDim2.new(0,60,0,60),"Out","Back",0.3,true)
    else
        frame.Visible = false
        toggleBtn:TweenSize(UDim2.new(0,40,0,40),"Out","Back",0.3,true)
    end
end)

-- FLY SYSTEM
local flying = false
local bv

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    local char = player.Character

    if flying then
        local hrp = char:WaitForChild("HumanoidRootPart")
        bv = Instance.new("BodyVelocity", hrp)
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    else
        if bv then bv:Destroy() end
    end
end)

RunService.RenderStepped:Connect(function()
    if flying and bv then
        local char = player.Character
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            bv.Velocity = humanoid.MoveDirection * 60 + Vector3.new(0,25,0)
        end
    end
end)

-- SPEED SYSTEM
local speed = false

speedBtn.MouseButton1Click:Connect(function()
    speed = not speed
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed and 50 or 16
    end
end)

-- ESP SYSTEM
local espEnabled = false

local function createESP(plr)
    if plr == player then return end

    local function add(char)
        if char:FindFirstChild("Head") and not char:FindFirstChild("ESP") then
            local bill = Instance.new("BillboardGui")
            bill.Name = "ESP"
            bill.Size = UDim2.new(0,100,0,40)
            bill.AlwaysOnTop = true
            bill.Adornee = char.Head
            bill.Parent = char

            local txt = Instance.new("TextLabel", bill)
            txt.Size = UDim2.new(1,0,1,0)
            txt.BackgroundTransparency = 1
            txt.TextColor3 = Color3.new(1,0,0)
            txt.Text = plr.Name
            txt.TextScaled = true
        end
    end

    if plr.Character then add(plr.Character) end
    plr.CharacterAdded:Connect(add)
end

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled

    if espEnabled then
        for _,p in pairs(game.Players:GetPlayers()) do
            createESP(p)
        end
    else
        for _,p in pairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("ESP") then
                p.Character.ESP:Destroy()
            end
        end
    end
end)
