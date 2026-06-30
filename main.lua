local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Remove previous interface
local PreviousIntro = PlayerGui:FindFirstChild("HadoHubIntro")
if PreviousIntro then
    PreviousIntro:Destroy()
end

-- Intro
local Intro = Instance.new("ScreenGui")
Intro.Name = "HadoHubIntro"
Intro.IgnoreGuiInset = true
Intro.ResetOnSpawn = false
Intro.DisplayOrder = 999
Intro.Parent = PlayerGui

local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(7, 2, 15)
Background.BorderSizePixel = 0
Background.Parent = Intro

local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 2, 15)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(61, 12, 105)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 3, 35))
})
BackgroundGradient.Rotation = 35
BackgroundGradient.Parent = Background

local LogoFrame = Instance.new("Frame")
LogoFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LogoFrame.Position = UDim2.fromScale(0.5, 0.42)
LogoFrame.Size = UDim2.fromOffset(20, 20)
LogoFrame.BackgroundColor3 = Color3.fromRGB(28, 10, 50)
LogoFrame.BorderSizePixel = 0
LogoFrame.Parent = Background

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 30)
LogoCorner.Parent = LogoFrame

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(189, 84, 255)
LogoStroke.Thickness = 3
LogoStroke.Parent = LogoFrame

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(111, 27, 208)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 8, 51))
})
LogoGradient.Rotation = 45
LogoGradient.Parent = LogoFrame

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromScale(1, 1)
Logo.BackgroundTransparency = 1
Logo.Text = "H"
Logo.TextColor3 = Color3.fromRGB(235, 190, 255)
Logo.TextTransparency = 1
Logo.Font = Enum.Font.GothamBold
Logo.TextScaled = true
Logo.Parent = LogoFrame

local LogoPadding = Instance.new("UIPadding")
LogoPadding.PaddingTop = UDim.new(0, 24)
LogoPadding.PaddingBottom = UDim.new(0, 24)
LogoPadding.PaddingLeft = UDim.new(0, 24)
LogoPadding.PaddingRight = UDim.new(0, 24)
LogoPadding.Parent = Logo

local Title = Instance.new("TextLabel")
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.Position = UDim2.fromScale(0.5, 0.59)
Title.Size = UDim2.fromOffset(450, 50)
Title.BackgroundTransparency = 1
Title.Text = "HADO HUB"
Title.TextColor3 = Color3.fromRGB(250, 243, 255)
Title.TextTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 32
Title.Parent = Background

local Subtitle = Instance.new("TextLabel")
Subtitle.AnchorPoint = Vector2.new(0.5, 0.5)
Subtitle.Position = UDim2.fromScale(0.5, 0.64)
Subtitle.Size = UDim2.fromOffset(450, 30)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "PREMIUM EXPERIENCE  •  V1.0"
Subtitle.TextColor3 = Color3.fromRGB(195, 130, 238)
Subtitle.TextTransparency = 1
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 12
Subtitle.Parent = Background

local Bar = Instance.new("Frame")
Bar.AnchorPoint = Vector2.new(0.5, 0.5)
Bar.Position = UDim2.fromScale(0.5, 0.7)
Bar.Size = UDim2.fromOffset(240, 4)
Bar.BackgroundColor3 = Color3.fromRGB(52, 29, 68)
Bar.BorderSizePixel = 0
Bar.Parent = Background

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = Bar

local Fill = Instance.new("Frame")
Fill.Size = UDim2.fromScale(0, 1)
Fill.BackgroundColor3 = Color3.fromRGB(178, 67, 255)
Fill.BorderSizePixel = 0
Fill.Parent = Bar

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = Fill

TweenService:Create(
    LogoFrame,
    TweenInfo.new(0.7, Enum.EasingStyle.Back),
    {Size = UDim2.fromOffset(140, 140)}
):Play()

TweenService:Create(
    Logo,
    TweenInfo.new(0.6),
    {TextTransparency = 0}
):Play()

task.wait(0.35)

TweenService:Create(Title, TweenInfo.new(0.4), {
    TextTransparency = 0
}):Play()

