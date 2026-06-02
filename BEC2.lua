-- ⚡ BLOOD BEC SYSTEM | DIPERBAIKI SESUAI PERMINTAAN AKHIR 👑
-- 🩸 TANPA KOTAK KECIL | LANGSUNG MUNCUL MENU BESAR 🩸
-- 🎯 AIMBOT LEMBUT | KAMERA BEBAS BERGERAK KIRI KANAN 🎯

-- LAYANAN PENDUKUNG
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local PemainLokal = game.Players.LocalPlayer
local Kamera = workspace.CurrentCamera
local Mouse = PemainLokal:GetMouse()

-- PENGATURAN UTAMA
local Pengaturan = {
    Posisi = Vector2.new(100, 100),
    GeserAktif = false,
    PosisiTetap = Vector2.new(0,0),
    WarnaUtama = Color3.new(0, 1, 0), -- Hijau keren
    WarnaTulisan = Color3.new(1,1,1),
    WarnaLatar = Color3.new(0.08, 0.08, 0.1),
    -- FITUR
    Aimbot = {
        Aktif = false,
        Sasaran = nil,
        Bagian = "Head", -- Bisa diganti ke "HumanoidRootPart" kalau mau
        Kekuatan = 0.15 -- Semakin kecil semakin halus, semakin besar semakin kencang
    },
    ESP = {
        Kotak = false,
        Nama = false,
        Garis = false
    }
}

-- DAFTAR WARNA
local DaftarWarna = {
    {Nama = "Hijau", Nilai = Color3.new(0, 1, 0)},
    {Nama = "Merah", Nilai = Color3.new(1, 0.2, 0.2)},
    {Nama = "Biru", Nilai = Color3.new(0.2, 0.5, 1)},
    {Nama = "Kuning", Nilai = Color3.new(1, 1, 0.2)},
    {Nama = "Ungu", Nilai = Color3.new(0.7, 0.2, 1)},
    {Nama = "Putih", Nilai = Color3.new(1,1,1)}
}

-- ==============================================
-- 🎨 TAMPILAN MENU (LANGSUNG MUNCUL BESAR) 🎨
-- ==============================================
local Layar = Instance.new("ScreenGui")
Layar.Name = "BLOOD_BEC_MAIN"
Layar.Parent = game.CoreGui
Layar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 📂 KERANGKA UTAMA
local BingkaiUtama = Instance.new("Frame")
BingkaiUtama.Name = "BingkaiUtama"
BingkaiUtama.Parent = Layar
BingkaiUtama.BackgroundColor3 = Pengaturan.WarnaLatar
BingkaiUtama.Position = UDim2.new(0, Pengaturan.Posisi.X, 0, Pengaturan.Posisi.Y)
BingkaiUtama.Size = UDim2.new(0, 290, 0, 400)
BingkaiUtama.Visible = true -- LANGSUNG MUNCUL
BingkaiUtama.Active = true
BingkaiUtama.Draggable = false
local SudutBesar = Instance.new("UICorner")
SudutBesar.CornerRadius = UDim.new(0.08, 0)
SudutBesar.Parent = BingkaiUtama

-- 🖱️ BAGIAN ATAS (TEMPAT DIGESER & JUDUL)
local BarAtas = Instance.new("Frame")
BarAtas.Name = "BarAtas"
BarAtas.Parent = BingkaiUtama
BarAtas.BackgroundColor3 = Pengaturan.WarnaUtama
BarAtas.BackgroundTransparency = 0.2
BarAtas.Size = UDim2.new(1, 0, 0, 40)
BarAtas.Position = UDim2.new(0,0,0,0)
local SudutAtas = Instance.new("UICorner")
SudutAtas.CornerRadius = UDim.new(0.08, 0)
SudutAtas.Parent = BarAtas

local Judul = Instance.new("TextLabel")
Judul.Name = "Judul"
Judul.Parent = BarAtas
Judul.BackgroundTransparency = 1
Judul.Position = UDim2.new(0, 15, 0, 0)
Judul.Size = UDim2.new(0.8, 0, 1, 0)
Judul.Text = "BLOOD BEC | AIMBOT & ESP"
Judul.TextColor3 = Pengaturan.WarnaTulisan
Judul.Font = Enum.Font.GothamBold
Judul.TextScaled = true
Judul.TextXAlignment = Enum.TextXAlignment.Left

