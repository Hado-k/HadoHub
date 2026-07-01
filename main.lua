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
