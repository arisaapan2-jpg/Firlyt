local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local GetKeyBtn = Instance.new("TextButton")
local RedeemBtn = Instance.new("TextButton")

-- Agar UI tetap ada meski karakter mati
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- Kotak Utama
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Size = UDim2.new(0, 270, 0, 160)
Main.Position = UDim2.new(0.5, -135, 0.5, -80)
Main.Active = true
Main.Draggable = true

-- Judul
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "KING F PROJECT"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 18

-- Kotak Input
KeyBox.Parent = Main
KeyBox.Size = UDim2.new(0, 230, 0, 35)
KeyBox.Position = UDim2.new(0, 20, 0, 55)
KeyBox.PlaceholderText = "Ketik Key di Sini..."
KeyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.Text = ""

-- Tombol Get Key
GetKeyBtn.Parent = Main
GetKeyBtn.Size = UDim2.new(0, 110, 0, 35)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 105)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
GetKeyBtn.TextColor3 = Color3.new(1,1,1)

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://link-hub.net/5342274/e2C9v7I3sTUt")
    print("Link Copied!")
end)

-- Tombol Redeem (OTAKNYA DI SINI)
RedeemBtn.Parent = Main
RedeemBtn.Size = UDim2.new(0, 110, 0, 35)
RedeemBtn.Position = UDim2.new(0, 140, 0, 105)
RedeemBtn.Text = "Redeem"
RedeemBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
RedeemBtn.TextColor3 = Color3.new(1,1,1)

RedeemBtn.MouseButton1Click:Connect(function()
    -- Mengambil data key terbaru dari GitHub kamu
    local targetURL = "https://raw.githubusercontent.com/arisaapan2-jpg/Firlyt/refs/heads/main/Keyc.txt"
    local Success, realKey = pcall(function() return game:HttpGet(targetURL) end)
    
    -- Membersihkan spasi atau enter yang nggak sengaja terbawa
    local cleanKey = realKey:gsub("%s+", "")

    if Success and KeyBox.Text == cleanKey then
        Main.Visible = false -- Tutup menunya
        
        -- MUNCULIN NOTIFIKASI SUKSES
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "KINGSIBUYZ12 ON",
            Text = "Akses Diterima! Selamat Beraksi.",
            Duration = 5
        })
        
        print("LOGIN BERHASIL!")
        --        -- 1. EFEK LOADING MAHKOTA & TEKS
        local Container = Instance.new("Frame")
        local CrownImg = Instance.new("ImageLabel")
        local TextLogo = Instance.new("TextLabel")

        Container.Size = UDim2.new(0, 300, 0, 200)
        Container.Position = UDim2.new(0.5, -150, 0.7, 0)
        Container.BackgroundTransparency = 1
        Container.Parent = ScreenGui

        CrownImg.Size = UDim2.new(0, 80, 0, 80)
        CrownImg.Position = UDim2.new(0.5, -40, 0, 0)
        CrownImg.Image = "rbxassetid://107140795" -- Ini ID Mahkotanya
        CrownImg.BackgroundTransparency = 1
        CrownImg.Parent = Container

        TextLogo.Size = UDim2.new(1, 0, 0, 50)
        TextLogo.Position = UDim2.new(0, 0, 0, 85)
        TextLogo.Text = "KING ESENSIAL_SHIBUYZ12ON" -- Nama Loadingnya
        TextLogo.TextColor3 = Color3.fromRGB(255, 215, 0)
        TextLogo.TextSize = 18
        TextLogo.Font = Enum.Font.GothamBold
        TextLogo.BackgroundTransparency = 1
        TextLogo.Parent = Container

        task.wait(4) -- Tampil 4 detik terus hilang
        Container:Destroy()

        -- 2. MENU FLY (BISA DIGERAKIN MANUAL)
        local FlyGui = Instance.new("ScreenGui")
        local FlyMain = Instance.new("Frame")
        local SpeedInput = Instance.new("TextBox")
        local ToggleFly = Instance.new("TextButton")

        FlyGui.Parent = game.CoreGui
        FlyMain.Parent = FlyGui
        FlyMain.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        FlyMain.Size = UDim2.new(0, 150, 0, 120)
        FlyMain.Position = UDim2.new(0, 20, 0.5, 0)
        FlyMain.Active = true
        FlyMain.Draggable = true -- Biar bisa digeser-geser di HP!

        -- Judul Kecil
        local Label = Instance.new("TextLabel")
        Label.Parent = FlyMain
        Label.Size = UDim2.new(1, 0, 0, 30)
        Label.Text = "FLY MENU"
        Label.TextColor3 = Color3.new(1,1,1)
        Label.BackgroundTransparency = 1

        -- Kotak Speed
        SpeedInput.Parent = FlyMain
        SpeedInput.Size = UDim2.new(0, 120, 0, 30)
        SpeedInput.Position = UDim2.new(0, 15, 0, 40)
        SpeedInput.PlaceholderText = "Speed..."
        SpeedInput.Text = "50"

        -- Tombol ON/OFF
        ToggleFly.Parent = FlyMain
        ToggleFly.Size = UDim2.new(0, 120, 0, 30)
        ToggleFly.Position = UDim2.new(0, 15, 0, 80)
        ToggleFly.Text = "FLY: OFF"
        ToggleFly.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "KEY SALAH!"
        print("Login Gagal: Key tidak cocok.")
    end
end)

print("KING F SCRIPT LOADED!")
