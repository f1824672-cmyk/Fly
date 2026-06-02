-- ⚡ BLOOD BEC SYSTEM | DIPERBAIKI TOTAL SESUAI PERMINTAAN 👑
-- 🩸 BENTUK SEPERTI DELTA | FITUR LENGKAP TANPA CACAT 🩸

-- PENGATURAN UTAMA
local Pengaturan = {
    PosisiX = 50,
    PosisiY = 50,
    WarnaSaatIni = "Merah",
    GeserMenu = true,
    MenuTersembunyi = true, -- AWALNYA KECIL
    KecepatanTerbang = 50, -- NILAI AWAL
    KecepatanJalan = 30, -- NILAI AWAL
    FiturTerbangAktif = false,
    FiturKecepatanAktif = false,
    FiturLompatTakHabis = false,
    FiturESPNamaAktif = false
}

-- DAFTAR WARNA YANG BISA DIPILIH
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
MenuUtama.Name = "BLOOD_BEC_FIXED"
MenuUtama.Parent = game.CoreGui
MenuUtama.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ==============================================
-- 📦 TAMPILAN KECIL (SEPERTI DELTA: KOTAK BEC) 📦
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
BingkaiKecil.BackgroundTransparency = 0.05
-- BIKIN SUDUT LENGKUNG
local SudutKecil = Instance.new("UICorner")
SudutKecil.CornerRadius = UDim.new(0.2, 0)
SudutKecil.Parent = BingkaiKecil

-- TULISAN DI KOTAK KECIL
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
-- 📂 TAMPILAN BESAR (MENU LENGKAP) 📂
-- ==============================================
local BingkaiBesar = Instance.new("Frame")
BingkaiBesar.Name = "BingkaiBesar"
BingkaiBesar.Parent = MenuUtama
BingkaiBesar.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12) -- LATAR GELAP ELEGAN
BingkaiBesar.BorderSizePixel = 0
BingkaiBesar.Position = UDim2.new(0, Pengaturan.PosisiX, 0, Pengaturan.PosisiY)
BingkaiBesar.Size = UDim2.new(0, 300, 0, 400) -- UKURAN PAS DAN RAPI
BingkaiBesar.Visible = false -- DISEMBUNYIKAN SAMPAI DIKLIK
BingkaiBesar.Active = true
BingkaiBesar.Draggable = Pengaturan.GeserMenu
BingkaiBesar.BackgroundTransparency = 0.05
-- SUDUT LENGKUNG
local SudutBesar = Instance.new("UICorner")
SudutBesar.CornerRadius = UDim.new(0.08, 0)
SudutBesar.Parent = BingkaiBesar

-- GARIS WARNA DI BAGIAN ATAS
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

-- ✅ TULISAN "BLOOD BEC" DI KIRI ATAS SEPERTI CONTOH FOTO
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

-- TOMBOL KECILKAN (TANDA - DI POJOK KANAN)
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

-- TEMPAT MENAMPUNG SEMUA TOMBOL FITUR
local WadahFitur = Instance.new("ScrollingFrame")
WadahFitur.Name = "WadahFitur"
WadahFitur.Parent = BingkaiBesar
WadahFitur.BackgroundTransparency = 1
WadahFitur.Position = UDim2.new(0, 15, 0, 45)
WadahFitur.Size = UDim2.new(1, -30, 1, -50)
WadahFitur.ScrollBarThickness = 3
WadahFitur.ScrollBarImageColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
WadahFitur.CanvasSize = UDim2.new(0, 0, 0, 320)

-- ==============================================
-- 🔄 FUNGSI UTAMA: MEMBUKA & MENUTUP MENU 🔄
-- ==============================================
-- ✅ BAGIAN INI YANG DIPERBAIKI AGAR MAU BERUBAH SAAT DIKLIK
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