-- 📋 TEMPAT SEMUA FITUR
local WadahFitur = Instance.new("ScrollingFrame")
WadahFitur.Name = "WadahFitur"
WadahFitur.Parent = BingkaiUtama
WadahFitur.BackgroundTransparency = 1
WadahFitur.Position = UDim2.new(0, 15, 0, 55)
WadahFitur.Size = UDim2.new(1, -30, 1, -60)
WadahFitur.ScrollBarThickness = 3
WadahFitur.ScrollBarImageColor3 = Pengaturan.WarnaUtama
WadahFitur.CanvasSize = UDim2.new(0,0,0, 330)

-- ==============================================
-- 🖱️ SISTEM BISA DIGESER KE MANA SAJA
-- ==============================================
BarAtas.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Pengaturan.GeserAktif = true
        Pengaturan.PosisiTetap = Input.Position - Vector2.new(BingkaiUtama.AbsolutePosition.X, BingkaiUtama.AbsolutePosition.Y)
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
        Pengaturan.GeserAktif = false
        Pengaturan.Posisi = Vector2.new(BingkaiUtama.AbsolutePosition.X, BingkaiUtama.AbsolutePosition.Y)
    end
end)

UIS.InputChanged:Connect(function(Input)
    if Pengaturan.GeserAktif and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
        local PosisiBaru = Input.Position - Pengaturan.PosisiTetap
        BingkaiUtama.Position = UDim2.new(0, PosisiBaru.X, 0, PosisiBaru.Y)
    end
end)

-- ==============================================
-- 🧩 CARA MEMBUAT TOMBOL SAKLAR SEPERTI GAMBAR
-- ==============================================
local function BuatTombol(Nama, PosisiY)
    local Bingkai = Instance.new("Frame")
    Bingkai.Name = "Tombol_"..Nama
    Bingkai.Parent = WadahFitur
    Bingkai.BackgroundTransparency = 1
    Bingkai.Position = UDim2.new(0, 0, 0, PosisiY)
    Bingkai.Size = UDim2.new(1, 0, 0, 40)
    
    local Teks = Instance.new("TextLabel")
    Teks.Name = "Teks"
    Teks.Parent = Bingkai
    Teks.BackgroundTransparency = 1
    Teks.Position = UDim2.new(0, 8, 0, 0)
    Teks.Size = UDim2.new(0.75, 0, 1, 0)
    Teks.Text = Nama
    Teks.TextColor3 = Pengaturan.WarnaTulisan
    Teks.Font = Enum.Font.Gotham
    Teks.TextXAlignment = Enum.TextXAlignment.Left
    Teks.TextScaled = true
    
    -- Tombol Bulat Saklar
    local Saklar = Instance.new("Frame")
    Saklar.Name = "Saklar"
    Saklar.Parent = Bingkai
    Saklar.BackgroundColor3 = Color3.new(0.3,0.3,0.3) -- Abu saat mati
    Saklar.Position = UDim2.new(0.8, 0, 0.25, 0)
    Saklar.Size = UDim2.new(0, 45, 0, 22)
    local SudutSaklar = Instance.new("UICorner")
    SudutSaklar.CornerRadius = UDim.new(1,0)
    SudutSaklar.Parent = Saklar
    
    local Bola = Instance.new("Frame")
    Bola.Name = "Bola"
    Bola.Parent = Saklar
    Bola.BackgroundColor3 = Color3.new(1,1,1)
    Bola.Position = UDim2.new(0, 3, 0, 3)
    Bola.Size = UDim2.new(0, 16, 0, 16)
    local SudutBola = Instance.new("UICorner")
    SudutBola.CornerRadius = UDim.new(1,0)
    SudutBola.Parent = Bola
    
    local DaerahKlik = Instance.new("TextButton")
    DaerahKlik.Name = "DaerahKlik"
    DaerahKlik.Parent = Bingkai
    DaerahKlik.BackgroundTransparency = 1
    DaerahKlik.Size = UDim2.new(1,0,1,0)
    
    local Aktif = false
    local function UbahStatus()
        Aktif = not Aktif
        if Aktif then
            Saklar.BackgroundColor3 = Pengaturan.WarnaUtama -- Hijau saat nyala
            Bola.Position = UDim2.new(0, 26, 0, 3)
        else
            Saklar.BackgroundColor3 = Color3.new(0.3,0.3,0.3)
            Bola.Position = UDim2.new(0, 3, 0, 3)
        end
    end
    
    return DaerahKlik, UbahStatus, function() return Aktif end
end

-- ==============================================
-- 🎨 FITUR GANTI WARNA
-- ==============================================
local KlikWarna, _, _ = BuatTombol("Ubah Warna Tampilan", 290)
local IndeksWarna = 1
KlikWarna.MouseButton1Click:Connect(function()
    IndeksWarna = IndeksWarna + 1
    if IndeksWarna > #DaftarWarna then IndeksWarna = 1 end
    Pengaturan.WarnaUtama = DaftarWarna[IndeksWarna].Nilai
    
    -- Terapkan ke semua bagian
    BarAtas.BackgroundColor3 = Pengaturan.WarnaUtama
    WadahFitur.ScrollBarImageColor3 = Pengaturan.WarnaUtama
end)

