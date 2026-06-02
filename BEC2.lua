-- ⚡ AURORA LITE SYSTEM | KECEPATAN BISA DIATUR SENDIRI OLEH TUAN SKY 👑
-- 🩸 NAMA: BLOOD BEC | BENTUK SEPERTI DELTA + ATUR ANGKA SENDIRI 🩸

-- PENGATURAN UTAMA
local Pengaturan = {
    PosisiX = 50,
    PosisiY = 50,
    UkuranTampilan = 1,
    WarnaSaatIni = "Merah",
    GeserMenu = true,
    MenuTersembunyi = false, -- BENTUK KECIL / BENTUK BESAR
    -- ✅ NILAI KECEPATAN BISA DIUBAH LANGSUNG DI MENU
    KecepatanTerbang = 50, -- NILAI AWAL, BISA DIUBAH JADI 100, 200, DLL
    KecepatanJalan = 30, -- NILAI AWAL, BISA DIUBAH JADI 20, 50, DLL
    -- STATUS FITUR
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
local BingkaiKecil = Instance.new("Frame") -- ✅ BENTUK KECIL SEPERTI DELTA
local TeksBECKecil = Instance.new("TextLabel") -- ✅ TULISAN "BEC" DI KOTAK KECIL
local BingkaiBesar = Instance.new("Frame") -- ✅ BENTUK BESAR PENUH
local LogoTeksBesar = Instance.new("TextLabel") -- ✅ TULISAN "BLOOD BEC" YANG BESAR
local TombolTutup = Instance.new("TextButton") -- TOMBOL KECILKAN
local DaftarFitur = Instance.new("Frame")

-- KONFIGURASI DASAR
MenuUtama.Name = "BLOOD_BEC_SYSTEM_FULL_SETTINGS"
MenuUtama.Parent = game.CoreGui
MenuUtama.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ==============================================
-- 📦 TAMPILAN KETIKA DIKECILKAN (SEPERTI DELTA) 📦
-- ==============================================
BingkaiKecil.Parent = MenuUtama
BingkaiKecil.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
BingkaiKecil.BorderSizePixel = 0
BingkaiKecil.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiKecil.Size = UDim2.new(0, 80, 0, 80) -- UKURAN KOTAK KECIL
BingkaiKecil.Visible = true -- MUNCUL PERTAMA KALI
BingkaiKecil.Active = true
BingkaiKecil.Draggable = true
BingkaiKecil.BackgroundTransparency = 0.0

-- TULISAN DI KOTAK KECIL
TeksBECKecil.Parent = BingkaiKecil
TeksBECKecil.BackgroundTransparency = 1
TeksBECKecil.Size = UDim2.new(1, 0, 1, 0)
TeksBECKecil.Text = "BEC" -- ✅ TULISAN YANG DIMINTA
TeksBECKecil.TextColor3 = Color3.new(1,1,1)
TeksBECKecil.Font = Enum.Font.GothamBlack
TeksBECKecil.TextScaled = true
TeksBECKecil.TextWrapped = true

-- ==============================================
-- 📂 TAMPILAN KETIKA DIBESARKAN (LENGKAP) 📂
-- ==============================================
BingkaiBesar.Parent = MenuUtama
BingkaiBesar.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
BingkaiBesar.BorderSizePixel = 0
BingkaiBesar.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiBesar.Size = UDim2.new(0, 320, 0, 480) -- DIPANJANGKAN BIAR MUAT KOLOM ANGKA
BingkaiBesar.Visible = false -- AWALNYA DISEMBUNYIKAN
BingkaiBesar.Active = true
BingkaiBesar.Draggable = true

-- TOMBOL KECILKAN DI POJOK KANAN ATAS
TombolTutup.Parent = BingkaiBesar
TombolTutup.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
TombolTutup.BorderSizePixel = 0
TombolTutup.Position = UDim2.new(0.9, -25, 0, 5)
TombolTutup.Size = UDim2.new(0, 20, 0, 20)
TombolTutup.Text = "-"
TombolTutup.TextColor3 = Color3.new(1,1,1)
TombolTutup.Font = Enum.Font.GothamBold

-- LOGO UTAMA DI ATAS (KETIKA DIBUKA)
LogoTeksBesar.Parent = BingkaiBesar
LogoTeksBesar.BackgroundColor3 = Color3.new(1, 1, 1, 0.1)
LogoTeksBesar.BorderSizePixel = 0
LogoTeksBesar.Position = UDim2.new(0, 10, 0, 10)
LogoTeksBesar.Size = UDim2.new(1, -20, 0, 60)
LogoTeksBesar.Font = Enum.Font.GothamBlack
LogoTeksBesar.Text = "BLOOD BEC" -- ✅ TULISAN UTAMA SAAT DIBUKA
LogoTeksBesar.TextColor3 = Color3.new(1,1,1)
LogoTeksBesar.TextScaled = true

-- TEMPAT FITUR
DaftarFitur.Parent = BingkaiBesar
DaftarFitur.BackgroundTransparency = 1
DaftarFitur.Position = UDim2.new(0, 15, 0, 80)
DaftarFitur.Size = UDim2.new(1, -30, 1, -90)

-- ==============================================
-- 🔄 FUNGSI GANTI BENTUK (KECIL <-> BESAR) 🔄
-- ==============================================
local function GantiBentuk()
    Pengaturan.MenuTersembunyi = not Pengaturan.MenuTersembunyi
    if Pengaturan.MenuTersembunyi then
        BingkaiBesar.Visible = false
        BingkaiKecil.Visible = true
    else
        BingkaiBesar.Visible = true
        BingkaiKecil.Visible = false
    end
end

-- JALANKAN FUNGSI KETIKA DIKLIK
BingkaiKecil.MouseButton1Click:Connect(GantiBentuk)
TombolTutup.MouseButton1Click:Connect(GantiBentuk)

-- ==============================================
-- 🎨 FUNGSI GANTI WARNA (BERLAKU UNTUK KEDUA BENTUK) 🎨
-- ==============================================
local function GantiWarna(NamaWarna)
    if DaftarWarna[NamaWarna] then
        Pengaturan.WarnaSaatIni = NamaWarna
        BingkaiBesar.BackgroundColor3 = DaftarWarna[NamaWarna]
        BingkaiKecil.BackgroundColor3 = DaftarWarna[NamaWarna]
        -- PERBARUI WARNA SEMUA TOMBOL
        for _,v in pairs(DaftarFitur:GetChildren()) do
            if v:IsA("TextButton") or v:IsA("TextBox") then
                v.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15) -- WARNA TOMBOL TETAP GELAP
            end
        end
    end
