
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")

local placeId = game.PlaceId
local gameName = game:GetService("MarketplaceService"):GetProductInfo(placeId).Name

-- Ładowanie "ekranowe"
for i = 1, 3 do
    print("🔄 Ładowanie Nexus Loader" .. string.rep(".", i))
    wait(0.5)
end

-- Nagłówek
print("▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄")
print("▌             Nexus Universal Lua Loader            ▌")
print("▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀")
print("Gracz: " .. LocalPlayer.Name)
print("Gra: " .. gameName .. " (ID: " .. placeId .. ")")
print("Czas: " .. os.date("%H:%M:%S"))

-- Lista skryptów powiązanych z grami
local scripts = {
    [6941239719] = "https://pastebin.com/raw/aimbot123", -- Gunfight Arena
    [40338756] = "https://pastebin.com/raw/testbase",    -- Baseplate
}

local function createGUI()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local Frame = Instance.new("Frame", ScreenGui)
    local TextLabel = Instance.new("TextLabel", Frame)

    ScreenGui.Name = "NexusLoaderGUI"
    Frame.Size = UDim2.new(0, 400, 0, 100)
    Frame.Position = UDim2.new(0.5, -200, 0.1, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderSizePixel = 0

    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Text = "🚀 Nexus Loader: " .. gameName
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.TextSize = 24
    TextLabel.BackgroundTransparency = 1
end

createGUI()

-- Wczytanie skryptu
if scripts[placeId] then
    print("🔍 Wczytywanie skryptu dla tej gry...")
    local success, err = pcall(function()
        loadstring(game:HttpGet(scripts[placeId]))()
    end)

    if success then
        print("✅ Skrypt załadowany pomyślnie.")
    else
        warn("❌ Błąd ładowania skryptu: " .. tostring(err))
    end
else
    warn("⚠️ Nie znaleziono skryptu dla tej gry.")
end