TweenService:Create(Subtitle, TweenInfo.new(0.4), {
    TextTransparency = 0
}):Play()

TweenService:Create(
    Fill,
    TweenInfo.new(1.5, Enum.EasingStyle.Quint),
    {Size = UDim2.fromScale(1, 1)}
):Play()

task.wait(1.8)

TweenService:Create(Background, TweenInfo.new(0.4), {
    BackgroundTransparency = 1
}):Play()

TweenService:Create(LogoFrame, TweenInfo.new(0.35), {
    BackgroundTransparency = 1
}):Play()

TweenService:Create(Logo, TweenInfo.new(0.3), {
    TextTransparency = 1
}):Play()

TweenService:Create(Title, TweenInfo.new(0.3), {
    TextTransparency = 1
}):Play()

TweenService:Create(Subtitle, TweenInfo.new(0.3), {
    TextTransparency = 1
}):Play()

task.wait(0.45)
Intro:Destroy()

-- Load Fluent after the intro
local HadoHub = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

local Window = HadoHub:CreateWindow({
    Title = "HADO HUB",
    SubTitle = "by Hado-k • v1.0",
    TabWidth = 155,
    Size = UDim2.fromOffset(640, 500),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Dashboard = Window:AddTab({
        Title = "Dashboard",
        Icon = "home"
    }),

    Main = Window:AddTab({
        Title = "Main Features",
        Icon = "zap"
    }),

    Player = Window:AddTab({
        Title = "Player",
        Icon = "user"
    }),

    Visuals = Window:AddTab({
        Title = "Visuals",
        Icon = "eye"
    }),

    Settings = Window:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}

Tabs.Dashboard:AddParagraph({
    Title = "Welcome to HadoHub",
    Content = "Professional purple experience by Hado-k.\nVersion 1.0 • Online and ready."
})

Tabs.Dashboard:AddButton({
    Title = "Copy Discord invitation",
    Description = "Join the official HadoHub community.",

    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/your-invite")
        end

        HadoHub:Notify({
            Title = "HadoHub",
            Content = "Discord invitation copied.",
            Duration = 3
        })
    end
})

local Master = Tabs.Main:AddToggle("MasterEnabled", {
    Title = "Enable HadoHub",
    Description = "Master switch for the main features.",
    Default = false
})

Master:OnChanged(function(value)
    HadoHub:Notify({
        Title = "HadoHub",
        Content = value and "Features enabled." or "Features disabled.",
        Duration = 2
    })
end)

Tabs.Main:AddDropdown("Mode", {
    Title = "Operating mode",
    Description = "Select your preferred configuration.",
    Values = {"Legit", "Balanced", "Performance"},
    Multi = false,
    Default = 2
})

Tabs.Main:AddSlider("Power", {
    Title = "Power level",
    Description = "Adjust the feature intensity.",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0
})

Tabs.Player:AddSlider("WalkSpeed", {
    Title = "Walk speed",
    Description = "Adjust the character movement speed.",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0,

    Callback = function(value)
        local Character = Player.Character
        local Humanoid = Character
            and Character:FindFirstChildOfClass("Humanoid")

        if Humanoid then
            Humanoid.WalkSpeed = value
        end
    end
})

Tabs.Visuals:AddToggle("PurpleMode", {
    Title = "Purple visual mode",
    Description = "Use the signature HadoHub appearance.",
    Default = true
})

Tabs.Settings:AddKeybind("MenuKey", {
    Title = "Menu key",
    Description = "Key used to minimize HadoHub.",
    Mode = "Toggle",
    Default = "LeftControl"
})

Tabs.Settings:AddButton({
    Title = "Unload HadoHub",
    Description = "Safely close the interface.",

    Callback = function()
        HadoHub:Destroy()
    end
})

HadoHub:Notify({
    Title = "HadoHub v1.0",
    Content = "Interface loaded successfully.",
    SubContent = "Press Left Ctrl to minimize.",
    Duration = 5
})

Window:SelectTab(1)
