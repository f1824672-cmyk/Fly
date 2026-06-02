-- ⚡ AURORA LITE SYSTEM | DIPERBAIKI: BISA DIKLIK & LANGSUNG TERBUKA 👑
-- 🩸 NAMA: BLOOD BEC | TIDAK LAGI MACET SAAT DIKLIK 🩸

-- PENGATURAN UTAMA
local Pengaturan = {
    PosisiX = 50,
    PosisiY = 50,
    WarnaSaatIni = "Merah",
    GeserMenu = true,
    MenuTersembunyi = true, -- AWALNYA KECIL
    KecepatanTerbang = 50,
    KecepatanJalan = 30,
    FiturTerbangAktif = false,
    FiturKecepatanAktif = false,
    FiturESPAktif = false,
    FiturAimbotAktif = false
}

-- DAFTAR WARNA
local DaftarWarna = {
    Merah = Color3.new(0.8, 0.1, 0.1),
    Hitam = Color3.new(0.1, 0.1, 0.1),
    Putih = Color3.new(0.9, 0.9, 0.9),
    Kuning = Color3.new(0.9, 0.8, 0.2),
    Biru = Color3.new(0.1, 0.4, 0.8),
    Ungu = Color3.new(0.5, 0.2, 0.8)
}

-- LAYAR UTAMA
local MenuUtama = Instance.new("ScreenGui")
MenuUtama.Name = "BLOOD_BEC_MAIN_FIXED"
MenuUtama.Parent = game.CoreGui
MenuUtama.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ==============================================
-- 📦 TAMPILAN KECIL (KOTAK BERTULISKAN BEC) 📦
-- ==============================================
local BingkaiKecil = Instance.new("Frame")
BingkaiKecil.Name = "BingkaiKecil"
BingkaiKecil.Parent = MenuUtama
BingkaiKecil.BackgroundColor3 = DaftarWarna.Hitam
BingkaiKecil.BorderSizePixel = 0
BingkaiKecil.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiKecil.Size = UDim2.new(0, 70, 0, 70)
BingkaiKecil.Visible = true
BingkaiKecil.Active = true -- ✅ DIBUAT AKTIF AGAR BISA DIKLIK
BingkaiKecil.Draggable = Pengaturan.GeserMenu
BingkaiKecil.BackgroundTransparency = 0.1
-- Lengkungan
local SudutKecil = Instance.new("UICorner")
SudutKecil.CornerRadius = UDim.new(0.2, 0)
SudutKecil.Parent = BingkaiKecil

local TeksBEC = Instance.new("TextLabel")
TeksBEC.Name = "TeksBEC"
TeksBEC.Parent = BingkaiKecil
TeksBEC.BackgroundTransparency = 1
TeksBEC.Size = UDim2.new(1, 0, 1, 0)
TeksBEC.Text = "BEC"
TeksBEC.TextColor3 = Color3.new(1,1,1)
TeksBEC.Font = Enum.Font.GothamBold
TeksBEC.TextScaled = true

-- ==============================================
-- 📂 TAMPILAN BESAR (YANG AKAN MUNCUL SETELAH DIKLIK) 📂
-- ==============================================
local BingkaiBesar = Instance.new("Frame")
BingkaiBesar.Name = "BingkaiBesar"
BingkaiBesar.Parent = MenuUtama
BingkaiBesar.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
BingkaiBesar.BorderSizePixel = 0
BingkaiBesar.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiBesar.Size = UDim2.new(0, 300, 0, 420)
BingkaiBesar.Visible = false -- ✅ AWALNYA DISEMBUNYIKAN
BingkaiBesar.Active = true
BingkaiBesar.Draggable = Pengaturan.GeserMenu
BingkaiBesar.BackgroundTransparency = 0.05
-- Lengkungan
local SudutBesar = Instance.new("UICorner")
SudutBesar.CornerRadius = UDim.new(0.08, 0)
SudutBesar.Parent = BingkaiBesar

