-- ⚡ BLOOD BEC SYSTEM | KHUSUS ESP & AIMBOT 👑
-- 🩸 TAMPILAN SEPERTI CONTOH GAMBAR | BISA DIGESER 🩸

-- LAYANAN PENDUKUNG
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local PemainLokal = game.Players.LocalPlayer
local KarakterLokal = PemainLokal.Character or PemainLokal.CharacterAdded:Wait()
local Kamera = workspace.CurrentCamera

-- PENGATURAN UTAMA
local Pengaturan = {
    Posisi = Vector2.new(100, 100),
    GeserAktif = false,
    PosisiTetap = Vector2.new(0,0),
    WarnaUtama = Color3.new(0, 1, 0), -- Hijau seperti contoh gambar
    WarnaTulisan = Color3.new(1,1,1),
    WarnaLatar = Color3.new(0.1, 0.1, 0.12),
    -- FITUR YANG DIPAKAI
    Aimbot = {Aktif = false, BagianSasaran = "Head"},
    ESP = {
        Kotak = false,
        Nama = false,
        Garis = false
    }
}

-- DAFTAR WARNA YANG BISA DIGANTI
local DaftarWarna = {
    {Nama = "Hijau", Nilai = Color3.new(0, 1, 0)},
    {Nama = "Merah", Nilai = Color3.new(1, 0.2, 0.2)},
    {Nama = "Biru", Nilai = Color3.new(0.2, 0.5, 1)},
    {Nama = "Kuning", Nilai = Color3.new(1, 1, 0.2)},
    {Nama = "Ungu", Nilai = Color3.new(0.7, 0.2, 1)},
    {Nama = "Putih", Nilai = Color3.new(1,1,1)}
}

-- ==============================================
-- 🎨 TAMPILAN UTAMA (SEPERTI CONTOH GAMBAR) 🎨
-- ==============================================
local Layar = Instance.new("ScreenGui")
Layar.Name = "BLOOD_BEC_UI"
Layar.Parent = game.CoreGui
Layar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 📦 TAMPILAN KECIL (KOTAK BEC)
local BingkaiKecil = Instance.new("Frame")
BingkaiKecil.Name = "BingkaiKecil"
BingkaiKecil.Parent = Layar
BingkaiKecil.BackgroundColor3 = Pengaturan.WarnaLatar
BingkaiKecil.Position = UDim2.new(0, Pengaturan.Posisi.X, 0, Pengaturan.Posisi.Y)
BingkaiKecil.Size = UDim2.new(0, 65, 0, 65)
BingkaiKecil.Visible = true
BingkaiKecil.Active = true
local SudutKecil = Instance.new("UICorner")
SudutKecil.CornerRadius = UDim.new(0.15, 0)
SudutKecil.Parent = BingkaiKecil

local TeksKecil = Instance.new("TextLabel")
TeksKecil.Name = "TeksKecil"
TeksKecil.Parent = BingkaiKecil
TeksKecil.BackgroundTransparency = 1
TeksKecil.Size = UDim2.new(1,0,1,0)
TeksKecil.Text = "BEC"
TeksKecil.TextColor3 = Pengaturan.WarnaUtama
TeksKecil.Font = Enum.Font.GothamBold
TeksKecil.TextScaled = true

-- 📂 TAMPILAN BESAR (MENU UTAMA)
local BingkaiBesar = Instance.new("Frame")
BingkaiBesar.Name = "BingkaiBesar"
BingkaiBesar.Parent = Layar
BingkaiBesar.BackgroundColor3 = Pengaturan.WarnaLatar
BingkaiBesar.Position = UDim2.new(0, Pengaturan.Posisi.X, 0, Pengaturan.Posisi.Y)
BingkaiBesar.Size = UDim2.new(0, 280, 0, 380)
BingkaiBesar.Visible = false
BingkaiBesar.Active = true
local SudutBesar = Instance.new("UICorner")
SudutBesar.CornerRadius = UDim.new(0.08, 0)
SudutBesar.Parent = BingkaiBesar

