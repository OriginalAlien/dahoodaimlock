--GAME: https://www.roblox.com/games/3403279477/Creeper-Aw-man-2-15-Part-1
--loadstring(game:HttpGet("https://raw.githubusercontent.com/OriginalAlien/robloxScript/main/creeperawman.lua"))()

local colors = {
    SchemeColor = Color3.fromRGB(128 ,0 , 128),
    Background = Color3.fromRGB(20,20,20),
    Header = Color3.fromRGB(10,10,10),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(15, 15, 15)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Creeper? Aw man | Hack Pannel", colors)

local PP = Window:NewTab("Player")
local SS = Window:NewTab("Stats")
local II = Window:NewTab("Items")
local TT = Window:NewTab("Teleports")
local EE = Window:NewTab("Extra")

local player = PP:NewSection("Player")
local stats = SS:NewSection("Stats")
local stats2 = SS:NewSection("Badges")
local item = II:NewSection("Items")
local teleport = TT:NewSection("Teleports")
local extra = EE:NewSection("Become")
local extra2 = EE:NewSection("Get")
local extra3 = EE:NewSection("Extra")

local Workspace = game:GetService("Workspace")
local Players = game.Players.LocalPlayer
local Character = Players.Character

--PLAYERS
player:NewButton("God Mode", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame1.PVP.HP:FireServer(math.huge, math.huge)
end)

player:NewButton("Be Invisible (Reset If Not Work)", "", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "To Stay Invisible, Don't Delete The \"Let me be clear\" Tool.\n\nUnless If You Want To Stop It";
        Icon = ""; 
        Duration = 15;
    })
    while true do
        game:GetService("Players").LocalPlayer.Backpack["Let me be clear"].Sound:FireServer()
        game:GetService("Players").LocalPlayer.Backpack["Let me be clear"].Sound:FireServer()
        wait(5)
    end
end)

player:NewButton("Stop Being Invisible", "", function()
    game:GetService("Players").LocalPlayer.Backpack["Let me be clear"]:Destroy()
    wait(7)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "Done!";
        Icon = ""; 
        Duration = 15;
    })
end)

player:NewButton("Reset", "", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

player:NewTextBox("Walk Speed", "", function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

player:NewTextBox("Jump Power", "", function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

--STATS

stats:NewDropdown("Select Option", "", {"Diamonds", "Level", "Rebirths", "OmegaRebirths", "EndTokens", "RiftOffer", "EventPoints"}, function(currentOption)
    Option = currentOption
end)

stats:NewTextBox("Custom Amount", "", function(amount)
    customAmount = amount
end)

stats:NewButton("Set Custom Amount", "", function()
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, game:GetService("Players").LocalPlayer.Currency[Option].Value, "Buy");
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, -customAmount, "Buy");
end)

stats:NewButton("Get Infinite", "", function()
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, -999999999999999999*9, "Buy");
end)

stats:NewButton("Reset", "", function() 
    game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", Option, game:GetService("Players").LocalPlayer.Currency[Option].Value, "Buy");
end)

stats:NewButton("Reset All Stats", "", function()
    for i, v in pairs(game:GetService("Players").LocalPlayer.Currency:GetChildren()) do
        game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("", tostring(v.Name), game:GetService("Players").LocalPlayer.Currency[tostring(v)].Value, "Buy");
    end
end)

stats2:NewButton("Get Rebirth Badge", "", function()
    game:GetService("ReplicatedStorage").REBIRTH:FireServer()
end)

stats2:NewButton("Get Omega Rebirth Badge", "", function()
    game:GetService("ReplicatedStorage").OMEGAREBIRTH:FireServer()
end)

--ITEMS

item:NewButton("Clear Inventory", "", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        v:Destroy()
    end
end)

item:NewButton("Give Yourself Necromancer Staff", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("Necromancer")
end)

item:NewButton("Give Yourself Death", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("Death")
end)

item:NewButton("Give Yourself Ghost Saber", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("GhostSaber")
end)

item:NewButton("Give Yourself Nether Axe", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("EventAxe")
end)

item:NewButton("Give Yourself Admin Weapon 1", "", function()
    game:GetService("ReplicatedStorage").OwSw:FireServer("TP")
end)