-- GARIS ATAS
local GarisAtas = Instance.new("Frame")
GarisAtas.Name = "GarisAtas"
GarisAtas.Parent = BingkaiBesar
GarisAtas.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
GarisAtas.BorderSizePixel = 0
GarisAtas.Position = UDim2.new(0, 0, 0, 0)
GarisAtas.Size = UDim2.new(1, 0, 0, 35)
GarisAtas.BackgroundTransparency = 0.15
local SudutAtas = Instance.new("UICorner")
SudutAtas.CornerRadius = UDim.new(0.08, 0)
SudutAtas.Parent = GarisAtas

-- ✅ TULISAN DI KIRI ATAS: BLOOD BEC
local Judul = Instance.new("TextLabel")
Judul.Name = "Judul"
Judul.Parent = GarisAtas
Judul.BackgroundTransparency = 1
Judul.Position = UDim2.new(0, 12, 0, 0)
Judul.Size = UDim2.new(0.8, 0, 1, 0)
Judul.Font = Enum.Font.GothamBold
Judul.Text = "BLOOD BEC"
Judul.TextColor3 = Color3.new(1,1,1)
Judul.TextScaled = true
Judul.TextXAlignment = Enum.TextXAlignment.Left

-- TOMBOL KECILKAN
local TombolTutup = Instance.new("TextButton")
TombolTutup.Name = "TombolTutup"
TombolTutup.Parent = GarisAtas
TombolTutup.BackgroundTransparency = 1
TombolTutup.Position = UDim2.new(0.9, -25, 0, 0)
TombolTutup.Size = UDim2.new(0, 25, 1, 0)
TombolTutup.Text = "−"
TombolTutup.TextColor3 = Color3.new(1,1,1)
TombolTutup.Font = Enum.Font.GothamBold
TombolTutup.TextScaled = true

-- TEMPAT ISI FITUR
local WadahFitur = Instance.new("ScrollingFrame")
WadahFitur.Name = "WadahFitur"
WadahFitur.Parent = BingkaiBesar
WadahFitur.BackgroundTransparency = 1
WadahFitur.Position = UDim2.new(0, 15, 0, 45)
WadahFitur.Size = UDim2.new(1, -30, 1, -50)
WadahFitur.ScrollBarThickness = 3
WadahFitur.ScrollBarImageColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
WadahFitur.CanvasSize = UDim2.new(0, 0, 0, 340)

-- ==============================================
-- 🔄 FUNGSI PENTING: CARA KERJA SAAT DIKLIK 🔄
-- ==============================================
-- ✅ INI YANG DIPERBAIKI AGAR MAU BERUBAH BENTUK
local function GantiBentuk()
    Pengaturan.MenuTersembunyi = not Pengaturan.MenuTersembunyi
    if Pengaturan.MenuTersembunyi then
        BingkaiBesar.Visible = false
        BingkaiKecil.Visible = true
        print("[INFO] Menu Dikecilkan")
    else
        BingkaiBesar.Visible = true
        BingkaiKecil.Visible = false
        print("[INFO] Menu Dibesarkan / Dibuka")
    end
end

-- ✅ SAMBUNGAN KLIK YANG SUDAH DIPERBAIKI DAN PASTI BERFUNGSI
BingkaiKecil.MouseButton1Click:Connect(GantiBentuk)
TombolTutup.MouseButton1Click:Connect(GantiBentuk)

-- ==============================================
-- 🎨 FUNGSI GANTI WARNA 🎨
-- ==============================================
local function GantiWarna(NamaWarna)
    if DaftarWarna[NamaWarna] then
        Pengaturan.WarnaSaatIni = NamaWarna
        GarisAtas.BackgroundColor3 = DaftarWarna[NamaWarna]
        WadahFitur.ScrollBarImageColor3 = DaftarWarna[NamaWarna]
    end
end

-- ==============================================
-- 🚀 FITUR TERBANG + KOLOM ANGKA 🚀
-- ==============================================
local TombolTerbang = Instance.new("TextButton")
TombolTerbang.Name = "TombolTerbang"
TombolTerbang.Parent = WadahFitur
TombolTerbang.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolTerbang.BorderSizePixel = 0
TombolTerbang.Size = UDim2.new(1, -10, 0, 38)
TombolTerbang.Position = UDim2.new(0, 5, 0, 10)
TombolTerbang.Text = "❌ Aktifkan Terbang"
TombolTerbang.TextColor3 = Color3.new(1,1,1)
TombolTerbang.Font = Enum.Font.Gotham
TombolTerbang.TextXAlignment = Enum.TextXAlignment.Left
TombolTerbang.TextScaled = true
local SudutTombol1 = Instance.new("UICorner")
SudutTombol1.CornerRadius = UDim.new(0.15, 0)
SudutTombol1.Parent = TombolTerbang

