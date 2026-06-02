-- BEC HUB FULL SCRIPT

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0,200,0,250)
mainFrame.Position = UDim2.new(0,20,0.3,0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)

-- TITLE
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1,0,0,40)
title.Text = "BEC HUB"
title.BackgroundColor3 = Color3.fromRGB(100,0,150)
title.TextColor3 = Color3.new(1,1,1)

-- BUTTON FUNCTION
function createBtn(name,posY)
	local btn = Instance.new("TextButton", mainFrame)
	btn.Size = UDim2.new(1,0,0,40)
	btn.Position = UDim2.new(0,0,0,posY)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.TextColor3 = Color3.new(1,1,1)
	return btn
end

local flyBtn = createBtn("Fly",50)
local speedBtn = createBtn("Speed",100)
local espBtn = createBtn("ESP Player",150)
local themeBtn = createBtn("Ganti Warna",200)

-- LOGO TOGGLE
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0,60,0,60)
toggle.Position = UDim2.new(0.5,-30,0.5,-30)
toggle.BackgroundColor3 = Color3.fromRGB(0,0,0)
toggle.Text = "BEC"
toggle.TextColor3 = Color3.new(1,1,1)
toggle.Visible = false

local open = true

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		open = not open
		mainFrame.Visible = open
		toggle.Visible = not open
	end
end)

toggle.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	toggle.Visible = false
	open = true
end)

-- DRAG (MOBILE)
local dragging, dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

-- FLY
local flying = false
local bv

flyBtn.MouseButton1Click:Connect(function()
	flying = not flying
	
	if flying then
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
		
		bv = Instance.new("BodyVelocity")
		bv.MaxForce = Vector3.new(1e5,1e5,1e5)
		bv.Parent = hrp
		
		RunService.RenderStepped:Connect(function()
			if flying and bv then
				bv.Velocity = Vector3.new(0,50,0)
			end
		end)
	else
		if bv then bv:Destroy() end
	end
end)

-- SPEED
local speed = false

speedBtn.MouseButton1Click:Connect(function()
	speed = not speed
	local hum = player.Character:FindFirstChildOfClass("Humanoid")
	
	if speed then
		hum.WalkSpeed = 50
	else
		hum.WalkSpeed = 16
	end
end)

-- ESP
local espOn = false

espBtn.MouseButton1Click:Connect(function()
	espOn = not espOn
	
	for _,plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			if plr.Character and plr.Character:FindFirstChild("Head") then
				if espOn then
					local bill = Instance.new("BillboardGui", plr.Character.Head)
					bill.Size = UDim2.new(0,100,0,40)
					bill.Name = "ESP"
					
					local txt = Instance.new("TextLabel", bill)
					txt.Size = UDim2.new(1,0,1,0)
					txt.Text = plr.Name
					txt.TextColor3 = Color3.new(1,0,0)
					txt.BackgroundTransparency = 1
				else
					if plr.Character.Head:FindFirstChild("ESP") then
						plr.Character.Head.ESP:Destroy()
					end
				end
			end
		end
	end
end)

-- THEMES
local themes = {
	Black = Color3.fromRGB(20,20,20),
	White = Color3.fromRGB(240,240,240),
	Yellow = Color3.fromRGB(255,200,0),
	Red = Color3.fromRGB(200,0,0)
}

local currentTheme = "Black"

local function applyTheme()
	mainFrame.BackgroundColor3 = themes[currentTheme]
end

themeBtn.MouseButton1Click:Connect(function()
	if currentTheme == "Black" then
		currentTheme = "White"
	elseif currentTheme == "White" then
		currentTheme = "Yellow"
	elseif currentTheme == "Yellow" then
		currentTheme = "Red"
	else
		currentTheme = "Black"
	end
	
	applyTheme()
end)

applyTheme()
