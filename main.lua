local HadoHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hado-k/HadoHub/main/main.lua"))()
))()

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

--// HADO INTRO

local Intro = Instance.new("ScreenGui")
Intro.Name = "HadoHubIntro"
Intro.IgnoreGuiInset = true
Intro.ResetOnSpawn = false
Intro.DisplayOrder = 999999

if gethui then
    Intro.Parent = gethui()
else
    Intro.Parent = CoreGui
end

local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(5, 2, 12)
Background.BorderSizePixel = 0
Background.Parent = Intro

local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 2, 12)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 7, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 2, 30))
})
BackgroundGradient.Rotation = 35
BackgroundGradient.Parent = Background

local Glow = Instance.new("Frame")
Glow.AnchorPoint = Vector2.new(0.5, 0.5)
Glow.Position = UDim2.fromScale(0.5, 0.5)
Glow.Size = UDim2.fromOffset(300, 300)
Glow.BackgroundColor3 = Color3.fromRGB(133, 36, 255)
Glow.BackgroundTransparency = 0.75
Glow.BorderSizePixel = 0
Glow.Parent = Background

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(1, 0)
GlowCorner.Parent = Glow

local GlowGradient = Instance.new("UIGradient")
GlowGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.3),
    NumberSequenceKeypoint.new(1, 1)
})
GlowGradient.Parent = Glow

local LogoContainer = Instance.new("Frame")
LogoContainer.AnchorPoint = Vector2.new(0.5, 0.5)
LogoContainer.Position = UDim2.fromScale(0.5, 0.46)
LogoContainer.Size = UDim2.fromOffset(150, 150)
LogoContainer.BackgroundColor3 = Color3.fromRGB(17, 8, 31)
LogoContainer.BackgroundTransparency = 1
LogoContainer.Parent = Background

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 35)
LogoCorner.Parent = LogoContainer

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(170, 75, 255)
LogoStroke.Thickness = 3
LogoStroke.Transparency = 1
LogoStroke.Parent = LogoContainer

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(78, 18, 140)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 7, 44))
})
LogoGradient.Rotation = 45
LogoGradient.Parent = LogoContainer

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromScale(1, 1)
Logo.BackgroundTransparency = 1
Logo.Text = "H"
Logo.TextColor3 = Color3.fromRGB(217, 156, 255)
Logo.TextTransparency = 1
Logo.TextScaled = true
Logo.Font = Enum.Font.GothamBlack
Logo.Parent = LogoContainer

local LogoPadding = Instance.new("UIPadding")
LogoPadding.PaddingTop = UDim.new(0, 20)
LogoPadding.PaddingBottom = UDim.new(0, 20)
LogoPadding.PaddingLeft = UDim.new(0, 20)
LogoPadding.PaddingRight = UDim.new(0, 20)
LogoPadding.Parent = Logo

local Title = Instance.new("TextLabel")
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.Position = UDim2.new(0.5, 0, 0.46, 100)
Title.Size = UDim2.fromOffset(400, 55)
Title.BackgroundTransparency = 1
Title.Text = "HADO HUB"
Title.TextColor3 = Color3.fromRGB(245, 235, 255)
Title.TextTransparency = 1
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 31
Title.Parent = Background

local Subtitle = Instance.new("TextLabel")
Subtitle.AnchorPoint = Vector2.new(0.5, 0)
Subtitle.Position = UDim2.new(0.5, 0, 0.46, 150)
Subtitle.Size = UDim2.fromOffset(400, 30)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "POWER • PRECISION • STYLE"
Subtitle.TextColor3 = Color3.fromRGB(172, 121, 214)
Subtitle.TextTransparency = 1
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 12
Subtitle.Parent = Background

local LoadingBar = Instance.new("Frame")
LoadingBar.AnchorPoint = Vector2.new(0.5, 0)
LoadingBar.Position = UDim2.new(0.5, 0, 0.46, 205)
LoadingBar.Size = UDim2.fromOffset(240, 4)
LoadingBar.BackgroundColor3 = Color3.fromRGB(38, 22, 52)
LoadingBar.BackgroundTransparency = 1
LoadingBar.BorderSizePixel = 0
LoadingBar.Parent = Background

local LoadingCorner = Instance.new("UICorner")
LoadingCorner.CornerRadius = UDim.new(1, 0)
LoadingCorner.Parent = LoadingBar

