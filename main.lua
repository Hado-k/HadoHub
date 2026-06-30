local HadoHub = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

local Window = HadoHub:CreateWindow({
    Title = "HadoHub",
    SubTitle = "by Hado-k",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Home = Window:AddTab({
        Title = "Home",
        Icon = "home"
    }),

    Main = Window:AddTab({
        Title = "Main",
        Icon = "zap"
    }),

    Player = Window:AddTab({
        Title = "Player",
        Icon = "user"
    }),

    Settings = Window:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}

Tabs.Home:AddParagraph({
    Title = "Welcome to HadoHub",
    Content = "Clean, fast and focused.\nSelect a category to get started."
})

Tabs.Home:AddButton({
    Title = "Discord",
    Description = "Copy the Discord invitation.",
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

local Enabled = Tabs.Main:AddToggle("HadoEnabled", {
    Title = "Enable HadoHub",
    Description = "Enable the main features.",
    Default = false
})

Enabled:OnChanged(function(value)
    print("[HadoHub] Enabled:", value)
end)

Tabs.Main:AddDropdown("Mode", {
    Title = "Mode",
    Description = "Select an operating mode.",
    Values = {
        "Legit",
        "Balanced",
        "Fast"
    },
    Multi = false,
    Default = 2
})

Tabs.Main:AddSlider("Intensity", {
    Title = "Intensity",
    Description = "Adjust the selected mode.",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0
})

Tabs.Player:AddSlider("WalkSpeed", {
    Title = "Walk speed",
    Description = "Change the character's speed.",
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
    Description = "Respawn your character.",

    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character
        local humanoid = character
            and character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.Health = 0
        end
    end
})

Tabs.Settings:AddKeybind("MenuKey", {
    Title = "Menu key",
    Description = "Key used to minimize the interface.",
    Mode = "Toggle",
    Default = "LeftControl"
})

Tabs.Settings:AddButton({
    Title = "Unload HadoHub",
    Description = "Close the interface.",

    Callback = function()
        HadoHub:Destroy()
    end
})

HadoHub:Notify({
    Title = "HadoHub",
    Content = "Interface loaded successfully.",
    SubContent = "Press Left Ctrl to minimize.",
    Duration = 4
})

Window:SelectTab(1)
