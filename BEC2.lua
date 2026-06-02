-- 🔑 SISTEM KUNCI | KUNCI: DIKA RODOK GIO 🔑
local KunciBenar = "DIKA RODOK GIO"

-- LAYAR MASUKAN KUNCI
local LayarKunci = Instance.new("ScreenGui")
LayarKunci.Name = "KUNCI_BLOOD_BEC"
LayarKunci.Parent = game.CoreGui
LayarKunci.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local BingkaiKunci = Instance.new("Frame")
BingkaiKunci.Name = "BingkaiKunci"
BingkaiKunci.Parent = LayarKunci
BingkaiKunci.BackgroundColor3 = Color3.new(0.08, 0.08, 0.1)
BingkaiKunci.Position = UDim2.new(0.5, -150, 0.5, -100)
BingkaiKunci.Size = UDim2.new(0, 300, 0, 200)
BingkaiKunci.Active = true
BingkaiKunci.Draggable = true
local SudutKunci = Instance.new("UICorner")
SudutKunci.CornerRadius = UDim.new(0.08, 0)
SudutKunci.Parent = BingkaiKunci

local JudulKunci = Instance.new("TextLabel")
JudulKunci.Name = "JudulKunci"
JudulKunci.Parent = BingkaiKunci
JudulKunci.BackgroundColor3 = Color3.new(0, 1, 0)
JudulKunci.BackgroundTransparency = 0.2
JudulKunci.Position = UDim2.new(0, 0, 0, 0)
JudulKunci.Size = UDim2.new(1, 0, 0, 40)
JudulKunci.Text = "MASUKKAN KUNCI"
JudulKunci.TextColor3 = Color3.new(1,1,1)
JudulKunci.Font = Enum.Font.GothamBold
JudulKunci.TextScaled = true

local IsiKunci = Instance.new("TextBox")
IsiKunci.Name = "IsiKunci"
IsiKunci.Parent = BingkaiKunci
IsiKunci.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
IsiKunci.Position = UDim2.new(0.1, 0, 0.3, 0)
IsiKunci.Size = UDim2.new(0.8, 0, 0, 40)
IsiKunci.Text = ""
IsiKunci.PlaceholderText = "Ketik kunci di sini..."
IsiKunci.TextColor3 = Color3.new(1,1,1)
IsiKunci.Font = Enum.Font.Gotham
IsiKunci.TextScaled = true
IsiKunci.ClearTextOnFocus = true
local SudutIsi = Instance.new("UICorner")
SudutIsi.CornerRadius = UDim.new(0.15, 0)
SudutIsi.Parent = IsiKunci

local TombolKonfirmasi = Instance.new("TextButton")
TombolKonfirmasi.Name = "TombolKonfirmasi"
TombolKonfirmasi.Parent = BingkaiKunci
TombolKonfirmasi.BackgroundColor3 = Color3.new(0, 1, 0)
TombolKonfirmasi.Position = UDim2.new(0.25, 0, 0.65, 0)
TombolKonfirmasi.Size = UDim2.new(0.5, 0, 0, 40)
TombolKonfirmasi.Text = "KONFIRMASI"
TombolKonfirmasi.TextColor3 = Color3.new(1,1,1)
TombolKonfirmasi.Font = Enum.Font.GothamBold
TombolKonfirmasi.TextScaled = true
local SudutTombol = Instance.new("UICorner")
SudutTombol.CornerRadius = UDim.new(0.15, 0)
SudutTombol.Parent = TombolKonfirmasi

local Pesan = Instance.new("TextLabel")
Pesan.Name = "Pesan"
Pesan.Parent = BingkaiKunci
Pesan.BackgroundTransparency = 1
Pesan.Position = UDim2.new(0, 0, 0.85, 0)
Pesan.Size = UDim2.new(1, 0, 0, 20)
Pesan.Text = ""
Pesan.TextColor3 = Color3.new(1, 0.2, 0.2)
Pesan.Font = Enum.Font.Gotham
Pesan.TextScaled = true

-- PROSES PERIKSA KUNCI
TombolKonfirmasi.MouseButton1Click:Connect(function()
    if IsiKunci.Text == KunciBenar then
        Pesan.TextColor3 = Color3.new(0, 1, 0)
        Pesan.Text = "✅ Kunci Benar! Memuat Menu..."
        task.wait(0.5)
        LayarKunci:Destroy()
        -- JALANKAN SCRIPT UTAMA
        loadstring(game:HttpGet("https://raw.githubusercontent.com/f1824672-cmyk/Fly/refs/heads/main/BEC2.lua"))()
    else
        Pesan.TextColor3 = Color3.new(1, 0.2, 0.2)
        Pesan.Text = "❌ Kunci Salah! Coba Lagi"
        IsiKunci.Text = ""
    end
end)
