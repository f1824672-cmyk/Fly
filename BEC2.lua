-- ⚡ AURORA LITE SYSTEM ⚡
-- DIUBAH SESUAI PERINTAH KEKUASAAN TUAN SKY 👑
-- NAMA BARU: BLOOD BEC 🩸 | FITUR LENGKAP TETAP SAMA!

-- LAYAR UTAMA DAN PENGATURAN
local Pengaturan = {
    PosisiX = 50,
    PosisiY = 50,
    UkuranTampilan = 1, -- 1 = Normal, Bisa diperkecil/diperbesar
    WarnaSaatIni = "Merah", -- Opsi: Merah, Hitam, Putih, Kuning, Biru, Ungu
    GeserMenu = true,
}

-- DAFTAR WARNA SESUAI PERINTAH SKY
local DaftarWarna = {
    Merah = Color3.new(1, 0, 0),
    Hitam = Color3.new(0, 0, 0),
    Putih = Color3.new(1, 1, 1),
    Kuning = Color3.new(1, 1, 0),
    Biru = Color3.new(0, 0, 1),
    Ungu = Color3.new(0.5, 0, 1)
}

-- TAMPILAN UTAMA (LOGO YANG UDAH DIUBAH JADI BLOOD BEC 🩸)
local MenuUtama = Instance.new("ScreenGui")
local BingkaiUtama = Instance.new("Frame")
local LogoTeks = Instance.new("TextLabel")
local DaftarFitur = Instance.new("Frame")

-- KONFIGURASI DASAR
MenuUtama.Name = "BLOOD_BEC_SYSTEM"
MenuUtama.Parent = game.CoreGui
MenuUtama.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BingkaiUtama.Parent = MenuUtama
BingkaiUtama.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
BingkaiUtama.BorderSizePixel = 0
BingkaiUtama.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiUtama.Size = UDim2.new(0, 300 * Pengaturan.UkuranTampilan, 0, 400 * Pengaturan.UkuranTampilan)
BingkaiUtama.Active = true
BingkaiUtama.Draggable = Pengaturan.GeserMenu -- BISA DI TARIK KIRI KANAN

-- 🩸 TULISAN LOGO YANG UDAH DIUBAH SESUAI PERMINTAAN 🩸
LogoTeks.Parent = BingkaiUtama
LogoTeks.BackgroundColor3 = Color3.new(1, 1, 1, 0.1)
LogoTeks.BorderSizePixel = 0
LogoTeks.Size = UDim2.new(1, 0, 0, 50)
LogoTeks.Font = Enum.Font.GothamBold
LogoTeks.Text = "BLOOD BEC" -- <<< NAMA BARU DI SINI BOS!
LogoTeks.TextColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
LogoTeks.TextScaled = true

-- BAGIAN FITUR
DaftarFitur.Parent = BingkaiUtama
DaftarFitur.BackgroundTransparency = 1
DaftarFitur.Position = UDim2.new(0, 10, 0, 60)
DaftarFitur.Size = UDim2.new(1, -20, 1, -70)

-- FUNGSI UBAH WARNA (6 PILIHAN SESUAI PERINTAH)
local function GantiWarna(NamaWarna)
    if DaftarWarna[NamaWarna] then
        Pengaturan.WarnaSaatIni = NamaWarna
        BingkaiUtama.BackgroundColor3 = DaftarWarna[NamaWarna]
        LogoTeks.TextColor3 = DaftarWarna[NamaWarna]
        -- PERBARUI WARNA SEMUA TOMBOL
        for _,v in pairs(DaftarFitur:GetChildren()) do
            if v:IsA("TextButton") then
                v.BackgroundColor3 = DaftarWarna[NamaWarna]
            end
        end
    end
end

-- FUNGSI UBAH UKURAN (KECILKAN / BESARKAN)
local function UbahUkuran(Skala)
    Pengaturan.UkuranTampilan = math.clamp(Skala, 0.5, 1.5) -- BATAS KECIL DAN BESAR
    BingkaiUtama.Size = UDim2.new(0, 300 * Pengaturan.UkuranTampilan, 0, 400 * Pengaturan.UkuranTampilan)
