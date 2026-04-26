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
        --        -- [[ TAMPILAN PREMIUM KING F - THUNDERZ STYLE ]] --
        local KingF_Gui = Instance.new("ScreenGui")
        local MainFrame = Instance.new("Frame")
        local Sidebar = Instance.new("Frame")
        local Container = Instance.new("Frame")
        local UIStroke = Instance.new("UIStroke")
        local UICorner = Instance.new("UICorner")

        KingF_Gui.Parent = game.CoreGui
        KingF_Gui.Name = "KingF_ThunderZ"

        -- Frame Utama (Background Transparan Gelap)
        MainFrame.Name = "MainFrame"
        MainFrame.Parent = KingF_Gui
        MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        MainFrame.BackgroundTransparency = 0.1
        MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
        MainFrame.Size = UDim2.new(0, 400, 0, 250)
        MainFrame.Active = true
        MainFrame.Draggable = true -- Bisa digeser manual di HP

        UICorner.CornerRadius = UDim2.new(0, 10)
        UICorner.Parent = MainFrame

        UIStroke.Thickness = 2
        UIStroke.Color = Color3.fromRGB(40, 40, 45)
        UIStroke.Parent = MainFrame

        -- Sidebar (Menu Samping)
        Sidebar.Name = "Sidebar"
        Sidebar.Parent = MainFrame
        Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Sidebar.Size = UDim2.new(0, 100, 1, 0)
        
        local SidebarCorner = Instance.new("UICorner", Sidebar)
        SidebarCorner.CornerRadius = UDim2.new(0, 10)

        -- Judul di Sidebar
        local Logo = Instance.new("TextLabel")
        Logo.Parent = Sidebar
        Logo.Size = UDim2.new(1, 0, 0, 40)
        Logo.Text = "KING F"
        Logo.TextColor3 = Color3.fromRGB(255, 215, 0) -- Warna Emas
        Logo.Font = Enum.Font.GothamBold
        Logo.TextSize = 16
        Logo.BackgroundTransparency = 1

        -- Area Isi Fitur (Container)
        Container.Name = "Container"
        Container.Parent = MainFrame
        Container.Position = UDim2.new(0, 110, 0, 10)
        Container.Size = UDim2.new(1, -120, 1, -20)
        Container.BackgroundTransparency = 1

        -- Fungsi bikin tombol di Sidebar biar Rapi
        local function AddTab(name, pos)
            local btn = Instance.new("TextButton")
            btn.Parent = Sidebar
            btn.Size = UDim2.new(1, -10, 0, 30)
            btn.Position = UDim2.new(0, 5, 0, pos)
            btn.Text = name
            btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            btn.TextColor3 = Color3.new(1, 1, 1)
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 12
            Instance.new("UICorner", btn).CornerRadius = UDim2.new(0, 5)
            return btn
        end

        local MainTab = AddTab("Main", 50)
        local EggTab = AddTab("Egg View", 85)
        local MiscTab = AddTab("Misc", 120)

        -- [[ CONTOH ISI FITUR (FLY) ]] --
        local FlyBtn = Instance.new("TextButton")
        FlyBtn.Parent = Container
        FlyBtn.Size = UDim2.new(1, 0, 0, 35)
        FlyBtn.Text = "Fly: OFF"
        FlyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        FlyBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", FlyBtn)
        
        -- (Logika Fly manual kamu tinggal ditaruh di sini)

    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "KEY SALAH!"
        print("Login Gagal: Key tidak cocok.")
    end
end)

print("KING F SCRIPT LOADED!")