item:NewButton("Give Yourself Admin Weapon 2", "", function()
    game:GetService("ReplicatedStorage").OwSw2:FireServer()
end)

item:NewButton("Give Yourself Admin Weapon 3", "", function()
    game:GetService("ReplicatedStorage").ok:FireServer()
end)

item:NewButton("Give Yourself 60K Omega Rebirth Weapon", "", function()
   game:GetService("ReplicatedStorage").ItemGiveWeapon:FireServer("BestSwordEver", "OmegaRebirths", 0, "Unlock"); 
end)

item:NewButton("Give Yourself Heal Gun", "", function()
    game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("HealGun") 
end)

item:NewButton("Give Yourself Fart Gun", "", function()
   game:GetService("ReplicatedStorage").ItemGiveCollect:FireServer("FartGun") 
end)

--TELEPORT
teleport:NewTextBox("Teleport to User", "", function(user)
    plr1 = game.Players.LocalPlayer.Character
    user = string.lower(user)
    for i, v in pairs(game.Players:GetPlayers()) do
        if string.find(string.lower(v.Name), user) or string.find(string.lower(v.DisplayName), user)  then
            plr2 = tostring(v.Name)
            plr1.HumanoidRootPart.CFrame = game.Players[plr2].Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
        end
    end
end)

teleport:NewButton("Teleport to Astral World", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(109.549988, 24648.7988, 121.601791, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

teleport:NewButton("Teleport to Diamond Planet", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.56958, 14419.8916, 10.5787659, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

teleport:NewButton("Teleport to Cheese Moon", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(259.5, 4815.83496, 121.400879, 0, 1, -0, -1, 0, 0, 0, 0, 1)
end)

teleport:NewButton("Teleport to Nether", "", function()
    game:GetService("ReplicatedStorage").NetherTP:FireServer()
end)

teleport:NewButton("Teleport to Spells Dealer", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-305.751099, 50.9499931, -173.756882, 0.0577276908, 5.81315773e-10, 0.998332381, -8.53164082e-08, 1, 4.35105907e-09, -0.998332381, -8.54253059e-08, 0.0577276908)
end)

teleport:NewButton("Teleport to New Land", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(443.302643, 2.95000577, -2858.02344, 0.999960065, 2.06070307e-08, 0.00893836841, -2.11993658e-08, 1, 6.61740955e-08, -0.00893836841, -6.63609399e-08, 0.999960065)
end)

teleport:NewButton("Teleport to Spawn", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5,5,5)
end)

--EXTRA

extra:NewButton("Become Poop Dealer", "", function()
    game:GetService("ReplicatedStorage").TW:FireServer()
end)

extra:NewButton("Become Epic Burger", "", function()
    game:GetService("ReplicatedStorage").Burger:FireServer()
end)

extra:NewButton("Become Sprite Cranberry", "", function()
    game:GetService("ReplicatedStorage").Sprite:FireServer()
end)

extra:NewButton("Become Coffin", "", function()
    game:GetService("ReplicatedStorage").Coffin:FireServer()
end)

extra2:NewButton("Get Grab Gun", "NOT MADE BY ME, Grabs Unanchored Stuff", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OriginalAlien/dahoodaimlock/main/telekinesisGun.lua"))()
end)

extra2:NewButton("Get Building Tools", "", function()
    game:GetService("ReplicatedStorage").Btools:FireServer()
end)

extra2:NewButton("Get Jeep", "", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.Jeep.Buy.Spawn:FireServer()
end)

extra3:NewButton("Destroy All Blocks (Might Lag)", "", function()
    game:GetService("ReplicatedStorage").Btools:FireServer()
    wait(3)
    for i,v in pairs(game.Workspace.PlacedParts:GetChildren()) do
        game:GetService("Players").LocalPlayer.Backpack.DiamondPickAxe.BreakObject:FireServer(v)
    end
    
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "Done!";
        Icon = ""; 
        Duration = 15;
    })
    
end)

extra3:NewButton("Crash Server (Keep Clicking)", "(Lags Yourself Too, Keep Clicking Till Crash!)", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame1.PVP.HP:FireServer(math.huge, math.huge)
    wait(1)
    for i=0, 45000 do
        game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Shop.MiscShop.Jeep.Buy.Spawn:FireServer()
    end
end)