-- HUBUNGKAN KLIK DENGAN FUNGSI DI ATAS
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
-- ⚡ FITUR KECEPATAN LARI (BISA DI ISI ANGKA) ⚡
-- ==============================================
local TombolLari = Instance.new("TextButton")
TombolLari.Name = "TombolLari"
TombolLari.Parent = WadahFitur
TombolLari.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolLari.BorderSizePixel = 0
TombolLari.Position = UDim2.new(0, 5, 0, 10)
TombolLari.Size = UDim2.new(1, -10, 0, 38)
TombolLari.Text = "❌ Kecepatan Lari"
TombolLari.TextColor3 = Color3.new(1,1,1)
TombolLari.Font = Enum.Font.Gotham
TombolLari.TextXAlignment = Enum.TextXAlignment.Left
TombolLari.TextScaled = true
local SudutTombol1 = Instance.new("UICorner")
SudutTombol1.CornerRadius = UDim.new(0.15, 0)
SudutTombol1.Parent = TombolLari

-- KOLOM TEMPAT ISI ANGKA KECEPATAN
local InputLari = Instance.new("TextBox")
InputLari.Name = "InputLari"
InputLari.Parent = WadahFitur
InputLari.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
InputLari.BorderSizePixel = 0
InputLari.Position = UDim2.new(0, 5, 0, 55)
InputLari.Size = UDim2.new(1, -10, 0, 32)
InputLari.Text = "Isi Angka: "..Pengaturan.KecepatanJalan -- CONTOH: 50
InputLari.TextColor3 = Color3.new(0.9,0.9,0.9)
InputLari.Font = Enum.Font.Gotham
InputLari.ClearTextOnFocus = true
InputLari.TextScaled = true
local SudutInput1 = Instance.new("UICorner")
SudutInput1.CornerRadius = UDim.new(0.15, 0)
SudutInput1.Parent = InputLari

-- PROSES SAAT ANGKA DIUBAH
InputLari.FocusLost:Connect(function()
    local Angka = tonumber(InputLari.Text)
    if Angka then
        Pengaturan.KecepatanJalan = math.clamp(Angka, 10, 500) -- MIN 10, MAKS 500
    end
    InputLari.Text = "Isi Angka: "..Pengaturan.KecepatanJalan
    -- JIKA SEDANG NYALA, LANGSUNG BERUBAH KECEPATANNYA
    if Pengaturan.FiturKecepatanAktif then
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Pengaturan.KecepatanJalan
        end
    end
end)

-- MENYALAKAN/MEMATIKAN FITUR
TombolLari.MouseButton1Click:Connect(function()
    Pengaturan.FiturKecepatanAktif = not Pengaturan.FiturKecepatanAktif
    local Karakter = game.Players.LocalPlayer.Character
    if not Karakter or not Karakter:FindFirstChild("Humanoid") then return end
    
    if Pengaturan.FiturKecepatanAktif then
        TombolLari.Text = "✅ Kecepatan Lari Aktif"
        TombolLari.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
        Karakter.Humanoid.WalkSpeed = Pengaturan.KecepatanJalan
    else
        TombolLari.Text = "❌ Kecepatan Lari"
        TombolLari.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        Karakter.Humanoid.WalkSpeed = 16 -- KEMBALI KE KECEPATAN BIASA
    end
end)

-- ==============================================
-- 🚀 FITUR TERBANG (BISA DI ISI ANGKA) 🚀
-- ==============================================
local TombolTerbang = Instance.new("TextButton")
TombolTerbang.Name = "TombolTerbang"
TombolTerbang.Parent = WadahFitur
TombolTerbang.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolTerbang.BorderSizePixel = 0
TombolTerbang.Position = UDim2.new(0, 5, 0, 100)
TombolTerbang.Size = UDim2.new(1, -10, 0, 38)
TombolTerbang.Text = "❌ Terbang"
TombolTerbang.TextColor3 = Color3.new(1,1,1)
TombolTerbang.Font = Enum.Font.Gotham
TombolTerbang.TextXAlignment = Enum.TextXAlignment.Left
TombolTerbang.TextScaled = true
local SudutTombol2 = Instance.new("UICorner")
SudutTombol2.CornerRadius = UDim.new(0.15, 0)
SudutTombol2.Parent = TombolTerbang