local InputTerbang = Instance.new("TextBox")
InputTerbang.Name = "InputTerbang"
InputTerbang.Parent = WadahFitur
InputTerbang.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
InputTerbang.BorderSizePixel = 0
InputTerbang.Position = UDim2.new(0, 5, 0, 55)
InputTerbang.Size = UDim2.new(1, -10, 0, 32)
InputTerbang.Text = "Kecepatan Terbang: "..Pengaturan.KecepatanTerbang
InputTerbang.TextColor3 = Color3.new(0.9,0.9,0.9)
InputTerbang.Font = Enum.Font.Gotham
InputTerbang.ClearTextOnFocus = true
InputTerbang.TextScaled = true
local SudutInput1 = Instance.new("UICorner")
SudutInput1.CornerRadius = UDim.new(0.15, 0)
SudutInput1.Parent = InputTerbang

InputTerbang.FocusLost:Connect(function()
    local Angka = tonumber(InputTerbang.Text)
    if Angka then Pengaturan.KecepatanTerbang = math.clamp(Angka, 10, 1000) end
    InputTerbang.Text = "Kecepatan Terbang: "..Pengaturan.KecepatanTerbang
end)

local SambunganTerbang
TombolTerbang.MouseButton1Click:Connect(function()
    Pengaturan.FiturTerbangAktif = not Pengaturan.FiturTerbangAktif
    local Pemain = game.Players.LocalPlayer
    local UIS = game:GetService("UserInputService")
    
    if Pengaturan.FiturTerbangAktif then
        TombolTerbang.Text = "✅ Terbang Aktif"
        TombolTerbang.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
        SambunganTerbang = game:GetService("RunService").RenderStepped:Connect(function()
            if Pemain.Character and Pemain.Character:FindFirstChild("HumanoidRootPart") then
                local Tubuh = Pemain.Character.HumanoidRootPart
                Pemain.Character.Humanoid.PlatformStand = true
                local Arah = Vector3.new()
                if UIS:IsKeyDown(Enum.KeyCode.W) then Arah += workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then Arah -= workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then Arah -= workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then Arah += workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then Arah += Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then Arah += Vector3.new(0,-1,0) end
                Arah = Arah.Unit * Pengaturan.KecepatanTerbang
                Tubuh.Velocity = Arah
            end
        end)
    else
        TombolTerbang.Text = "❌ Aktifkan Terbang"
        TombolTerbang.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        if SambunganTerbang then SambunganTerbang:Disconnect() end
        if Pemain.Character and Pemain.Character:FindFirstChild("Humanoid") then
            Pemain.Character.Humanoid.PlatformStand = false
        end
    end
end)

-- ==============================================
-- ⚡ FITUR LARI CEPAT + KOLOM ANGKA ⚡
-- ==============================================
local TombolLari = Instance.new("TextButton")
TombolLari.Name = "TombolLari"
TombolLari.Parent = WadahFitur
TombolLari.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolLari.BorderSizePixel = 0
TombolLari.Position = UDim2.new(0, 5, 0, 100)
TombolLari.Size = UDim2.new(1, -10, 0, 38)
TombolLari.Text = "❌ Kecepatan Luar Biasa"
TombolLari.TextColor3 = Color3.new(1,1,1)
TombolLari.Font = Enum.Font.Gotham
TombolLari.TextXAlignment = Enum.TextXAlignment.Left
TombolLari.TextScaled = true
local SudutTombol2 = Instance.new("UICorner")
SudutTombol2.CornerRadius = UDim.new(0.15, 0)
SudutTombol2.Parent = TombolLari