end

-- 🚀 FITUR UTAMA TETAP LENGKAP SESUAI YANG KAU MAU 🚀

-- 1. FITUR TERBANG (FLY)
local TombolTerbang = Instance.new("TextButton")
TombolTerbang.Parent = DaftarFitur
TombolTerbang.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolTerbang.BorderSizePixel = 0
TombolTerbang.Size = UDim2.new(1, 0, 0, 40)
TombolTerbang.Position = UDim2.new(0, 0, 0, 10)
TombolTerbang.Text = "AKTIFKAN TERBANG ✈️"
TombolTerbang.TextColor3 = Color3.new(1,1,1)
TombolTerbang.MouseButton1Click:Connect(function()
    local Karakter = game.Players.LocalPlayer.Character
    if Karakter and Karakter:FindFirstChild("Humanoid") then
        Karakter.Humanoid.PlatformStand = true
        local Tubuh = Karakter:FindFirstChild("HumanoidRootPart")
        game:GetService("RunService").RenderStepped:Connect(function()
            if Tubuh then
                local Gerak = Vector3.new(
                    game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) and -1 or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) and 1 or 0,
                    game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) and 1 or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) and -1 or 0,
                    game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) and -1 or game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) and 1 or 0
                )
                Tubuh.Velocity = (workspace.CurrentCamera.CFrame:VectorToWorldSpace(Gerak) * 50) -- KECEPATAN TERBANG
            end
        end)
    end
end)

-- 2. FITUR KECEPATAN (SPEED)
local TombolKecepatan = Instance.new("TextButton")
TombolKecepatan.Parent = DaftarFitur
TombolKecepatan.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolKecepatan.BorderSizePixel = 0
TombolKecepatan.Size = UDim2.new(1, 0, 0, 40)
TombolKecepatan.Position = UDim2.new(0, 0, 0, 60)
TombolKecepatan.Text = "KECEPATAN LUAR BIASA ⚡"
TombolKecepatan.TextColor3 = Color3.new(1,1,1)
TombolKecepatan.MouseButton1Click:Connect(function()
    local Karakter = game.Players.LocalPlayer.Character
    if Karakter and Karakter:FindFirstChild("Humanoid") then
        Karakter.Humanoid.WalkSpeed = 100 -- BISA DIUBAH SEMAKIN CEPAT
        Karakter.Humanoid.JumpPower = 70
    end
end)

-- 3. FITUR LIHAT MUSUH (ESP)
local TombolESP = Instance.new("TextButton")
TombolESP.Parent = DaftarFitur
TombolESP.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolESP.BorderSizePixel = 0
TombolESP.Size = UDim2.new(1, 0, 0, 40)
TombolESP.Position = UDim2.new(0, 0, 0, 110)
TombolESP.Text = "TAMPILKAN MUSUH (ESP) 👁️"
TombolESP.TextColor3 = Color3.new(1,1,1)
TombolESP.MouseButton1Click:Connect(function()
    for _,Pemain in pairs(game.Players:GetPlayers()) do
        if Pemain ~= game.Players.LocalPlayer and Pemain.Character and Pemain.Character:FindFirstChild("HumanoidRootPart") then
            -- BUAT GARIS GAMBAR DI TUBUH LAWAN
            local Garis = Instance.new("BoxHandleAdornment")
            Garis.Name = "ESP_BLOOD_BEC"
            Garis.Adornee = Pemain.Character.HumanoidRootPart
            Garis.Size = Vector3.new(4, 6, 4)
            Garis.Color3 = DaftarWarna[Pengaturan.WarnaSaatIni]
            Garis.Transparency = 0.3
            Garis.ZIndex = 10
            Garis.AlwaysOnTop = true
            Garis.Parent = Pemain.Character.HumanoidRootPart
        end
    end
end)