-- 🖱️ BAGIAN ATAS: TEMPAT GESER DAN JUDUL
local BarAtas = Instance.new("Frame")
BarAtas.Name = "BarAtas"
BarAtas.Parent = BingkaiBesar
BarAtas.BackgroundColor3 = Pengaturan.WarnaUtama
BarAtas.BackgroundTransparency = 0.2
BarAtas.Size = UDim2.new(1, 0, 0, 35)
BarAtas.Position = UDim2.new(0,0,0,0)
local SudutAtas = Instance.new("UICorner")
SudutAtas.CornerRadius = UDim.new(0.08, 0)
SudutAtas.Parent = BarAtas

local Judul = Instance.new("TextLabel")
Judul.Name = "Judul"
Judul.Parent = BarAtas
Judul.BackgroundTransparency = 1
Judul.Position = UDim2.new(0, 12, 0, 0)
Judul.Size = UDim2.new(0.8, 0, 1, 0)
Judul.Text = "BLOOD BEC"
Judul.TextColor3 = Pengaturan.WarnaTulisan
Judul.Font = Enum.Font.GothamBold
Judul.TextScaled = true
Judul.TextXAlignment = Enum.TextXAlignment.Left

local TombolTutup = Instance.new("TextButton")
TombolTutup.Name = "TombolTutup"
TombolTutup.Parent = BarAtas
TombolTutup.BackgroundTransparency = 1
TombolTutup.Position = UDim2.new(0.9, -25, 0, 0)
TombolTutup.Size = UDim2.new(0, 25, 1, 0)
TombolTutup.Text = "−"
TombolTutup.TextColor3 = Pengaturan.WarnaTulisan
TombolTutup.Font = Enum.Font.GothamBold
TombolTutup.TextScaled = true

-- 📋 TEMPAT SEMUA FITUR
local Wadah = Instance.new("ScrollingFrame")
Wadah.Name = "WadahFitur"
Wadah.Parent = BingkaiBesar
Wadah.BackgroundTransparency = 1
Wadah.Position = UDim2.new(0, 15, 0, 45)
Wadah.Size = UDim2.new(1, -30, 1, -50)
Wadah.ScrollBarThickness = 3
Wadah.ScrollBarImageColor3 = Pengaturan.WarnaUtama
Wadah.CanvasSize = UDim2.new(0,0,0, 350)

-- ==============================================
-- 🖱️ SISTEM BISA DIGESER KE MANA SAJA
-- ==============================================
BarAtas.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Pengaturan.GeserAktif = true
        Pengaturan.PosisiTetap = Input.Position - Vector2.new(BingkaiBesar.AbsolutePosition.X, BingkaiBesar.AbsolutePosition.Y)
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Pengaturan.GeserAktif = false
        Pengaturan.Posisi = Vector2.new(BingkaiBesar.AbsolutePosition.X, BingkaiBesar.AbsolutePosition.Y)
    end
end)

UIS.InputChanged:Connect(function(Input)
    if Pengaturan.GeserAktif and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local PosisiBaru = Input.Position - Pengaturan.PosisiTetap
        BingkaiBesar.Position = UDim2.new(0, PosisiBaru.X, 0, PosisiBaru.Y)
        BingkaiKecil.Position = UDim2.new(0, PosisiBaru.X, 0, PosisiBaru.Y)
    end
end)

-- 🔄 GANTI BENTUK KECIL/BESAR
local function GantiBentuk()
    BingkaiBesar.Visible = not BingkaiBesar.Visible
    BingkaiKecil.Visible = not BingkaiKecil.Visible
end
BingkaiKecil.MouseButton1Click:Connect(GantiBentuk)
TombolTutup.MouseButton1Click:Connect(GantiBentuk)

