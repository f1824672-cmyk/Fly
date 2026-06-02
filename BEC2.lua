-- ⚡ AURORA LITE SYSTEM | PERBAIKAN TOTAL UNTUK TUAN SKY 👑
-- 🩸 NAMA: BLOOD BEC | VERSI TANPA CACAT 🩸

-- PENGATURAN UTAMA
local Pengaturan = {
    PosisiX = 50,
    PosisiY = 50,
    UkuranTampilan = 1,
    WarnaSaatIni = "Merah",
    GeserMenu = true,
    MenuTersembunyi = false, -- BUAT MENYEMBUNYIKAN MENU JADI KECIL
    -- NILAI YANG BISA DIATUR PENGGUNA
    KecepatanTerbang = 50, -- NILAI AWAL, BISA DIUBAH
    KecepatanJalan = 100, -- NILAI AWAL, BISA DIUBAH
    -- STATUS FITUR (BISA NYALA/MATI)
    FiturTerbangAktif = false,
    FiturKecepatanAktif = false,
    FiturESPAktif = false,
    FiturAimbotAktif = false
}

-- DAFTAR WARNA (SESOP PERINTAH)
local DaftarWarna = {
    Merah = Color3.new(1, 0, 0),
    Hitam = Color3.new(0, 0, 0),
    Putih = Color3.new(1, 1, 1),
    Kuning = Color3.new(1, 1, 0),
    Biru = Color3.new(0, 0, 1),
    Ungu = Color3.new(0.5, 0, 1)
}

-- ANTARMUKA UTAMA
local MenuUtama = Instance.new("ScreenGui")
local BingkaiUtama = Instance.new("Frame")
local TombolSembunyi = Instance.new("TextButton") -- TOMBOL KECIL BESAR
local LogoTeks = Instance.new("TextLabel")
local DaftarFitur = Instance.new("Frame")
local BingkaiKecil = Instance.new("Frame") -- TAMPILAN KETIKA DIKECILKAN
local TeksKecil = Instance.new("TextLabel")

-- KONFIGURASI DASAR
MenuUtama.Name = "BLOOD_BEC_SYSTEM_FIXED"
MenuUtama.Parent = game.CoreGui
MenuUtama.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- BINGKAI UTAMA
BingkaiUtama.Parent = MenuUtama
BingkaiUtama.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
BingkaiUtama.BorderSizePixel = 0
BingkaiUtama.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiUtama.Size = UDim2.new(0, 320, 0, 450)
BingkaiUtama.Active = true
BingkaiUtama.Draggable = Pengaturan.GeserMenu

-- TOMBOL DI KANAN ATAS BUAT KECILKAN MENU
TombolSembunyi.Parent = BingkaiUtama
TombolSembunyi.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
TombolSembunyi.BorderSizePixel = 0
TombolSembunyi.Position = UDim2.new(0.9, -25, 0, 5)
TombolSembunyi.Size = UDim2.new(0, 20, 0, 20)
TombolSembunyi.Text = "-"
TombolSembunyi.TextColor3 = Color3.new(1,1,1)
TombolSembunyi.Font = Enum.Font.GothamBold

-- TAMPILAN KETIKA DIKECILKAN
BingkaiKecil.Parent = MenuUtama
BingkaiKecil.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
BingkaiKecil.BorderSizePixel = 0
BingkaiKecil.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiKecil.Size = UDim2.new(0, 100, 0, 40)
BingkaiKecil.Visible = false
BingkaiKecil.Active = true
BingkaiKecil.Draggable = true

TeksKecil.Parent = BingkaiKecil
TeksKecil.BackgroundTransparency = 1
TeksKecil.Size = UDim2.new(1,0,1,0)
TeksKecil.Text = "BLOOD BEC 🩸"
TeksKecil.TextColor3 = Color3.new(1,1,1)
TeksKecil.Font = Enum.Font.GothamBold
TeksKecil.TextScaled = true

-- LOGO UTAMA
LogoTeks.Parent = BingkaiUtama
LogoTeks.BackgroundColor3 = Color3.new(1, 1, 1, 0.1)
LogoTeks.BorderSizePixel = 0
LogoTeks.Position = UDim2.new(0, 10, 0, 10)
LogoTeks.Size = UDim2.new(1, -20, 0, 50)
LogoTeks.Font = Enum.Font.GothamBold
LogoTeks.Text = "BLOOD BEC 🩸"
LogoTeks.TextColor3 = Color3.new(1,1,1)
LogoTeks.TextScaled = true