-- ==============================================
-- 🎯 FITUR AIMBOT (KUNCI OTOMATIS + KAMERA BEBAS)
-- ==============================================
local KlikAimbot, UbahAimbot, StatusAimbot = BuatTombol("AKTIFKAN AIMBOT", 15)
KlikAimbot.MouseButton1Click:Connect(function()
    UbahAimbot()
    Pengaturan.Aimbot.Aktif = StatusAimbot()
    if not Pengaturan.Aimbot.Aktif then Pengaturan.Aimbot.Sasaran = nil end
end)

-- Fungsi Cari Pemain Terdekat
local function CariSasaranTerbaik()
    local JarakTerdekat = math.huge
    local SasaranTerpilih = nil
    
    for _, Pemain in pairs(game.Players:GetPlayers()) do
        if Pemain ~= PemainLokal and Pemain.Character then
            local BagianSasaran = Pemain.Character:FindFirstChild(Pengaturan.Aimbot.Bagian)
            local Nyawa = Pemain.Character:FindFirstChild("Humanoid") and Pemain.Character.Humanoid.Health > 0
            
            if BagianSasaran and Nyawa then
                local PosisiLayar, Terlihat = Kamera:WorldToViewportPoint(BagianSasaran.Position)
                if Terlihat then
                    local Jarak = (Vector2.new(PosisiLayar.X, PosisiLayar.Y) - Vector2.new(Kamera.ViewportSize.X/2, Kamera.ViewportSize.Y/2)).Magnitude
                    if Jarak < JarakTerdekat then
                        JarakTerdekat = Jarak
                        SasaranTerpilih = BagianSasaran
                    end
                end
            end
        end
    end
    return SasaranTerpilih
end

-- ==============================================
-- 👁️ FITUR 3 JENIS ESP
-- ==============================================

-- 📦 ESP KOTAK
local KlikKotak, UbahKotak, StatusKotak = BuatTombol("ESP KOTAK PEMAIN", 70)
KlikKotak.MouseButton1Click:Connect(function()
    UbahKotak()
    Pengaturan.ESP.Kotak = StatusKotak()
end)

-- 📝 ESP NAMA
local KlikNama, UbahNama, StatusNama = BuatTombol("ESP TAMPILKAN NAMA", 125)
KlikNama.MouseButton1Click:Connect(function()
    UbahNama()
    Pengaturan.ESP.Nama = StatusNama()
end)

-- 📍 ESP GARIS
local KlikGaris, UbahGaris, StatusGaris = BuatTombol("ESP GARIS PENUNJUK", 180)
KlikGaris.MouseButton1Click:Connect(function()
    UbahGaris()
    Pengaturan.ESP.Garis = StatusGaris()
end)