-- 4. FITUR KUNCI TEMBAK (AIMBOT)
local TombolAimbot = Instance.new("TextButton")
TombolAimbot.Parent = DaftarFitur
TombolAimbot.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolAimbot.BorderSizePixel = 0
TombolAimbot.Size = UDim2.new(1, 0, 0, 40)
TombolAimbot.Position = UDim2.new(0, 0, 0, 160)
TombolAimbot.Text = "KUNCI SASARAN (AIMBOT) 🎯"
TombolAimbot.TextColor3 = Color3.new(1,1,1)
TombolAimbot.MouseButton1Click:Connect(function()
    local UIS = game:GetService("UserInputService")
    local Kamera = workspace.CurrentCamera
    local SasaranTerdekat = nil
    local JarakTerdekat = math.huge
    
    -- CARI MUSUH TERDEKAT
    local function CariMusuh()
        SasaranTerdekat = nil
        JarakTerdekat = math.huge
        for _,Pemain in pairs(game.Players:GetPlayers()) do
            if Pemain ~= game.Players.LocalPlayer and Pemain.Character and Pemain.Character:FindFirstChild("Head") then
                local Kepala = Pemain.Character.Head
                local LayarPos, Terlihat = Kamera:WorldToViewportPoint(Kepala.Position)
                if Terlihat then
                    local Jarak = (Vector2.new(LayarPos.X, LayarPos.Y) - Vector2.new(Kamera.ViewportSize.X/2, Kamera.ViewportSize.Y/2)).Magnitude
                    if Jarak < JarakTerdekat then
                        JarakTerdekat = Jarak
                        SasaranTerdekat = Kepala
                    end
                end
            end
        end
    end
    
    -- KUNCI TITIK PANDANG
    UIS.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then -- KETIKA KLIK KANAN
            while UIS:IsMouseButtonPressed(Enum.MouseButton2) do
                task.wait()
                CariMusuh()
                if SasaranTerdekat then
                    Kamera.CFrame = CFrame.new(Kamera.CFrame.Position, SasaranTerdekat.Position)
                end
            end
        end
    end)
end)

-- MENU PENGATURAN WARNA (6 PILIHAN)
local TombolGantiWarna = Instance.new("TextButton")
TombolGantiWarna.Parent = DaftarFitur
TombolGantiWarna.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolGantiWarna.BorderSizePixel = 0
TombolGantiWarna.Size = UDim2.new(1, 0, 0, 40)
TombolGantiWarna.Position = UDim2.new(0, 0, 0, 210)
TombolGantiWarna.Text = "UBAH WARNA TAMPILAN 🎨"
TombolGantiWarna.TextColor3 = Color3.new(1,1,1)
TombolGantiWarna.MouseButton1Click:Connect(function()
    -- SIKLUS 6 WARNA SESUAI PERINTAH: Merah, Hitam, Putih, Kuning, Biru, Ungu
    local Daftar = {"Merah", "Hitam", "Putih", "Kuning", "Biru", "Ungu"}
    local IndeksSekarang = table.find(Daftar, Pengaturan.WarnaSaatIni) or 1
    IndeksSekarang = IndeksSekarang + 1
    if IndeksSekarang > #Daftar then IndeksSekarang = 1 end
    GantiWarna(Daftar[IndeksSekarang])
end)

-- MENU PENGATURAN UKURAN (KECILKAN / BESARKAN)
local TombolUbahUkuran = Instance.new("TextButton")
TombolUbahUkuran.Parent = DaftarFitur
TombolUbahUkuran.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolUbahUkuran.BorderSizePixel = 0
TombolUbahUkuran.Size = UDim2.new(1, 0, 0, 40)
TombolUbahUkuran.Position = UDim2.new(0, 0, 0, 260)
TombolUbahUkuran.Text = "KECILKAN / BESARKAN 🔍"
TombolUbahUkuran.TextColor3 = Color3.new(1,1,1)
TombolUbahUkuran.MouseButton1Click:Connect(function()
    if Pengaturan.UkuranTampilan == 1 then
        UbahUkuran(0.6) -- JADI KECIL
        TombolUbahUkuran.Text = "KEMBALI KE UKURAN AWAL"
    else
        UbahUkuran(1) -- KEMBALI BESAR
        TombolUbahUkuran.Text = "KECILKAN / BESARKAN"
    end
end)

print("[AURORA LITE] : SCRIPT BLOOD BEC SIAP DIGUNAKAN TUAN SKY! 🩸🔥✅")
