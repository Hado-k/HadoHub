local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local PFP_URL = "https://raw.githubusercontent.com/Hado-k/HadoHub/main/hadopfpNew.png"
local BACKGROUND_URL = "https://raw.githubusercontent.com/Hado-k/HadoHub/main/image.png"
local DISCORD_URL = "https://discord.gg/g9e6VZnhft"

local PURPLE = Color3.fromRGB(174, 61, 255)
local LIGHT_PURPLE = Color3.fromRGB(225, 167, 255)

local function LoadAsset(url, filename)
    if not writefile or not isfile or not getcustomasset then
        return nil
    end

    if not isfile(filename) then
        local success, data = pcall(function()
            return game:HttpGet(url, true)
        end)

        if success then
            writefile(filename, data)
        end
    end

    local success, asset = pcall(function()
        return getcustomasset(filename)
    end)

    return success and asset or nil
end

local HadoIcon = LoadAsset(PFP_URL, "HadoHubIcon.png")
local HadoBackground = LoadAsset(BACKGROUND_URL, "HadoHubBackground.png")

-- Remove old Hado interfaces
for _, object in ipairs(PlayerGui:GetChildren()) do
    if object.Name == "HadoHubIntro" then
        object:Destroy()
    end
end

--// INTRO

local Intro = Instance.new("ScreenGui")
Intro.Name = "HadoHubIntro"
Intro.IgnoreGuiInset = true
Intro.ResetOnSpawn = false
Intro.DisplayOrder = 999999
Intro.Parent = PlayerGui

local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(4, 1, 10)
Background.BorderSizePixel = 0
Background.Parent = Intro

local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(4, 1, 10)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(54, 5, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 1, 28))
})
BackgroundGradient.Rotation = 35
BackgroundGradient.Parent = Background


local LogoFrame = Instance.new("Frame")
LogoFrame.AnchorPoint = Vector2.new(0.5, 0.5)
LogoFrame.Position = UDim2.fromScale(0.5, 0.42)
LogoFrame.Size = UDim2.fromOffset(20, 20)
LogoFrame.BackgroundTransparency = 1
LogoFrame.BorderSizePixel = 0
LogoFrame.ClipsDescendants = true
LogoFrame.Parent = Background

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 30)
LogoCorner.Parent = LogoFrame

local LogoImage = Instance.new("ImageLabel")
LogoImage.Position = UDim2.fromOffset(0, 0)
LogoImage.Size = UDim2.fromScale(1, 1)
LogoImage.BackgroundTransparency = 1
LogoImage.Image = HadoIcon or ""
LogoImage.ImageTransparency = 1
LogoImage.ScaleType = Enum.ScaleType.Crop
LogoImage.Parent = LogoFrame

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(0, 24)
ImageCorner.Parent = LogoImage

local FallbackLogo = Instance.new("TextLabel")
FallbackLogo.Size = UDim2.fromScale(1, 1)
FallbackLogo.BackgroundTransparency = 1
FallbackLogo.Text = HadoIcon and "" or "H"
FallbackLogo.TextColor3 = LIGHT_PURPLE
FallbackLogo.TextTransparency = 1
FallbackLogo.Font = Enum.Font.GothamBold
FallbackLogo.TextScaled = true
FallbackLogo.Parent = LogoFrame

local FallbackPadding = Instance.new("UIPadding")
FallbackPadding.PaddingTop = UDim.new(0, 25)
FallbackPadding.PaddingBottom = UDim.new(0, 25)
FallbackPadding.PaddingLeft = UDim.new(0, 25)
FallbackPadding.PaddingRight = UDim.new(0, 25)
FallbackPadding.Parent = FallbackLogo