-- ==============================================
-- 🔄 SISTEM PERBARUI SETIAP DETIK
-- ==============================================
RS.RenderStepped:Connect(function()
    -- ==============================================
    -- PROSES AIMBOT (HALUS & BISA GERAK KIRI KANAN)
    -- ==============================================
    if Pengaturan.Aimbot.Aktif then
        Pengaturan.Aimbot.Sasaran = CariSasaranTerbaik()
        if Pengaturan.Aimbot.Sasaran then
            -- HITUNG ARAH TAMBAHAN AGAR TETAP KUNCI TAPI BISA DIGERAKAN SEDIKIT
            local PosisiSasaran = Pengaturan.Aimbot.Sasaran.Position
            local PosisiKamera = Kamera.CFrame.Position
            
            -- ARAH DASAR KE MUSUH
            local ArahTujuan = (PosisiSasaran - PosisiKamera).Unit
            
            -- ARAH SEKARANG
            local ArahSekarang = Kamera.CFrame.LookVector
            
            -- GABUNGKAN AGAR HALUS (SEMakin kecil kekuatan semakin lama sampai)
            local ArahBaru = ArahSekarang:Lerp(ArahTujuan, Pengaturan.Aimbot.Kekuatan)
            
            -- TERAPKAN KE KAMERA: TETAP KUNCI TAPI KAMERA TETAP BISA DIGERAKAN
            Kamera.CFrame = CFrame.new(PosisiKamera, PosisiKamera + ArahBaru)
        end
    end
    
    -- HAPUS SEMUA GAMBARAN ESP LAMA
    for _, Objek in pairs(Layar:GetChildren()) do
        if Objek:IsA("Frame") and Objek.Name ~= "BingkaiUtama" then
            Objek:Destroy()
        end
    end
    
    -- ==============================================
    -- PROSES SEMUA JENIS ESP
    -- ==============================================
    for _, Pemain in pairs(game.Players:GetPlayers()) do
        if Pemain ~= PemainLokal and Pemain.Character then
            local Kepala = Pemain.Character:FindFirstChild("Head")
            local Tubuh = Pemain.Character:FindFirstChild("HumanoidRootPart")
            local Nyawa = Pemain.Character:FindFirstChild("Humanoid") and Pemain.Character.Humanoid.Health > 0
            
            if Kepala and Tubuh and Nyawa then
                -- HITUNG POSISI DI LAYAR
                local PosisiTengah, Terlihat = Kamera:WorldToViewportPoint(Tubuh.Position)
                local PosisiAtas = Kamera:WorldToViewportPoint(Tubuh.Position + Vector3.new(0, 3.5, 0))
                local PosisiBawah = Kamera:WorldToViewportPoint(Tubuh.Position - Vector3.new(0, 3.5, 0))
                
                if Terlihat then
                    -- 📦 GAMBAR KOTAK DI SEKITAR TUBUH
                    if Pengaturan.ESP.Kotak then
                        local Lebar = math.clamp(1500 / PosisiTengah.Z, 12, 50)
                        local Tinggi = PosisiBawah.Y - PosisiAtas.Y
                        
                        local Kotak = Instance.new("Frame")
                        Kotak.Name = "ESP_KOTAK"
                        Kotak.Parent = Layar
                        Kotak.BackgroundTransparency = 1
                        Kotak.Position = UDim2.new(0, PosisiTengah.X - Lebar/2, 0, PosisiAtas.Y)
                        Kotak.Size = UDim2.new(0, Lebar, 0, Tinggi)
                        
                        local GarisTepi = Instance.new("Frame")
                        GarisTepi.Name = "GarisTepi"
                        GarisTepi.Parent = Kotak
                        GarisTepi.BackgroundColor3 = Pengaturan.WarnaUtama
                        GarisTepi.BorderSizePixel = 1
                        GarisTepi.BorderColor3 = Pengaturan.WarnaUtama
                        GarisTepi.Size = UDim2.new(1,0,1,0)
                        GarisTepi.BackgroundTransparency = 1
                    end
                    
                    -- 📍 GAMBAR GARIS DARI BAWAH KE MUSUH
                    if Pengaturan.ESP.Garis then
                        local Garis = Instance.new("Frame")
                        Garis.Name = "ESP_GARIS"
                        Garis.Parent = Layar
                        Garis.BackgroundColor3 = Pengaturan.WarnaUtama
                        Garis.BorderSizePixel = 0
                        Garis.AnchorPoint = Vector2.new(0.5, 0.5)
                        Garis.Position = UDim2.new(0, PosisiTengah.X, 0, PosisiTengah.Y)
                        Garis.Size = UDim2.new(0, 1, 0, (Kamera.ViewportSize.Y - PosisiTengah.Y))
                        Garis.Rotation = math.deg(math.atan2(
                            (PosisiTengah.X - Kamera.ViewportSize.X/2), 
                            (PosisiTengah.Y - Kamera.ViewportSize.Y/2)
                        ))
                    end
                end
                
                -- 📝 TAMPILKAN NAMA DI ATAS KEPALA
                if Pengaturan.ESP.Nama and Kepala then
                    local HapusLama = Kepala:FindFirstChild("ESP_NAMA")
                    if HapusLama then HapusLama:Destroy() end
                    
                    local TampilanNama = Instance.new("BillboardGui")
                    TampilanNama.Name = "ESP_NAMA"
                    TampilanNama.Parent = Kepala
                    TampilanNama.Adornee = Kepala
                    TampilanNama.Size = UDim2.new(5, 0, 2, 0)
                    TampilanNama.AlwaysOnTop = true
                    
                    local TeksNama = Instance.new("TextLabel")
                    TeksNama.Name = "TeksNama"
                    TeksNama.Parent = TampilanNama
                    TeksNama.BackgroundTransparency = 1
                    TeksNama.Size = UDim2.new(1,0,1,0)
                    TeksNama.Text = Pemain.Name
                    TeksNama.TextColor3 = Pengaturan.WarnaUtama
                    TeksNama.Font = Enum.Font.GothamBold
                    TeksNama.TextScaled = true
                end
            end
        end
    end
end)

print("[✅] SUKSES! BLOOD BEC SUDAH SIAP DIPAKAI! SELAMAT BERMAIN!")