-- ==============================================
-- 🧩 CARA MEMBUAT TOMBOL SEPERTI CONTOH GAMBAR
-- ==============================================
local function BuatTombol(Nama, PosisiY)
    local Bingkai = Instance.new("Frame")
    Bingkai.Name = "Fitur_"..Nama
    Bingkai.Parent = Wadah
    Bingkai.BackgroundTransparency = 1
    Bingkai.Position = UDim2.new(0, 0, 0, PosisiY)
    Bingkai.Size = UDim2.new(1, 0, 0, 35)
    
    local Teks = Instance.new("TextLabel")
    Teks.Name = "Teks"
    Teks.Parent = Bingkai
    Teks.BackgroundTransparency = 1
    Teks.Position = UDim2.new(0, 5, 0, 0)
    Teks.Size = UDim2.new(0.75, 0, 1, 0)
    Teks.Text = Nama
    Teks.TextColor3 = Pengaturan.WarnaTulisan
    Teks.Font = Enum.Font.Gotham
    Teks.TextXAlignment = Enum.TextXAlignment.Left
    Teks.TextScaled = true
    
    -- TOMBOL SAKLAR BULAT SEPERTI DI GAMBAR
    local Saklar = Instance.new("Frame")
    Saklar.Name = "Saklar"
    Saklar.Parent = Bingkai
    Saklar.BackgroundColor3 = Color3.new(0.3,0.3,0.3) -- Warna abu saat mati
    Saklar.Position = UDim2.new(0.8, 0, 0.2, 0)
    Saklar.Size = UDim2.new(0, 40, 0, 20)
    local SudutSaklar = Instance.new("UICorner")
    SudutSaklar.CornerRadius = UDim.new(1,0)
    SudutSaklar.Parent = Saklar
    
    local Bola = Instance.new("Frame")
    Bola.Name = "Bola"
    Bola.Parent = Saklar
    Bola.BackgroundColor3 = Color3.new(1,1,1)
    Bola.Position = UDim2.new(0, 2, 0, 2)
    Bola.Size = UDim2.new(0, 16, 0, 16)
    local SudutBola = Instance.new("UICorner")
    SudutBola.CornerRadius = UDim.new(1,0)
    SudutBola.Parent = Bola
    
    local Klik = Instance.new("TextButton")
    Klik.Name = "Klik"
    Klik.Parent = Bingkai
    Klik.BackgroundTransparency = 1
    Klik.Size = UDim2.new(1,0,1,0)
    
    -- Fungsi ubah warna saat nyala/mati
    local Aktif = false
    local function UbahStatus()
        Aktif = not Aktif
        if Aktif then
            Saklar.BackgroundColor3 = Pengaturan.WarnaUtama -- Jadi hijau / warna pilihan
            Bola.Position = UDim2.new(0, 22, 0, 2) -- Geser ke kanan
        else
            Saklar.BackgroundColor3 = Color3.new(0.3,0.3,0.3) -- Kembali abu
            Bola.Position = UDim2.new(0, 2, 0, 2) -- Kembali kiri
        end
    end
    
    return Bingkai, Klik, UbahStatus, function() return Aktif end
end

-- ==============================================
-- 🎨 FITUR GANTI WARNA
-- ==============================================
local _, KlikWarna, _, _ = BuatTombol("Ganti Warna", 300)
local IndeksWarna = 1
KlikWarna.MouseButton1Click:Connect(function()
    IndeksWarna = IndeksWarna + 1
    if IndeksWarna > #DaftarWarna then IndeksWarna = 1 end
    Pengaturan.WarnaUtama = DaftarWarna[IndeksWarna].Nilai
    
    -- Terapkan warna baru ke semua bagian
    BarAtas.BackgroundColor3 = Pengaturan.WarnaUtama
    Wadah.ScrollBarImageColor3 = Pengaturan.WarnaUtama
    TeksKecil.TextColor3 = Pengaturan.WarnaUtama
end)

-- ==============================================
-- 🎯 FITUR AIMBOT
-- ==============================================
local _, KlikAimbot, UbahAimbot, DapatStatusAimbot = BuatTombol("Aimbot", 10)
KlikAimbot.MouseButton1Click:Connect(function()
    UbahAimbot()
    Pengaturan.Aimbot.Aktif = DapatStatusAimbot()
end)