-- TEMPAT FITUR
DaftarFitur.Parent = BingkaiUtama
DaftarFitur.BackgroundTransparency = 1
DaftarFitur.Position = UDim2.new(0, 15, 0, 70)
DaftarFitur.Size = UDim2.new(1, -30, 1, -80)

-- FUNGSI GANTI WARNA
local function GantiWarna(NamaWarna)
    if DaftarWarna[NamaWarna] then
        Pengaturan.WarnaSaatIni = NamaWarna
        BingkaiUtama.BackgroundColor3 = DaftarWarna[NamaWarna]
        BingkaiKecil.BackgroundColor3 = DaftarWarna[NamaWarna]
        -- PERBARUI SEMUA TOMBOL
        for _,v in pairs(DaftarFitur:GetChildren()) do
            if v:IsA("TextButton") or v:IsA("TextBox") then
                v.BackgroundColor3 = DaftarWarna[NamaWarna]
            end
        end
    end
end

-- FUNGSI MENYEMBUNYIKAN / MEMBESARKAN MENU
local function AturUkuranMenu()
    Pengaturan.MenuTersembunyi = not Pengaturan.MenuTersembunyi
    BingkaiUtama.Visible = not Pengaturan.MenuTersembunyi
    BingkaiKecil.Visible = Pengaturan.MenuTersembunyi
end
TombolSembunyi.MouseButton1Click:Connect(AturUkuranMenu)
BingkaiKecil.MouseButton1Click:Connect(AturUkuranMenu)

-- ==============================================
-- 🚀 FITUR 1: TERBANG YANG BENAR & ATUR KECEPATAN 🚀
-- ==============================================
local TombolTerbang = Instance.new("TextButton")
TombolTerbang.Parent = DaftarFitur
TombolTerbang.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolTerbang.BorderSizePixel = 0
TombolTerbang.Size = UDim2.new(1, 0, 0, 40)
TombolTerbang.Position = UDim2.new(0, 0, 0, 10)
TombolTerbang.Text = "❌ TERBANG (MATI)"
TombolTerbang.TextColor3 = Color3.new(1,1,1)

-- KOLOM ISI KECEPATAN TERBANG
local InputKecepatanTerbang = Instance.new("TextBox")
InputKecepatanTerbang.Parent = DaftarFitur
InputKecepatanTerbang.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
InputKecepatanTerbang.BorderSizePixel = 0
InputKecepatanTerbang.Position = UDim2.new(0, 0, 0, 55)
InputKecepatanTerbang.Size = UDim2.new(0.5, 0, 0, 35)
InputKecepatanTerbang.Text = "KECEPATAN: "..Pengaturan.KecepatanTerbang
InputKecepatanTerbang.TextColor3 = Color3.new(1,1,1)
InputKecepatanTerbang.Font = Enum.Font.Gotham
InputKecepatanTerbang.ClearTextOnFocus = true

InputKecepatanTerbang.FocusLost:Connect(function()
    local Angka = tonumber(InputKecepatanTerbang.Text)
    if Angka then
        Pengaturan.KecepatanTerbang = math.clamp(Angka, 10, 500) -- BATAS MIN MAKS
    end
    InputKecepatanTerbang.Text = "KECEPATAN: "..Pengaturan.KecepatanTerbang
end)