end

-- ==============================================
-- 🚀 FITUR TERBANG + KOLOM ISI ANGKA KECEPATAN 🚀
-- ==============================================
local TombolTerbang = Instance.new("TextButton")
TombolTerbang.Parent = DaftarFitur
TombolTerbang.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
TombolTerbang.BorderSizePixel = 0
TombolTerbang.Size = UDim2.new(1, 0, 0, 40)
TombolTerbang.Position = UDim2.new(0, 0, 0, 10)
TombolTerbang.Text = "❌ TERBANG (MATI)"
TombolTerbang.TextColor3 = Color3.new(1,1,1)

-- ✅ KOLOM ISI ANGKA KECEPATAN TERBANG (BEBAS DIUBAH)
local InputKecepatanTerbang = Instance.new("TextBox")
InputKecepatanTerbang.Parent = DaftarFitur
InputKecepatanTerbang.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
InputKecepatanTerbang.BorderSizePixel = 0
InputKecepatanTerbang.Position = UDim2.new(0, 0, 0, 55)
InputKecepatanTerbang.Size = UDim2.new(1, 0, 0, 35)
InputKecepatanTerbang.Text = "KECEPATAN TERBANG: "..Pengaturan.KecepatanTerbang -- CONTOH: 50, 100, 200
InputKecepatanTerbang.TextColor3 = Color3.new(1,1,1)
InputKecepatanTerbang.Font = Enum.Font.Gotham
InputKecepatanTerbang.ClearTextOnFocus = true -- KETIKA DIKLIK, LANGSUNG BISA KETIK ANGKA BARU

-- FUNGSI SAAT SELESAI MENGETIK ANGKA
InputKecepatanTerbang.FocusLost:Connect(function()
    local Angka = tonumber(InputKecepatanTerbang.Text)
    if Angka then
        -- BISA DIISI BERAPA SAJA, MINIMAL 10 MAKSIMAL 1000 BIAR TIDAK HANCUR
        Pengaturan.KecepatanTerbang = math.clamp(Angka, 10, 1000)
    end
    -- TAMPILKAN KEMBALI ANGKA YANG SUDAH DIATUR
    InputKecepatanTerbang.Text = "KECEPATAN TERBANG: "..Pengaturan.KecepatanTerbang
end)