-- Fungsi cari musuh terdekat
local function CariMusuhTerdekat()
    local JarakTerdekat = math.huge
    local SasaranTerbaik = nil
    for _, Pemain in pairs(game.Players:GetPlayers()) do
        if Pemain ~= PemainLokal and Pemain.Character and Pemain.Character:FindFirstChild(Pengaturan.Aimbot.BagianSasaran) and Pemain.Character:FindFirstChild("Humanoid") and Pemain.Character.Humanoid.Health > 0 then
            local Bagian = Pemain.Character[Pengaturan.Aimbot.BagianSasaran]
            local PosisiLayar, Terlihat = Kamera:WorldToViewportPoint(Bagian.Position)
            if Terlihat then
                local Jarak = (Vector2.new(PosisiLayar.X, PosisiLayar.Y) - Vector2.new(Kamera.ViewportSize.X/2, Kamera.ViewportSize.Y/2)).Magnitude
                if Jarak < JarakTerdekat then
                    JarakTerdekat = Jarak
                    SasaranTerbaik = Bagian
                end
            end
        end
    end
    return SasaranTerbaik
end

-- ==============================================
-- 👁️ FITUR 3 JENIS ESP
-- ==============================================

-- 📦 ESP KOTAK
local _, KlikESPKotak, UbahESPKotak, DapatStatusKotak = BuatTombol("ESP Kotak", 60)
KlikESPKotak.MouseButton1Click:Connect(function()
    UbahESPKotak()
    Pengaturan.ESP.Kotak = DapatStatusKotak()
    if not Pengaturan.ESP.Kotak then
        for _, v in pairs(Layar:GetChildren()) do if v.Name == "ESP_KOTAK" then v:Destroy() end end
    end
end)

-- 📝 ESP NAMA
local _, KlikESPNama, UbahESPNama, DapatStatusNama = BuatTombol("ESP Nama", 110)
KlikESPNama.MouseButton1Click:Connect(function()
    UbahESPNama()
    Pengaturan.ESP.Nama = DapatStatusNama()
    if not Pengaturan.ESP.Nama then
        for _, v in pairs(workspace:GetDescendants()) do if v.Name == "ESP_NAMA" then v:Destroy() end end
    end
end)

-- 📍 ESP GARIS
local _, KlikESPGaris, UbahESPGaris, DapatStatusGaris = BuatTombol("ESP Garis", 160)
KlikESPGaris.MouseButton1Click:Connect(function()
    UbahESPGaris()
    Pengaturan.ESP.Garis = DapatStatusGaris()
    if not Pengaturan.ESP.Garis then
        for _, v in pairs(Layar:GetChildren()) do if v.Name == "ESP_GARIS" then v:Destroy() end end
    end
end)