-- SISTEM TERBANG YANG BENAR
local SambunganTerbang
TombolTerbang.MouseButton1Click:Connect(function()
    Pengaturan.FiturTerbangAktif = not Pengaturan.FiturTerbangAktif
    
    if Pengaturan.FiturTerbangAktif then
        TombolTerbang.Text = "✅ TERBANG (NYALA)"
        local Pemain = game.Players.LocalPlayer
        local UIS = game:GetService("UserInputService")
        
        SambunganTerbang = game:GetService("RunService").RenderStepped:Connect(function()
            local Karakter = Pemain.Character
            if Karakter and Karakter:FindFirstChild("HumanoidRootPart") and Karakter:FindFirstChild("Humanoid") then
                Tubuh = Karakter.HumanoidRootPart
                Karakter.Humanoid.PlatformStand = true -- AGAR TIDAK JATUH
                
                -- ARAH GERAK YANG BENAR
                local Arah = Vector3.new()
                if UIS:IsKeyDown(Enum.KeyCode.W) then Arah += workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then Arah -= workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then Arah -= workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then Arah += workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then Arah += Vector3.new(0,1,0) end -- NAIK KE ATAS ✅
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then Arah += Vector3.new(0,-1,0) end -- TURUN KE BAWAH ✅
                
                Arah = Arah.Unit * Pengaturan.KecepatanTerbang
                Tubuh.Velocity = Arah
            end
        end)
    else
        TombolTerbang.Text = "❌ TERBANG (MATI)"
        if SambunganTerbang then SambunganTerbang:Disconnect() end
        -- KEMBALI KE JALAN BIASA
        local Karakter = game.Players.LocalPlayer.Character
        if Karakter and Karakter:FindFirstChild("Humanoid") then
            Karakter.Humanoid.PlatformStand = false
        end
    end
end)

-- ==============================================
-- ⚡ FITUR 2: KECEPATAN JALAN (BISA DIATUR NYALA/MATI) ⚡
-- ==============================================
local TombolKecepatan = Instance.new("TextButton")
TombolKecepatan.Parent = DaftarFitur
TombolKecepatan.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolKecepatan.BorderSizePixel = 0
TombolKecepatan.Position = UDim2.new(0, 0, 0, 100)
TombolKecepatan.Size = UDim2.new(1, 0, 0, 40)
TombolKecepatan.Text = "❌ KECEPATAN (MATI)"
TombolKecepatan.TextColor3 = Color3.new(1,1,1)

-- KOLOM ATUR KECEPATAN JALAN
local InputKecepatanJalan = Instance.new("TextBox")
InputKecepatanJalan.Parent = DaftarFitur
InputKecepatanJalan.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
InputKecepatanJalan.BorderSizePixel = 0
InputKecepatanJalan.Position = UDim2.new(0, 0, 0, 145)
InputKecepatanJalan.Size = UDim2.new(0.5, 0, 0, 35)
InputKecepatanJalan.Text = "JALAN: "..Pengaturan.KecepatanJalan
InputKecepatanJalan.TextColor3 = Color3.new(1,1,1)
InputKecepatanJalan.Font = Enum.Font.Gotham
InputKecepatanJalan.ClearTextOnFocus = true

InputKecepatanJalan.FocusLost:Connect(function()
    local Angka = tonumber(InputKecepatanJalan.Text)
    if Angka then Pengaturan.KecepatanJalan = math.clamp(Angka, 10, 500) end
    InputKecepatanJalan.Text = "JALAN: "..Pengaturan.KecepatanJalan
    -- JIKA SEDANG NYALA, LANGSUNG TERAPKAN
    if Pengaturan.FiturKecepatanAktif then
        local Karakter = game.Players.LocalPlayer.Character
        if Karakter and Karakter:FindFirstChild("Humanoid") then
            Karakter.Humanoid.WalkSpeed = Pengaturan.KecepatanJalan
        end
    end
end)

TombolKecepatan.MouseButton1Click:Connect(function()
    Pengaturan.FiturKecepatanAktif = not Pengaturan.FiturKecepatanAktif
    local Karakter = game.Players.LocalPlayer.Character
    if not Karakter or not Karakter:FindFirstChild("Humanoid") then return end
    
    if Pengaturan.FiturKecepatanAktif then
        TombolKecepatan.Text = "✅ KECEPATAN (NYALA)"
        Karakter.Humanoid.WalkSpeed = Pengaturan.KecepatanJalan
    else
        TombolKecepatan.Text = "❌ KECEPATAN (MATI)"
        Karakter.Humanoid.WalkSpeed = 16 -- KEMBALI KE KECEPATAN BIASA
    end
end)

-- ==============================================
-- 👁️ FITUR 3: ESP (LIHAT MUSUH NYALA/MATI) 👁️
-- ==============================================
local TombolESP = Instance.new("TextButton")
TombolESP.Parent = DaftarFitur
TombolESP.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolESP.BorderSizePixel = 0
TombolESP.Position = UDim2.new(0, 0, 0, 190)
TombolESP.Size = UDim2.new(1, 0, 0, 40)
TombolESP.Text = "❌ ESP (MATI)"
TombolESP.TextColor3 = Color3.new(1,1,1)

