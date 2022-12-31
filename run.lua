local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/abodstatus/XO-Library/main/source.lua"))()
local Window = Library.CreateLib("XO Hub", "BloodTheme")

local MainTab = Window:NewTab("Main")
local PlayersTab = Window:NewTab("Players")
local CreditsTab = Window:NewTab("Credits")

local PlayerSection = PlayersTab:NewSection("Player Mods")

local CreditSection = CreditsTab:NewSection("Credits")
CreditSection:NewLabel("All Copyrights to Abdullah.")

local FarmSection = MainTab:NewSection("Auto Farm")

FarmSection:NewToggle("Auto Click", "This button You can auto clicking", function(state)
    if state then
    	getgenv().AutoClick = true
        if getgenv().AutoClick == true then
            repeat wait()
            game:GetService("ReplicatedStorage").Events.Tap:FireServer(1)
        until getgenv().AutoClick  == false
        print("Toggle On")
    end
    else
        getgenv().AutoClick = false
        print("Toggle Off")
    end
end)

rebirth = 1
FarmSection:NewToggle("Auto Rebirth", "This button You can auto clicking", function(state)
    if state then
    	getgenv().AutoRebirth = true
        if getgenv().AutoRebirth == true then
            repeat wait()
        game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(rebirth)

        until getgenv().AutoRebirth  == false
        print("Toggle On")
    end
        else
        getgenv().AutoRebirth = false
        print("Toggle Off")
    end
end)

FarmSection:NewTextBox("Rebirth Amount", "This You can choose rebirth amount you want to auto rebirth it", function(txt)
	rebirth = txt
end)

PlayerSection:NewSlider("Speed", "This You can change your walkspeed in the map", 1000, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
