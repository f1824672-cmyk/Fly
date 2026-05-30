local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(1e5,1e5,1e5)
bv.Parent = hrp

RunService.RenderStepped:Connect(function()
    local moveDir = humanoid.MoveDirection
    bv.Velocity = moveDir * 60 + Vector3.new(0,25,0)
end)