local SambunganESP
TombolESP.MouseButton1Click:Connect(function()
    Pengaturan.FiturESPAktif = not Pengaturan.FiturESPAktif
    
    if Pengaturan.FiturESPAktif then
        TombolESP.Text = "✅ ESP (NYALA)"
        -- HAPUS YANG LAMA KALAU ADA
        for _,v in pairs(workspace:GetDescendants()) do
            if v.Name == "ESP_BLOOD_BEC" then v:Destroy() end
        end
        
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
        TombolESP.Text = "❌ ESP (MATI)"
        if SambunganESP then SambunganESP:Disconnect() end
        -- HAPUS SEMUA GARIS
        for _,v in pairs(workspace:GetDescendants()) do
            if v.Name == "ESP_BLOOD_BEC" then v:Destroy() end
        end
    end
end)

-- ==============================================
-- 🎯 FITUR 4: AIMBOT (NYALA/MATI) 🎯
-- ==============================================
local TombolAimbot = Instance.new("TextButton")
TombolAimbot.Parent = DaftarFitur
TombolAimbot.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolAimbot.BorderSizePixel = 0
TombolAimbot.Position = UDim2.new(0, 0, 0, 235)
TombolAimbot.Size = UDim2.new(1, 0, 0, 40)
TombolAimbot.Text = "❌ AIMBOT (MATI)"
TombolAimbot.TextColor3 = Color3.new(1,1,1)

local SambunganAimbot
TombolAimbot.MouseButton1Click:Connect(function()
    Pengaturan.FiturAimbotAktif = not Pengaturan.FiturAimbotAktif
    local UIS = game:GetService("UserInputService")
    local Kamera = workspace.CurrentCamera
    
    if Pengaturan.FiturAimbotAktif then
        TombolAimbot.Text = "✅ AIMBOT (NYALA)"
        SambunganAimbot = UIS.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                while UIS:IsMouseButtonPressed(Enum.MouseButton2) do
                    task.wait()
                    -- CARI MUSUH TERDEKAT
                    local Sasaran, Jarak = nil, math.huge
                    for _,Pemain in pairs(game.Players:GetPlayers()) do
                        if Pemain ~= game.Players.LocalPlayer and Pemain.Character and Pemain.Character:FindFirstChild("Head") then
                            local Pos, Terlihat = Kamera:WorldToViewportPoint(Pemain.Character.Head.Position)
                            if Terlihat then
                                local JarakSekarang = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Kamera.ViewportSize.X/2, Kamera.ViewportSize.Y/2)).Magnitude
                                if JarakSekarang < Jarak then
                                    Jarak = JarakSekarang
                                    Sasaran = Pemain.Character.Head
                                end
                            end
                        end
                    end
                    -- KUNCI KE SANA
                    if Sasaran then Kamera.CFrame = CFrame.new(Kamera.CFrame.Position, Sasaran.Position) end
                end
            end
        end)
    else
        TombolAimbot.Text = "❌ AIMBOT (MATI)"
        if SambunganAimbot then SambunganAimbot:Disconnect() end
    end
end)

-- ==============================================
-- 🎨 FITUR GANTI WARNA 🎨
-- ==============================================
local TombolGantiWarna = Instance.new("TextButton")
TombolGantiWarna.Parent = DaftarFitur
TombolGantiWarna.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
TombolGantiWarna.BorderSizePixel = 0
TombolGantiWarna.Position = UDim2.new(0, 0, 0, 280)
TombolGantiWarna.Size = UDim2.new(1, 0, 0, 40)
TombolGantiWarna.Text = "UBAH WARNA TAMPILAN 🎨"
TombolGantiWarna.TextColor3 = Color3.new(1,1,1)

TombolGantiWarna.MouseButton1Click:Connect(function()
    local Daftar = {"Merah", "Hitam", "Putih", "Kuning", "Biru", "Ungu"}
    local Indeks = table.find(Daftar, Pengaturan.WarnaSaatIni) or 1
    Indeks = Indeks + 1
    if Indeks > #Daftar then Indeks = 1 end
    GantiWarna(Daftar[Indeks])
end)

print("[AURORA LITE] : SCRIPT BLOOD BEC DIPERBAIKI & SIAP! 🩸✅")