local Title = Instance.new("TextLabel")
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.Position = UDim2.fromScale(0.5, 0.59)
Title.Size = UDim2.fromOffset(450, 50)
Title.BackgroundTransparency = 1
Title.Text = "HADO HUB"
Title.TextColor3 = Color3.fromRGB(250, 244, 255)
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
Subtitle.TextColor3 = Color3.fromRGB(207, 127, 255)
Subtitle.TextTransparency = 1
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextSize = 12
Subtitle.Parent = Background

local Bar = Instance.new("Frame")
Bar.AnchorPoint = Vector2.new(0.5, 0.5)
Bar.Position = UDim2.fromScale(0.5, 0.7)
Bar.Size = UDim2.fromOffset(250, 4)
Bar.BackgroundColor3 = Color3.fromRGB(57, 26, 75)
Bar.BorderSizePixel = 0
Bar.Parent = Background

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = Bar

local Fill = Instance.new("Frame")
Fill.Size = UDim2.fromScale(0, 1)
Fill.BackgroundColor3 = PURPLE
Fill.BorderSizePixel = 0
Fill.Parent = Bar

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = Fill

TweenService:Create(
    LogoFrame,
    TweenInfo.new(0.7, Enum.EasingStyle.Back),
    {Size = UDim2.fromOffset(145, 145)}
):Play()

TweenService:Create(LogoImage, TweenInfo.new(0.6), {
    ImageTransparency = 0
}):Play()

TweenService:Create(FallbackLogo, TweenInfo.new(0.6), {
    TextTransparency = 0
}):Play()

task.wait(0.3)

TweenService:Create(Title, TweenInfo.new(0.4), {
    TextTransparency = 0
}):Play()

TweenService:Create(Subtitle, TweenInfo.new(0.4), {
    TextTransparency = 0
}):Play()

TweenService:Create(
    Fill,
    TweenInfo.new(1.6, Enum.EasingStyle.Quint),
    {Size = UDim2.fromScale(1, 1)}
):Play()

task.wait(1.9)

TweenService:Create(Background, TweenInfo.new(0.4), {
    BackgroundTransparency = 1
}):Play()

TweenService:Create(LogoFrame, TweenInfo.new(0.35), {
    BackgroundTransparency = 1
}):Play()

TweenService:Create(LogoImage, TweenInfo.new(0.3), {
    ImageTransparency = 1
}):Play()

TweenService:Create(Title, TweenInfo.new(0.3), {
    TextTransparency = 1
}):Play()

TweenService:Create(Subtitle, TweenInfo.new(0.3), {
    TextTransparency = 1
}):Play()

task.wait(0.45)
Intro:Destroy()

--// FLUENT WINDOW

local HadoHub = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