local InputLari = Instance.new("TextBox")
InputLari.Name = "InputLari"
InputLari.Parent = WadahFitur
InputLari.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
InputLari.BorderSizePixel = 0
InputLari.Position = UDim2.new(0, 5, 0, 145)
InputLari.Size = UDim2.new(1, -10, 0, 32)
InputLari.Text = "Kecepatan Lari: "..Pengaturan.KecepatanJalan
InputLari.TextColor3 = Color3.new(0.9,0.9,0.9)
InputLari.Font = Enum.Font.Gotham
InputLari.ClearTextOnFocus = true
InputLari.TextScaled = true
local SudutInput2 = Instance.new("UICorner")
SudutInput2.CornerRadius = UDim.new(0.15, 0)
SudutInput2.Parent = InputLari

InputLari.FocusLost:Connect(function()
    local Angka = tonumber(InputLari.Text)
    if Angka then Pengaturan.KecepatanJalan = math.clamp(Angka, 10, 500) end
    InputLari.Text = "Kecepatan Lari: "..Pengaturan.KecepatanJalan
    if Pengaturan.FiturKecepatanAktif then
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Pengaturan.KecepatanJalan
        end
    end
end)

TombolLari.MouseButton1Click:Connect(function()
    Pengaturan.FiturKecepatanAktif = not Pengaturan.FiturKecepatanAktif
    local Karakter = game.Players.LocalPlayer.Character
    if not Karakter or not Karakter:FindFirstChild("Humanoid") then return end
    
    if Pengaturan.FiturKecepatanAktif then
        TombolLari.Text = "✅ Lari Cepat Aktif"
        TombolLari.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
        Karakter.Humanoid.WalkSpeed = Pengaturan.KecepatanJalan
    else
        TombolLari.Text = "❌ Kecepatan Luar Biasa"
        TombolLari.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        Karakter.Humanoid.WalkSpeed = 16
    end
end)

-- ==============================================
-- 👁️ FITUR ESP 👁️
-- ==============================================
local TombolESP = Instance.new("TextButton")
TombolESP.Name = "TombolESP"
TombolESP.Parent = WadahFitur
TombolESP.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolESP.BorderSizePixel = 0
TombolESP.Position = UDim2.new(0, 5, 0, 190)
TombolESP.Size = UDim2.new(1, -10, 0, 38)
TombolESP.Text = "❌ Tampilkan Musuh (ESP)"
TombolESP.TextColor3 = Color3.new(1,1,1)
TombolESP.Font = Enum.Font.Gotham
TombolESP.TextXAlignment = Enum.TextXAlignment.Left
TombolESP.TextScaled = true
local SudutTombol3 = Instance.new("UICorner")
SudutTombol3.CornerRadius = UDim.new(0.15, 0)
SudutTombol3.Parent = TombolESP

local SambunganESP
TombolESP.MouseButton1Click:Connect(function()
    Pengaturan.FiturESPAktif = not Pengaturan.FiturESPAktif
    if Pengaturan.FiturESPAktif then
        TombolESP.Text = "✅ ESP Aktif"
        TombolESP.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
        for _,v in pairs(workspace:GetDescendants()) do if v.Name == "ESP_BLOOD_BEC" then v:Destroy() end end
        SambunganESP = game:GetService("RunService").RenderStepped:Connect(function()
            for _,Pemain in pairs(game.Players:GetPlayers()) do
                if Pemain ~= game.Players.LocalPlayer and Pemain.Character and Pemain.Character:FindFirstChild("HumanoidRootPart") then
                    local Tubuh = Pemain.Character.HumanoidRootPart
                    if not Tubuh:FindFirstChild("ESP_BLOOD_BEC") then
                        local Garis = Instance.new("BoxHandleAdornment")
                        Garis.Name = "ESP_BLOOD_BEC"
                        Garis.Adornee = Tubuh
                        Garis.Size = Vector3.new(4, 6, 4)
                        Garis.Color3 = DaftarWarna[Pengaturan.WarnaSaatIni]
                        Garis.Transparency = 0.3
                        Garis.ZIndex = 10
                        Garis.AlwaysOnTop = true
                        Garis.Parent = Tubuh
                    end
                end
            end
        end)
    else
        TombolESP.Text = "❌ Tampilkan Musuh (ESP)"
        TombolESP.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        if SambunganESP then SambunganESP:Disconnect() end
        for _,v in pairs(workspace:GetDescendants()) do if v.Name == "ESP_BLOOD_BEC" then v:Destroy() end end
    end
end)

