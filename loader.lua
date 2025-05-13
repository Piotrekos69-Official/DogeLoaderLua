-- 📦 Usługi Roblox
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId

-- Pobierz nazwę gry
local gameName
pcall(function()
    gameName = MarketplaceService:GetProductInfo(placeId).Name
end)
gameName = gameName or "Nieznana gra"

-- ⏳ Konsolowe ładowanie
for i = 1, 3 do
    print("🔄 Ładowanie Doge Loader" .. string.rep(".", i))
    task.wait(0.5)
end

-- 🎯 Info w konsoli
print("▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄")
print("▌           🐶 Doge Universal Lua Loader           ▌")
print("▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀")
print("Gracz: " .. LocalPlayer.Name)
print("Gra: " .. gameName .. " (ID: " .. placeId .. ")")
print("Czas: " .. os.date("%H:%M:%S"))

-- 🧠 Lista skryptów po nazwie gry
local scriptsByName = {
    ["Baseplate"] = "https://pastebin.com/raw/testbase",
    ["Gunfight Arena"] = "https://pastebin.com/raw/aimbot123",
    ["Some Other Game"] = "https://pastebin.com/raw/othergame123",
    -- Dodaj więcej tu
}

-- ✅ Ładowanie Rayfield GUI
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

-- 🌈 GUI Rayfield
local Window = Rayfield:CreateWindow({
    Name = "🐶 Doge Loader | " .. gameName,
    LoadingTitle = "Doge Loader",
    LoadingSubtitle = "Wczytywanie...",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = false,
})

-- 📁 Zakładka GUI
local MainTab = Window:CreateTab("📂 Skrypt", 4483362458)

-- 🧨 Przycisk ładujący skrypt po nazwie gry
MainTab:CreateButton({
    Name = "🚀 Załaduj skrypt (wg nazwy gry)",
    Callback = function()
        if scriptsByName[gameName] then
            local url = scriptsByName[gameName]
            local success, err = pcall(function()
                loadstring(game:HttpGet(url))()
            end)

            if success then
                Rayfield:Notify({
                    Title = "Doge Loader",
                    Content = "✅ Skrypt załadowany!",
                    Duration = 5,
                })
            else
                Rayfield:Notify({
                    Title = "Doge Loader",
                    Content = "❌ Error Please Read List games That is supported " .. tostring(err),
                    Duration = 5,
                })
            end
        else
            Rayfield:Notify({
                Title = "Doge Loader",
                Content = "⚠️ Brak skryptu dla gry: " .. gameName,
                Duration = 5,
            })
        end
    end
})