-- SISTEM TERBANG YANG MENGIKUTI ANGKA YANG DIATUR
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
                local Tubuh = Karakter.HumanoidRootPart
                Karakter.Humanoid.PlatformStand = true -- AGAR TIDAK JATUH
                
                -- ARAH GERAK
                local Arah = Vector3.new()
                if UIS:IsKeyDown(Enum.KeyCode.W) then Arah += workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then Arah -= workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then Arah -= workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then Arah += workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then Arah += Vector3.new(0,1,0) end -- NAIK
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then Arah += Vector3.new(0,-1,0) end -- TURUN
                
                -- ✨ KECEPATANNYA MENGIKUTI ANGKA YANG KETIK LU TULIS!
                Arah = Arah.Unit * Pengaturan.KecepatanTerbang
                Tubuh.Velocity = Arah
            end
        end)
    else
        TombolTerbang.Text = "❌ TERBANG (MATI)"
        if SambunganTerbang then SambunganTerbang:Disconnect() end
        -- KEMBALI KE JALAN BIASA
        local Karakter = game.Players.LocalPlayer.Character
        if Karakter and Karakter:FindFirstChild("Humanoid) then
            Karakter.Humanoid.PlatformStand = false
        end
    end
end)

-- ==============================================
-- ⚡ FITUR KECEPATAN LARI + KOLOM ISI ANGKA ⚡
-- ==============================================
local TombolKecepatan = Instance.new("TextButton")
TombolKecepatan.Parent = DaftarFitur
TombolKecepatan.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
TombolKecepatan.BorderSizePixel = 0
TombolKecepatan.Position = UDim2.new(0, 0, 0, 100)
TombolKecepatan.Size = UDim2.new(1, 0, 0, 40)
TombolKecepatan.Text = "❌ KEPATAN LARI (MATI)"
TombolKecepatan.TextColor3 = Color3.new(1,1,1)

-- ✅ KOLOM ISI ANGKA KECEPATAN LARI (BEBAS DIUBAH)
local InputKecepatanJalan = Instance.new("TextBox")
InputKecepatanJalan.Parent = DaftarFitur
InputKecepatanJalan.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
InputKecepatanJalan.BorderSizePixel = 0
InputKecepatanJalan.Position = UDim2.new(0, 0, 0, 145)
InputKecepatanJalan.Size = UDim2.new(1, 0, 0, 35)
InputKecepatanJalan.Text = "KECEPATAN LARI: "..Pengaturan.KecepatanJalan -- CONTOH: 30, 50, 100
InputKecepatanJalan.TextColor3 = Color3.new(1,1,1)
InputKecepatanJalan.Font = Enum.Font.Gotham
InputKecepatanJalan.ClearTextOnFocus = true

InputKecepatanJalan.FocusLost:Connect(function()
    local Angka = tonumber(InputKecepatanJalan.Text)
    if Angka then
        -- BISA DIISI BERAPA SAJA, MINIMAL 10 MAKSIMAL 500
        Pengaturan.KecepatanJalan = math.clamp(Angka, 10, 500)
    end
    InputKecepatanJalan.Text = "KECEPATAN LARI: "..Pengaturan.KecepatanJalan
    -- JIKA KECEPATAN SEDANG NYALA, LANGSUNG BERUBAH SAAT ITU JUGA
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
        TombolKecepatan.Text = "✅ KECEPATAN LARI (NYALA)"
        -- ✨ KECEPATANNYA MENGIKUTI ANGKA YANG LU TULIS!
        Karakter.Humanoid.WalkSpeed = Pengaturan.KecepatanJalan
    else
        TombolKecepatan.Text = "❌ KECEPATAN LARI (MATI)"
        Karakter.Humanoid.WalkSpeed = 16 -- KEMBALI KE KECEPATAN ASLI PERMAINAN
    end
end)

-- ==============================================
-- 👁️ FITUR ESP 👁️
-- ==============================================
local TombolESP = Instance.new("TextButton")
TombolESP.Parent = DaftarFitur
TombolESP.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
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
        TombolESP.Text = "❌ ESP (MATI)"
        if SambunganESP then SambunganESP:Disconnect() end
        for _,v in pairs(workspace:GetDescendants()) do if v.Name == "ESP_BLOOD_BEC" then v:Destroy() end end
    end
end)

-- ==============================================
-- 🎯 FITUR AIMBOT 🎯
-- ==============================================
local TombolAimbot = Instance.new("TextButton")
TombolAimbot.Parent = DaftarFitur
TombolAimbot.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
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
TombolGantiWarna.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
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

print("[AURORA LITE] : SIAP! KECEPATAN BISA DIATUR SENDIRI SESUAI KEMAUAN TUAN SKY! 🚀✅")
    