-- KOLOM TEMPAT ISI ANGKA KECEPATAN TERBANG
local InputTerbang = Instance.new("TextBox")
InputTerbang.Name = "InputTerbang"
InputTerbang.Parent = WadahFitur
InputTerbang.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
InputTerbang.BorderSizePixel = 0
InputTerbang.Position = UDim2.new(0, 5, 0, 145)
InputTerbang.Size = UDim2.new(1, -10, 0, 32)
InputTerbang.Text = "Isi Angka: "..Pengaturan.KecepatanTerbang -- CONTOH: 100, 200
InputTerbang.TextColor3 = Color3.new(0.9,0.9,0.9)
InputTerbang.Font = Enum.Font.Gotham
InputTerbang.ClearTextOnFocus = true
InputTerbang.TextScaled = true
local SudutInput2 = Instance.new("UICorner")
SudutInput2.CornerRadius = UDim.new(0.15, 0)
SudutInput2.Parent = InputTerbang

InputTerbang.FocusLost:Connect(function()
    local Angka = tonumber(InputTerbang.Text)
    if Angka then
        Pengaturan.KecepatanTerbang = math.clamp(Angka, 10, 1000) -- MIN 10, MAKS 1000
    end
    InputTerbang.Text = "Isi Angka: "..Pengaturan.KecepatanTerbang
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
                Pemain.Character.Humanoid.PlatformStand = true -- AGAR TIDAK JATUH
                local Arah = Vector3.new()
                -- KENDALI TOMBOL
                if UIS:IsKeyDown(Enum.KeyCode.W) then Arah += workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then Arah -= workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then Arah -= workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then Arah += workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then Arah += Vector3.new(0,1,0) end -- NAIK
                if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then Arah += Vector3.new(0,-1,0) end -- TURUN
                -- TERBANG SESUAI ANGKA YANG DIISI
                Arah = Arah.Unit * Pengaturan.KecepatanTerbang
                Tubuh.Velocity = Arah
            end
        end)
    else
        TombolTerbang.Text = "❌ Terbang"
        TombolTerbang.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        if SambunganTerbang then SambunganTerbang:Disconnect() end
        -- KEMBALI KE JALAN BIASA
        if Pemain.Character and Pemain.Character:FindFirstChild("Humanoid") then
            Pemain.Character.Humanoid.PlatformStand = false
        end
    end
end)

-- ==============================================
-- ⬆️ FITUR LOMBAT TANPA BATAS (INFINITE JUMP) ⬆️
-- ==============================================
local TombolLompat = Instance.new("TextButton")
TombolLompat.Name = "TombolLompat"
TombolLompat.Parent = WadahFitur
TombolLompat.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolLompat.BorderSizePixel = 0
TombolLompat.Position = UDim2.new(0, 5, 0, 190)
TombolLompat.Size = UDim2.new(1, -10, 0, 38)
TombolLompat.Text = "❌ Lompat Tanpa Batas"
TombolLompat.TextColor3 = Color3.new(1,1,1)
TombolLompat.Font = Enum.Font.Gotham
TombolLompat.TextXAlignment = Enum.TextXAlignment.Left
TombolLompat.TextScaled = true
local SudutTombol3 = Instance.new("UICorner")
SudutTombol3.CornerRadius = UDim.new(0.15, 0)
SudutTombol3.Parent = TombolLompat

