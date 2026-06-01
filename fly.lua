-- BEC HUB SCRIPT

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "BEC_HUB"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,250)
frame.Position = UDim2.new(0.05,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "BEC HUB"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(50,0,100)

-- BUTTON
local function btn(text, y)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1,0,0,40)
    b.Position = UDim2.new(0,0,0,y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.new(1,1,1)
    return b
end

local flyBtn = btn("Fly",40)
local speedBtn = btn("Speed",90)

-- FLY
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
        bv.Velocity = humanoid.MoveDirection * 60 + Vector3.new(0,25,0)
    end
end)

-- SPEED
local speed = false
speedBtn.MouseButton1Click:Connect(function()
    speed = not speed
    local humanoid = player.Character:FindFirstChild("Humanoid")
    humanoid.WalkSpeed = speed and 50 or 16
end)-- ESP SYSTEM
local espEnabled = false

local function createESP(player)
    if player == game.Players.LocalPlayer then return end

    local function addBillboard(char)
        if char:FindFirstChild("Head") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP"
            billboard.Size = UDim2.new(0,100,0,40)
            billboard.AlwaysOnTop = true
            billboard.Adornee = char.Head
            billboard.Parent = char

            local text = Instance.new("TextLabel", billboard)
            text.Size = UDim2.new(1,0,1,0)
            text.BackgroundTransparency = 1
            text.TextColor3 = Color3.new(1,0,0)
            text.Text = player.Name
            text.TextScaled = true
        end
    end

    if player.Character then
        addBillboard(player.Character)
    end

    player.CharacterAdded:Connect(addBillboard)
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
-- LOGO BUTTON (TOGGLE)
local toggleBtn = Instance.new("ImageButton", gui)
toggleBtn.Size = UDim2.new(0,50,0,50)
toggleBtn.Position = UDim2.new(0.02,0,0.2,0)
toggleBtn.Image = "rbxassetid://7072719338" -- ganti kalau mau logo sendiri
toggleBtn.BackgroundTransparency = 1 local opened = true

toggleBtn.MouseButton1Click:Connect(function()
    opened = not opened

    if opened then
        frame.Visible = true
        toggleBtn:TweenSize(UDim2.new(0,50,0,50),"Out","Quad",0.2,true)
    else
        frame.Visible = false
        toggleBtn:TweenSize(UDim2.new(0,40,0,40),"Out","Quad",0.2,true)
    end
end)