local LoadingFill = Instance.new("Frame")
LoadingFill.Size = UDim2.fromScale(0, 1)
LoadingFill.BackgroundColor3 = Color3.fromRGB(162, 61, 255)
LoadingFill.BorderSizePixel = 0
LoadingFill.Parent = LoadingBar

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = LoadingFill

local FillGradient = Instance.new("UIGradient")
FillGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(111, 29, 230)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(221, 111, 255))
})
FillGradient.Parent = LoadingFill

TweenService:Create(
    Glow,
    TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
    {Size = UDim2.fromOffset(550, 550), BackgroundTransparency = 0.9}
):Play()

TweenService:Create(
    LogoContainer,
    TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {BackgroundTransparency = 0}
):Play()

TweenService:Create(
    LogoStroke,
    TweenInfo.new(0.5),
    {Transparency = 0.1}
):Play()

TweenService:Create(
    Logo,
    TweenInfo.new(0.55),
    {TextTransparency = 0}
):Play()

task.wait(0.25)

TweenService:Create(Title, TweenInfo.new(0.45), {
    TextTransparency = 0
}):Play()

TweenService:Create(Subtitle, TweenInfo.new(0.45), {
    TextTransparency = 0
}):Play()

TweenService:Create(LoadingBar, TweenInfo.new(0.35), {
    BackgroundTransparency = 0
}):Play()

TweenService:Create(
    LoadingFill,
    TweenInfo.new(1.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    {Size = UDim2.fromScale(1, 1)}
):Play()

task.wait(2)

TweenService:Create(Background, TweenInfo.new(0.5), {
    BackgroundTransparency = 1
}):Play()

TweenService:Create(LogoContainer, TweenInfo.new(0.4), {
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

task.wait(0.55)
Intro:Destroy()

--// MAIN WINDOW

local Window = HadoHub:CreateWindow({
    Title = "HADO HUB",
    SubTitle = "Premium Experience • v1.0",
    TabWidth = 155,
    Size = UDim2.fromOffset(640, 500),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Dashboard = Window:AddTab({
        Title = "Dashboard",
        Icon = "layout-dashboard"
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
    Content = "A polished and powerful experience designed by Hado-k.\nUse the navigation menu to explore all available features."
})

Tabs.Dashboard:AddParagraph({
    Title = "Status",
    Content = "● HadoHub is online\n● Interface loaded successfully\n● Version 1.0 • Stable"
})

Tabs.Dashboard:AddButton({
    Title = "Copy Discord invite",
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

local MasterToggle = Tabs.Main:AddToggle("MasterToggle", {
    Title = "Enable HadoHub",
    Description = "Master switch for all HadoHub features.",
    Default = false
})

MasterToggle:OnChanged(function(value)
    HadoHub:Notify({
        Title = "HadoHub",
        Content = value and "Main features enabled." or "Main features disabled.",
        Duration = 2
    })
end)

Tabs.Main:AddDropdown("HadoMode", {
    Title = "Operating mode",
    Description = "Choose your preferred configuration.",
    Values = {"Legit", "Balanced", "Performance"},
    Multi = false,
    Default = 2
})

Tabs.Main:AddSlider("PowerLevel", {
    Title = "Power level",
    Description = "Control the intensity of enabled features.",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0
})

Tabs.Player:AddSlider("WalkSpeed", {
    Title = "Walk speed",
    Description = "Adjust your character movement speed.",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0,

    Callback = function(value)
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character
        local humanoid = character
            and character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
})

Tabs.Player:AddButton({
    Title = "Reset character",
    Description = "Respawn your character immediately.",

    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local humanoid = player.Character
            and player.Character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.Health = 0
        end
    end
})

Tabs.Visuals:AddToggle("PurpleVisuals", {
    Title = "Purple visual mode",
    Description = "Enable the signature HadoHub visual style.",
    Default = true
})

Tabs.Visuals:AddColorpicker("AccentColor", {
    Title = "Accent color",
    Description = "Select your preferred interface accent.",
    Default = Color3.fromRGB(161, 65, 255)
})

Tabs.Settings:AddKeybind("MenuKey", {
    Title = "Interface key",
    Description = "Key used to minimize HadoHub.",
    Mode = "Toggle",
    Default = "LeftControl"
})

Tabs.Settings:AddButton({
    Title = "Unload HadoHub",
    Description = "Safely close the entire interface.",

    Callback = function()
        HadoHub:Destroy()
    end
})

HadoHub:Notify({
    Title = "Welcome to HadoHub",
    Content = "Professional purple interface loaded.",
    SubContent = "Press Left Ctrl to minimize.",
    Duration = 5
})

Window:SelectTab(1)