-- ==============================================
-- 🔄 SISTEM PERBARUI SETIAP SAAT
-- ==============================================
RS.RenderStepped:Connect(function()
    -- PERBARUI AIMBOT
    if Pengaturan.Aimbot.Aktif then
        local Sasaran = CariMusuhTerdekat()
        if Sasaran then
            Kamera.CFrame = CFrame.new(Kamera.CFrame.Position, Sasaran.Position)
        end
    end
    
    -- HAPUS SEMUA ESP LAMA
    for _, v in pairs(Layar:GetChildren()) do if v:IsA("Frame") and v.Name ~= "BingkaiKecil" and v.Name ~= "BingkaiBesar" then v:Destroy() end end
    
    -- PERBARUI SEMUA ESP AKTIF
    for _, Pemain in pairs(game.Players:GetPlayers()) do
        if Pemain ~= PemainLokal and Pemain.Character and Pemain.Character:FindFirstChild("Head") and Pemain.Character:FindFirstChild("Humanoid") and Pemain.Character.Humanoid.Health > 0 then
            local Karakter = Pemain.Character
            local Kepala = Karakter.Head
            local Tubuh = Karakter:FindFirstChild("HumanoidRootPart")
            if Tubuh then
                -- Hitung posisi di layar
                local PosisiTubuh, IsiTerlihat = Kamera:WorldToViewportPoint(Tubuh.Position)
                local PosisiKaki = Kamera:WorldToViewportPoint(Tubuh.Position - Vector3.new(0, 3, 0))
                local PosisiAtas = Kamera:WorldToViewportPoint(Tubuh.Position + Vector3.new(0, 4, 0))
                
                if IsiTerlihat then
                    -- 📦 GAMBAR KOTAK
                    if Pengaturan.ESP.Kotak then
                        local Lebar = math.clamp(1500 / PosisiTubuh.Z, 15, 45)
                        local Tinggi = Lebar * 1.6
                        
                        local Kotak = Instance.new("Frame")
                        Kotak.Name = "ESP_KOTAK"
                        Kotak.Parent = Layar
                        Kotak.BackgroundTransparency = 1
                        Kotak.BorderMode = Enum.BorderMode.Inset
                        Kotak.Position = UDim2.new(0, PosisiTubuh.X - Lebar/2, 0, PosisiAtas.Y)
                        Kotak.Size = UDim2.new(0, Lebar, 0, PosisiKaki.Y - PosisiAtas.Y)
                        
                        local GarisBingkai = Instance.new("Frame")
                        GarisBingkai.Name = "GarisBingkai"
                        GarisBingkai.Parent = Kotak
                        GarisBingkai.BackgroundColor3 = Pengaturan.WarnaUtama
                        GarisBingkai.BorderSizePixel = 0
                        GarisBingkai.Position = UDim2.new(0,0,0,0)
                        GarisBingkai.Size = UDim2.new(1,0,1,0)
                        GarisBingkai.BackgroundTransparency = 0
                        GarisBingkai.BorderMode = Enum.BorderMode.Outline
                        GarisBingkai.BorderColor3 = Pengaturan.WarnaUtama
                        GarisBingkai.BorderWidthPixel = 1
                    end
                    
                    -- 📍 GAMBAR GARIS
                    if Pengaturan.ESP.Garis then
                        local Garis = Instance.new("Frame")
                        Garis.Name = "ESP_GARIS"
                        Garis.Parent = Layar
                        Garis.BackgroundColor3 = Pengaturan.WarnaUtama
                        Garis.BorderSizePixel = 0
                        Garis.AnchorPoint = Vector2.new(0.5, 0.5)
                        Garis.Position = UDim2.new(0, PosisiTubuh.X, 0, PosisiTubuh.Y)
                        Garis.Size = UDim2.new(0, 1, 0, (Kamera.ViewportSize.Y - PosisiTubuh.Y))
                        Garis.Rotation = math.deg(math.atan2((PosisiTubuh.X - Kamera.ViewportSize.X/2), (PosisiTubuh.Y - Kamera.ViewportSize.Y)))
                    end
                end
            end
            
            -- 📝 TAMPILKAN NAMA
            if Pengaturan.ESP.Nama and Kepala then
                local TampilanLama = Kepala:FindFirstChild("ESP_NAMA")
                if TampilanLama then TampilanLama:Destroy() end
                
                local TampilanNama = Instance.new("BillboardGui")
                TampilanNama.Name = "ESP_NAMA"
                TampilanNama.Parent = Kepala
                TampilanNama.Adornee = Kepala
                TampilanNama.Size = UDim2.new(4, 0, 2, 0)
                TampilanNama.AlwaysOnTop = true
                
                local TeksNama = Instance.new("TextLabel")
                TeksNama.Name = "TeksNama"
                TeksNama.Parent = TampilanNama
                TeksNama.BackgroundTransparency = 1
                TeksNama.Size = UDim2.new(1, 0, 1, 0)
                TeksNama.Text = Pemain.Name
                TeksNama.TextColor3 = Pengaturan.WarnaUtama
                TeksNama.Font = Enum.Font.GothamBold
                TeksNama.TextScaled = true
            end
        end
    end
end)

print("[✅] BLOOD BEC BERHASIL DIMUAT! KLIK KOTAK BEC UNTUK MEMBUKA MENU!")