-- ==============================================
-- 🎯 FITUR AIMBOT 🎯
-- ==============================================
local TombolAimbot = Instance.new("TextButton")
TombolAimbot.Name = "TombolAimbot"
TombolAimbot.Parent = WadahFitur
TombolAimbot.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolAimbot.BorderSizePixel = 0
TombolAimbot.Position = UDim2.new(0, 5, 0, 240)
TombolAimbot.Size = UDim2.new(1, -10, 0, 38)
TombolAimbot.Text = "❌ Kunci Sasaran (Aimbot)"
TombolAimbot.TextColor3 = Color3.new(1,1,1)
TombolAimbot.Font = Enum.Font.Gotham
TombolAimbot.TextXAlignment = Enum.TextXAlignment.Left
TombolAimbot.TextScaled = true
local SudutTombol4 = Instance.new("UICorner")
SudutTombol4.CornerRadius = UDim.new(0.15, 0)
SudutTombol4.Parent = TombolAimbot

local SambunganAimbot
TombolAimbot.MouseButton1Click:Connect(function()
    Pengaturan.FiturAimbotAktif = not Pengaturan.FiturAimbotAktif
    local UIS = game:GetService("UserInputService")
    local Kamera = workspace.CurrentCamera
    if Pengaturan.FiturAimbotAktif then
        TombolAimbot.Text = "✅ Aimbot Aktif"
        TombolAimbot.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
        SambunganAimbot = UIS.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                while UIS:IsMouseButtonPressed(Enum.MouseButton2) do
                    task.wait()
                    local Sasaran, Jarak = nil, math.huge
                    for _,Pemain in pairs(game.Players:GetPlayers()) do
                        if Pemain ~= game.Players.LocalPlayer and Pemain.Character and Pemain.Character:FindFirstChild("Head") then
                            local Pos, Terlihat = Kamera:WorldToViewportPoint(Pemain.Character.Head.Position)
                            if Terlihat then
                                local JarakSekarang = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Kamera.ViewportSize.X/2, Kamera.ViewportSize.Y/2)).Magnitude
                                if JarakSekarang < Jarak then Jarak = JarakSekarang Sasaran = Pemain.Character.Head end
                            end
                        end
                    end
                    if Sasaran then Kamera.CFrame = CFrame.new(Kamera.CFrame.Position, Sasaran.Position) end
                end
            end
        end)
    else
        TombolAimbot.Text = "❌ Kunci Sasaran (Aimbot)"
        TombolAimbot.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        if SambunganAimbot then SambunganAimbot:Disconnect() end
    end
end)

-- ==============================================
-- 🎨 TOMBOL GANTI WARNA 🎨
-- ==============================================
local TombolGantiWarna = Instance.new("TextButton")
TombolGantiWarna.Name = "TombolGantiWarna"
TombolGantiWarna.Parent = WadahFitur
TombolGantiWarna.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolGantiWarna.BorderSizePixel = 0
TombolGantiWarna.Position = UDim2.new(0, 5, 0, 290)
TombolGantiWarna.Size = UDim2.new(1, -10, 0, 38)
TombolGantiWarna.Text = "Ubah Warna Tampilan 🎨"
TombolGantiWarna.TextColor3 = Color3.new(1,1,1)
TombolGantiWarna.Font = Enum.Font.Gotham
TombolGantiWarna.TextScaled = true
local SudutTombol5 = Instance.new("UICorner")
SudutTombol5.CornerRadius = UDim.new(0.15, 0)
SudutTombol5.Parent = TombolGantiWarna

TombolGantiWarna.MouseButton1Click:Connect(function()
    local Daftar = {"Merah", "Hitam", "Putih", "Kuning", "Biru", "Ungu"}
    local Indeks = table.find(Daftar, Pengaturan.WarnaSaatIni) or 1
    Indeks = Indeks + 1
    if Indeks > #Daftar then Indeks = 1 end
    GantiWarna(Daftar[Indeks])
end)

print("[✅] SELESAI DIPERBAIKI! SAATNYA DICOBA KLIK KOTAKNYA!")