local Window = HadoHub:CreateWindow({
    Title = "HADO HUB",
    SubTitle = "by Hado-k • v1.0",
    TabWidth = 155,
    Size = UDim2.fromOffset(650, 510),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Add the Hado PFP at the far-left of Fluent's header
task.spawn(function()
    task.wait(0.8)

    if not HadoIcon then
        return
    end

    local roots = { PlayerGui }

    pcall(function()
        table.insert(roots, game:GetService("CoreGui"))
    end)

    pcall(function()
        if gethui then
            table.insert(roots, gethui())
        end
    end)

    -- Remove icons left by earlier executions.
    for _, rootGui in ipairs(roots) do
        for _, oldIcon in ipairs(rootGui:GetDescendants()) do
            if oldIcon.Name == "HadoTitleIcon" then
                oldIcon:Destroy()
            end
        end
    end

    for _, rootGui in ipairs(roots) do
        for _, element in ipairs(rootGui:GetDescendants()) do
            if element:IsA("TextLabel")
                and string.find(element.Text, "HADO HUB", 1, true) then

                local header = element.Parent

                while header and header ~= rootGui do
                    if header:IsA("GuiObject")
                        and header.AbsoluteSize.X >= 500
                        and header.AbsoluteSize.Y <= 80 then
                        break
                    end

                    header = header.Parent
                end

                if header and header:IsA("GuiObject") then
                    local icon = Instance.new("ImageLabel")
                    icon.Name = "HadoTitleIcon"
                    icon.AnchorPoint = Vector2.new(0, 0.5)
                    icon.Position = UDim2.new(0, 13, 0.5, 0)
                    icon.Size = UDim2.fromOffset(24, 24)
                    icon.BackgroundTransparency = 1
                    icon.Image = HadoIcon
                    icon.ScaleType = Enum.ScaleType.Crop
                    icon.ZIndex = 50
                    icon.Parent = header

                    local iconCorner = Instance.new("UICorner")
                    iconCorner.CornerRadius = UDim.new(0, 6)
                    iconCorner.Parent = icon

                    if not string.match(element.Text, "^%s%s%s%s%s") then
                        element.Text = "      " .. element.Text
                    end

                    return
                end
            end
        end
    end
end)

local Tabs = {
    Dashboard = Window:AddTab({
        Title = "Dashboard",
        Icon = "home"
    }),
    
     Main = Window:AddTab({
        Title = "Main",
        Icon = "layers"
    }),
    
    Player = Window:AddTab({
        Title = "Player",
        Icon = "user"
    }),

    Visuals = Window:AddTab({
        Title = "ESP & Visuals",
        Icon = "eye"
    }),

    Settings = Window:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}

Tabs.Dashboard:AddParagraph({
    Title = "HadoHub v1.0",
    Content = "Professional purple experience by Hado-k.\nStatus: Online • Stable • Ready"
})

local function OpenDiscord()
    if openurl then
        openurl(DISCORD_URL)
    elseif open_url then
        open_url(DISCORD_URL)
    elseif syn and syn.open_url then
        syn.open_url(DISCORD_URL)
    elseif setclipboard then
        setclipboard(DISCORD_URL)

        HadoHub:Notify({
            Title = "HadoHub",
            Content = "Discord link copied.",
            Duration = 4
        })
    end
end

Tabs.Dashboard:AddButton({
    Title = "Join the HadoHub Discord",
    Description = "discord.gg/g9e6VZnhft",
    Callback = OpenDiscord
})

--// PLAYER CONTROLS

Tabs.Player:AddSlider("WalkSpeed", {
    Title = "Walk speed",
    Description = "Adjust character movement speed.",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,

    Callback = function(value)
        local character = Player.Character
        local humanoid = character
            and character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
})

Tabs.Player:AddSlider("JumpPower", {
    Title = "Jump power",
    Description = "Adjust character jump strength.",
    Default = 50,
    Min = 50,
    Max = 250,
    Rounding = 0,

    Callback = function(value)
        local character = Player.Character
        local humanoid = character
            and character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = value
        end
    end
})

local Flying = false
local FlyConnection
local FlyVelocity
local FlyGyro
local FlySpeed = 65

local function StopFlying()
    Flying = false

    if FlyConnection then
        FlyConnection:Disconnect()
        FlyConnection = nil
    end

    if FlyVelocity then
        FlyVelocity:Destroy()
        FlyVelocity = nil
    end

    if FlyGyro then
        FlyGyro:Destroy()
        FlyGyro = nil
    end
end

local function StartFlying()
    StopFlying()

    local character = Player.Character
    local root = character
        and character:FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    Flying = true

    FlyVelocity = Instance.new("BodyVelocity")
    FlyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    FlyVelocity.Velocity = Vector3.zero
    FlyVelocity.Parent = root

    FlyGyro = Instance.new("BodyGyro")
    FlyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    FlyGyro.P = 9000
    FlyGyro.CFrame = root.CFrame
    FlyGyro.Parent = root

    FlyConnection = RunService.RenderStepped:Connect(function()
        if not Flying or not root.Parent then
            StopFlying()
            return
        end

        local camera = workspace.CurrentCamera
        local direction = Vector3.zero

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            direction += camera.CFrame.LookVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            direction -= camera.CFrame.LookVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            direction -= camera.CFrame.RightVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            direction += camera.CFrame.RightVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction += Vector3.yAxis
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            direction -= Vector3.yAxis
        end

        FlyVelocity.Velocity =
            direction.Magnitude > 0
            and direction.Unit * FlySpeed
            or Vector3.zero

        FlyGyro.CFrame = camera.CFrame
    end)
end

local FlyToggle = Tabs.Player:AddToggle("FlyEnabled", {
    Title = "Fly",
    Description = "WASD to move, Space up, Left Shift down.",
    Default = false
})

FlyToggle:OnChanged(function(value)
    if value then
        StartFlying()
    else
        StopFlying()
    end
end)

Tabs.Player:AddSlider("FlySpeed", {
    Title = "Fly speed",
    Description = "Adjust flight movement speed.",
    Default = 65,
    Min = 20,
    Max = 200,
    Rounding = 0,

    Callback = function(value)
        FlySpeed = value
    end
})

--// ESP

local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "HadoHubESP"
ESPFolder.Parent = PlayerGui

local PlayerESPEnabled = false
local NamesEnabled = false
local DistanceEnabled = false
local ItemESPEnabled = false

local function RemovePlayerESP(target)
    local character = target.Character

    if not character then
        return
    end

    local highlight = character:FindFirstChild("HadoPlayerHighlight")
    if highlight then
        highlight:Destroy()
    end

    local root = character:FindFirstChild("HumanoidRootPart")
    local billboard = root and root:FindFirstChild("HadoPlayerInfo")

    if billboard then
        billboard:Destroy()
    end
end

local function UpdatePlayerESP(target)
    if target == Player then
        return
    end

    local character = target.Character
    local root = character
        and character:FindFirstChild("HumanoidRootPart")

    if not character or not root then
        return
    end

    if PlayerESPEnabled then
        local highlight =
            character:FindFirstChild("HadoPlayerHighlight")
            or Instance.new("Highlight")

        highlight.Name = "HadoPlayerHighlight"
        highlight.FillColor = PURPLE
        highlight.FillTransparency = 0.55
        highlight.OutlineColor = LIGHT_PURPLE
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = character
        highlight.Parent = character
    end

    if NamesEnabled or DistanceEnabled then
        local billboard =
            root:FindFirstChild("HadoPlayerInfo")
            or Instance.new("BillboardGui")

        billboard.Name = "HadoPlayerInfo"
        billboard.Adornee = root
        billboard.Size = UDim2.fromOffset(220, 40)
        billboard.StudsOffset = Vector3.new(0, 3.4, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = root

        local label =
            billboard:FindFirstChild("Text")
            or Instance.new("TextLabel")

        label.Name = "Text"
        label.Size = UDim2.fromScale(1, 1)
        label.BackgroundTransparency = 1
        label.TextColor3 = LIGHT_PURPLE
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextStrokeTransparency = 0.25
        label.Font = Enum.Font.GothamBold
        label.TextSize = 13
        label.Parent = billboard

        local pieces = {}

        if NamesEnabled then
            table.insert(pieces, target.DisplayName)
        end

        if DistanceEnabled
            and Player.Character
            and Player.Character:FindFirstChild("HumanoidRootPart") then

            local distance = (
                root.Position
                - Player.Character.HumanoidRootPart.Position
            ).Magnitude

            table.insert(pieces, math.floor(distance) .. " studs")
        end

        label.Text = table.concat(pieces, " • ")
    else
        local billboard = root:FindFirstChild("HadoPlayerInfo")

        if billboard then
            billboard:Destroy()
        end
    end
end

local function RefreshPlayers()
    for _, target in ipairs(Players:GetPlayers()) do
        if PlayerESPEnabled or NamesEnabled or DistanceEnabled then
            UpdatePlayerESP(target)
        else
            RemovePlayerESP(target)
        end
    end
end

local PlayerToggle = Tabs.Visuals:AddToggle("PlayerESP", {
    Title = "Player ESP",
    Description = "Highlight all other players.",
    Default = false
})

PlayerToggle:OnChanged(function(value)
    PlayerESPEnabled = value
    RefreshPlayers()
end)

local NameToggle = Tabs.Visuals:AddToggle("NameESP", {
    Title = "Player names",
    Description = "Show display names above players.",
    Default = false
})

NameToggle:OnChanged(function(value)
    NamesEnabled = value
    RefreshPlayers()
end)

local DistanceToggle = Tabs.Visuals:AddToggle("DistanceESP", {
    Title = "Player distance",
    Description = "Show the distance to every player.",
    Default = false
})

DistanceToggle:OnChanged(function(value)
    DistanceEnabled = value
    RefreshPlayers()
end)

local function IsItem(object)
    return object:IsA("Tool")
        or object:FindFirstChildWhichIsA(
            "ProximityPrompt",
            true
        ) ~= nil
        or object:FindFirstChildWhichIsA(
            "ClickDetector",
            true
        ) ~= nil
end

local function RemoveItemESP()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object.Name == "HadoItemHighlight"
            or object.Name == "HadoItemName" then
            object:Destroy()
        end
    end
end

local function RefreshItems()
    RemoveItemESP()

    if not ItemESPEnabled then
        return
    end

    local count = 0

    for _, object in ipairs(workspace:GetChildren()) do
        if count >= 150 then
            break
        end

        if object ~= Player.Character and IsItem(object) then
            local adornee

            if object:IsA("Model") then
                adornee = object
            elseif object:IsA("BasePart") then
                adornee = object
            elseif object:IsA("Tool") then
                adornee = object:FindFirstChildWhichIsA("BasePart")
            end

            if adornee then
                local highlight = Instance.new("Highlight")
                highlight.Name = "HadoItemHighlight"
                highlight.Adornee = adornee
                highlight.FillColor = Color3.fromRGB(213, 105, 255)
                highlight.FillTransparency = 0.65
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.DepthMode =
                    Enum.HighlightDepthMode.AlwaysOnTop
                highlight.Parent = object

                count += 1
            end
        end
    end
end

local ItemToggle = Tabs.Visuals:AddToggle("ItemESP", {
    Title = "Item ESP",
    Description = "Highlight tools and interactable objects.",
    Default = false
})

ItemToggle:OnChanged(function(value)
    ItemESPEnabled = value
    RefreshItems()
end)

task.spawn(function()
    while task.wait(0.2) do
        if NamesEnabled or DistanceEnabled then
            RefreshPlayers()
        end
    end
end)

task.spawn(function()
    while task.wait(4) do
        if ItemESPEnabled then
            RefreshItems()
        end
    end
end)

--// SETTINGS

Tabs.Settings:AddKeybind("MenuKey", {
    Title = "Menu key",
    Description = "Key used to minimize HadoHub.",
    Mode = "Toggle",
    Default = "LeftControl"
})

Tabs.Settings:AddButton({
    Title = "Copy Discord",
    Description = DISCORD_URL,

    Callback = function()
        if setclipboard then
            setclipboard(DISCORD_URL)
        end
    end
})

Tabs.Settings:AddButton({
    Title = "Unload HadoHub",
    Description = "Remove the interface and active visuals.",

    Callback = function()
        StopFlying()
        RemoveItemESP()

        for _, target in ipairs(Players:GetPlayers()) do
            RemovePlayerESP(target)
        end

        ESPFolder:Destroy()
        HadoHub:Destroy()
    end
})

HadoHub:Notify({
    Title = "HadoHub v1.0",
    Content = "Professional purple interface loaded.",
    SubContent = "Press Left Ctrl to minimize.",
    Duration = 5
})

Window:SelectTab(1)