local SambunganLompat
TombolLompat.MouseButton1Click:Connect(function()
    Pengaturan.FiturLompatTakHabis = not Pengaturan.FiturLompatTakHabis
    local UIS = game:GetService("UserInputService")
    if Pengaturan.FiturLompatTakHabis then
        TombolLompat.Text = "✅ Lompat Tak Habis Aktif"
        TombolLompat.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
        SambunganLompat = UIS.JumpRequest:Connect(function()
            local Karakter = game.Players.LocalPlayer.Character
            if Karakter and Karakter:FindFirstChild("Humanoid") then
                Karakter.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    else
        TombolLompat.Text = "❌ Lompat Tanpa Batas"
        TombolLompat.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        if SambunganLompat then SambunganLompat:Disconnect() end
    end
end)

-- ==============================================
-- 👁️ FITUR ESP TAMPILKAN NAMA PEMAIN 👁️
-- ==============================================
local TombolESP = Instance.new("TextButton")
TombolESP.Name = "TombolESP"
TombolESP.Parent = WadahFitur
TombolESP.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TombolESP.BorderSizePixel = 0
TombolESP.Position = UDim2.new(0, 5, 0, 240)
TombolESP.Size = UDim2.new(1, -10, 0, 38)
TombolESP.Text = "❌ ESP Tampilkan Nama"
TombolESP.TextColor3 = Color3.new(1,1,1)
TombolESP.Font = Enum.Font.Gotham
TombolESP.TextXAlignment = Enum.TextXAlignment.Left
TombolESP.TextScaled = true
local SudutTombol4 = Instance.new("UICorner")
SudutTombol4.CornerRadius = UDim.new(0.15, 0)
SudutTombol4.Parent = TombolESP

local SambunganESP
TombolESP.MouseButton1Click:Connect(function()
    Pengaturan.FiturESPNamaAktif = not Pengaturan.FiturESPNamaAktif
    if Pengaturan.FiturESPNamaAktif then
        TombolESP.Text = "✅ ESP Nama Aktif"
        TombolESP.BackgroundColor3 = DaftarWarna[Pengaturan.WarnaSaatIni]
        -- HAPUS YANG LAMA JIKA ADA
        for _,obj in pairs(workspace:GetDescendants()) do
            if obj.Name == "ESP_NAMA_BLOOD_BEC" then obj:Destroy() end
        end
        -- BUAT YANG BARU SETIAP SAAT
        SambunganESP = game:GetService("RunService").RenderStepped:Connect(function()
            for _,Pemain in pairs(game.Players:GetPlayers()) do
                if Pemain ~= game.Players.LocalPlayer and Pemain.Character and Pemain.Character:FindFirstChild("Head") then
                    local Kepala = Pemain.Character.Head
                    if not Kepala:FindFirstChild("ESP_NAMA_BLOOD_BEC") then
                        -- BUAT TULISAN NAMA DI ATAS KEPALA
                        local TampilanNama = Instance.new("BillboardGui")
                        TampilanNama.Name = "ESP_NAMA_BLOOD_BEC"
                        TampilanNama.Adornee = Kepala
                        TampilanNama.Size = UDim2.new(4, 0, 2, 0)
                        TampilanNama.AlwaysOnTop = true
                        
                        local TeksNama = Instance.new("TextLabel")
                        TeksNama.Parent = TampilanNama
                        TeksNama.BackgroundTransparency = 1
                        TeksNama.Size = UDim2.new(1, 0, 1, 0)
                        TeksNama.Text = Pemain.Name -- TAMPILKAN NAMA ASLI PEMAIN
                        TeksNama.TextColor3 = DaftarWarna[Pengaturan.WarnaSaatIni] -- WARNA SESUAI MENU
                        TeksNama.Font = Enum.Font.GothamBold
                        TeksNama.TextScaled = true
                    end
                end
            end
        end)
    else
        TombolESP.Text = "❌ ESP Tampilkan Nama"
        TombolESP.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        if SambunganESP then SambunganESP:Disconnect() end
        -- HAPUS SEMUA TULISAN SAAT DIMATIKAN
        for _,obj in pairs(workspace:GetDescendants()) do
            if obj.Name == "ESP_NAMA_BLOOD_BEC" then obj:Destroy() end
        end
    end
end)

-- ==============================================
-- 🎨 TOMBOL GANTI WARNA TAMPILAN 🎨
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

-- SELESAI DAN BERHASIL
print("[✅] BLOOD BEC BERHASIL DIMUAT! KLIK KOTAK BEC UNTUK MEMBUKA!")
