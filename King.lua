-- [[ KING F PROJECT - AI COMMAND SYSTEM ]] --

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- [[ 1. UI LOGIN (SISTEM KEY LANGSUNG) ]] --
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 280, 0, 160)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -80)
LoginFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoginFrame.Parent = ScreenGui
Instance.new("UICorner", LoginFrame)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "KING F PROJECT"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = LoginFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0, 240, 0, 35)
KeyBox.Position = UDim2.new(0, 20, 0, 50)
KeyBox.PlaceholderText = "Klik Get Key buat liat PW..."
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBox.TextColor3 = Color3.new(1, 1, 1)
KeyBox.Parent = LoginFrame
Instance.new("UICorner", KeyBox)

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0, 110, 0, 35)
GetKeyBtn.Position = UDim2.new(0, 20, 0, 100)
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
GetKeyBtn.TextColor3 = Color3.new(1, 1, 1)
GetKeyBtn.Parent = LoginFrame
Instance.new("UICorner", GetKeyBtn)

local RedeemBtn = Instance.new("TextButton")
RedeemBtn.Size = UDim2.new(0, 110, 0, 35)
RedeemBtn.Position = UDim2.new(0, 140, 0, 100)
RedeemBtn.Text = "REDEEM"
RedeemBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
RedeemBtn.TextColor3 = Color3.new(1, 1, 1)
RedeemBtn.Parent = LoginFrame
Instance.new("UICorner", RedeemBtn)

-- [[ LOGIKA LOGIN ]] --
GetKeyBtn.MouseButton1Click:Connect(function()
    -- Password langsung muncul di kotak sesuai permintaanmu
    KeyBox.Text = "102i3u39103u"
    Title.Text = "PW COPIED!"
    task.wait(1)
    Title.Text = "KING F PROJECT"
end)

-- [[ 2. UI UTAMA & AI ASSISTANT (MUNCUL SETELAH REDEEM) ]] --
local function LoadMainHub()
    LoginFrame:Destroy()
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 350, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.Parent = ScreenGui
    MainFrame.Active = true
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame)

    -- Kotak Chat AI di Atas Kotak Utama
    local AiBox = Instance.new("Frame")
    AiBox.Size = UDim2.new(1, 0, 0, 80)
    AiBox.Position = UDim2.new(0, 0, 0, -90)
    AiBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    AiBox.Parent = MainFrame
    local Stroke = Instance.new("UIStroke", AiBox)
    Stroke.Color = Color3.fromRGB(255, 215, 0)
    Instance.new("UICorner", AiBox)

    local AiText = Instance.new("TextLabel")
    AiText.Size = UDim2.new(1, -10, 0, 40)
    AiText.Position = UDim2.new(0, 5, 0, 5)
    AiText.Text = "Halo Bosku! Ketik 'cmd' buat liat list perintah."
    AiText.TextColor3 = Color3.new(1, 1, 1)
    AiText.BackgroundTransparency = 1
    AiText.TextWrapped = true
    AiText.Parent = AiBox

    local AiInput = Instance.new("TextBox")
    AiInput.Size = UDim2.new(0.9, 0, 0, 25)
    AiInput.Position = UDim2.new(0.05, 0, 0, 45)
    AiInput.PlaceholderText = "Ketik perintah di sini..."
    AiInput.Parent = AiBox
    Instance.new("UICorner", AiInput)

    -- [[ SISTEM COMMAND AI ]] --
    local flying = false
    AiInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local msg = string.lower(AiInput.Text)
            AiInput.Text = ""

            if msg == "cmd" then
                AiText.Text = "LIST: 'fly' (terbang), 'speed' (lari), 'reset' (normal)"
                AiText.TextColor3 = Color3.fromRGB(255, 215, 0)
            
            elseif msg == "fly" then
                if not flying then
                    flying = true
                    AiText.Text = "Siap Bosku! Mode Fly saya HIDUPKAN. 🕊️"
                    -- Tambahkan script fly kamu di sini
                else
                    flying = false
                    AiText.Text = "Oke, mode Fly sudah saya MATIKAN. 🛑"
                end

            elseif msg == "speed" then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
                AiText.Text = "Gacor! Speed lari sudah 100. 🔥"

            elseif msg == "reset" then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                AiText.Text = "Semua kembali normal, Bosku."

            else
                AiText.Text = "Aduh, '"..msg.."' belum ada. Ketik 'cmd' ya!"
                AiText.TextColor3 = Color3.new(1, 0, 0)
                task.wait(2)
                AiText.TextColor3 = Color3.new(1, 1, 1)
            end
        end
    end)
end

RedeemBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "102i3u39103u" then
        LoadMainHub()
    else
        Title.Text = "PW SALAH!"
        task.wait(1)
        Title.Text = "KING F PROJECT"
    end
end)
