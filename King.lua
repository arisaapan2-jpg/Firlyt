local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local KeyBox = Instance.new("TextBox")
local GetKeyBtn = Instance.new("TextButton")
local CheckBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Parent ke CoreGui biar aman
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "KingF_System"

-- Kotak Utama
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Position = UDim2.new(0.5, -135, 0.5, -80)
Main.Size = UDim2.new(0, 270, 0, 160)
Main.Active = true
Main.Draggable = true -- Bisa digeser di Infinix kamu

UICorner.CornerRadius = UDim2.new(0, 12)
UICorner.Parent = Main

-- Judul
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Text = "KING F PROJECT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold

-- Kotak Buat Ngetik Key (Redeem)
KeyBox.Parent = Main
KeyBox.Name = "RedeemBox"
KeyBox.PlaceholderText = "Ketik Key di Sini..."
KeyBox.Size = UDim2.new(0, 230, 0, 35)
KeyBox.Position = UDim2.new(0, 20, 0, 55)
KeyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Text = ""

-- Tombol Get Key (Kiri)
GetKeyBtn.Parent = Main
GetKeyBtn.Text = "Get Key"
GetKeyBtn.Size = UDim2.new(0, 110, 0, 35)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 105)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://link-hub.net/5342274/e2C9v7I3sTUt")
    print("Link Copied!")
end)

-- Tombol Check Key / Redeem (Kanan)
CheckBtn.Parent = Main
CheckBtn.Text = "Redeem"
CheckBtn.Size = UDim2.new(0, 110, 0, 35)
CheckBtn.Position = UDim2.new(0, 140, 0, 105)
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Fungsi pas tombol Redeem ditekan
CheckBtn.MouseButton1Click:Connect(function()
    local linkRaw = "https://raw.githubusercontent.com/arisaapan2-jpg/Firlyt/refs/heads/main/Keyc.txt"
    local Success, realKey = pcall(function() return game:HttpGet(linkRaw) end)
    
    if Success and KeyBox.Text == realKey:gsub("%s+", "") then
        Main.Visible = false -- Sembunyikan menu key
        
        -- MUNCULIN NOTIFIKASI KEREN
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "KINGSIBUYZ12 ON",
            Text = "Script Ready to Use!",
            Duration = 5
        })

        -- BIKIN TOMBOL FLY / ON-OFF MELAYANG
        local FlyBtn = Instance.new("TextButton")
        local FlyCorner = Instance.new("UICorner")
        
        FlyBtn.Parent = ScreenGui
        FlyBtn.Name = "ToggleBtn"
        FlyBtn.Size = UDim2.new(0, 60, 0, 60)
        FlyBtn.Position = UDim2.new(0, 10, 0.5, 0) -- Di samping layar
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        FlyBtn.Text = "ON"
        FlyBtn.Draggable = true -- Bisa digerakin player sesuka hati
        
        FlyCorner.CornerRadius = UDim2.new(1, 0) -- Biar bentuknya bulat
        FlyCorner.Parent = FlyBtn

        print("Key Benar! Tombol ON muncul.")
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "KEY SALAH/EXPIRED!"
    end
end)
