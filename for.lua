--Script Functions
local lib = require(game:GetService("ReplicatedStorage").Library)
local Player = game.Players.LocalPlayer
local HiddenPresents = getsenv(Player.PlayerScripts.Scripts.Game.Misc["Hidden Presents"])
local Shiny = getsenv(Player.PlayerScripts.Scripts.Game.Misc["Shiny Relics"])

local function GetCurrentZone()
    local a = require(game:GetService("ReplicatedStorage").Library.Client.MapCmds)
    return a.GetCurrentZone()
    end
    
    local function GetMaxEggOpen()
    local a = require(game:GetService("ReplicatedStorage").Library.Client.EggCmds) 
    return a.GetMaxHatch()
    end
    for i,v in pairs(getconnections(workspace.__THINGS.Lootbags.ChildAdded)) do
        v:Disable()
        end
    local asdf = {}
    local eggs = {}
    local function GetAllEggs()
    for _, v in pairs(lib.Directory.Eggs) do
        if v["_id"] ~= nil and v["eggNumber"] ~= nil then
            table.insert(asdf, {v["_id"], v["eggNumber"]})
        end
    end
    table.sort(asdf, function(a, b)
        return tonumber(a[2]) < tonumber(b[2])
    end)
    for i,v in pairs(asdf) do
    table.insert(eggs, v[1])
    end
    return eggs
    end
    
    local a = require(game:GetService("ReplicatedStorage").Library.Client.OrbCmds.Orb)
    getgenv().oldCollect1 = a.CollectDistance 
    getgenv().oldCollect2 = a.DefaultPickUpDistance
    
    local function GetNextZone()
    local ass = require(game:GetService("ReplicatedStorage").Library.Client.ZoneCmds)
    local a,b = ass.GetNextZone()
    return a 
    end
    
    local function GetBestZone()
    local a = require(game:GetService("ReplicatedStorage").Library.Client.ZoneCmds)
    return a.GetMaximumZone()["_id"]
    end
    
    local function Zone_Unlocked(arg)
    local a = require(game:GetService("ReplicatedStorage").Library.Client.ZoneCmds)
    return a.Owns(arg)
    end
    
    local function Check()
    if Zone_Unlocked(tofarm) == false then 
    print("Bruh")
    end
    return Zone_Unlocked(tofarm)
    end
    
    function GetEquippedPets()
    local pets = {}
    for i,v in pairs(lib.Save.Get().EquippedPets) do
    table.insert(pets, i)
    return pets
    end
    end
    
    function GetCoins(arg1)
    local coins = workspace.__THINGS.Breakables
    local coin = {}
    for i,v in pairs(coins:GetChildren()) do
    
    if v:GetAttribute('ParentID') == arg1 then 
    table.insert(coin, v)
    end
    
    end
    return coin
    end
    

    local function GetZal()
        local a = require(game.ReplicatedStorage.Library)
        local Twitter = a.Save.Get().IsFollowingOnTwitter
        local Group = a.Save.Get().GroupVerification
        local VIP = a.Save.Get().Gamepasses.VIP or false
    
        local result = {
            Twitter = Twitter,
            Group = Group,
        VIP = VIP
        }
    
        return result
    end
    
    for i,v in next, getgc(true) do
        if type(v) == "table" then
            if rawget(v, "DailyDiamonds1") then
                DailyShit = v
            end
            if rawget(v, "DailyDiamonds2") then
                DailyShit = v
            end
        end
    end
    
    local Find = function(Parent, Instance)
        return Parent:FindFirstChild(Instance, true)
    end
    
    local blacklist = {}
    local zalData = GetZal()
    
    if not zalData.VIP then
        blacklist["VIPRewards"] = true
    end
    
    if not zalData.Twitter then
        blacklist["SocialRewards"] = true
    end
    
    if not zalData.Group then
        blacklist["GroupRewards"] = true
    end
    
    local function Find(Parent, Instance)
        return Parent:FindFirstChild(Instance, true) 
    end
    
    local function ClaimDaily()
        local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        
        for i,v in pairs(DailyShit) do
    if Adolfgitler then
            local Skid = Find(Workspace.Map, i)
            if Skid and Skid:FindFirstChild("Billboard") and Skid.Billboard.BillboardGui:FindFirstChild("Timer") and Skid.Billboard.BillboardGui.Timer.Text == "Claim!" then
                if blacklist[Skid.Name] == false or blacklist[Skid.Name] == nil and Adolfgitler == true then
                    print("Teleporting to reward:", Skid.Name)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Skid.Pad.CFrame * CFrame.new(0, 10, 10)
                    wait(0.5)
                    
                    game:GetService("ReplicatedStorage").Network.DailyRewards_Redeem:InvokeServer(Skid.Name)
                    wait(0.5)
                end
            end
        end
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
    end

    local balls = workspace.__THINGS.BalloonGifts

    function GetCoinsBALL()
        local coins = workspace.__THINGS.Breakables
        local coin = {}
        for i, v in pairs(coins:GetChildren()) do
            if v:IsA("Model") then 
                local coind = v:GetAttribute('BreakableID')
                if coind and string.find(coind, "Gift") and v:GetAttribute("OwnerUsername") == game.Players.LocalPlayer.Name then 
                    table.insert(coin, v)
                end
            end
        end
        return coin
    end
    
    local function Shotballs()
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Slingshot_Equip"):InvokeServer()
    for i,v in pairs(balls:GetChildren()) do
    if v:FindFirstChild("Balloon") then
    local ballonid = v.Balloon:GetAttribute("BalloonId")
    local args = {
        [1] = Vector3.new(1488,1488,1488),
        [2] = 1488,
        [3] = 1488,
        [4] = 1488
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Slingshot_FireProjectile"):InvokeServer(unpack(args))
    
    
    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("BalloonGifts_BalloonHit"):FireServer(ballonid)
    end
    end
    end

    function GetCoins(arg1)
    local coins = workspace.__THINGS.Breakables
    local coin = {}
    for i,v in pairs(coins:GetChildren()) do
    
    if v:GetAttribute('ParentID') == arg1 then 
    table.insert(coin, v)
    end
    
    end
    return coin
    end

    local Lootbag = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game["Lootbags Frontend"])
    for i,v in pairs(workspace.__THINGS.Lootbags:GetChildren()) do
    Lootbag.Claim(v.Name)
    end
    
    workspace.__THINGS.Lootbags.ChildAdded:Connect(function(arg)
    if AutoLootBag then
    wait(.5)
    Lootbag.Claim(arg.Name)
    end
    end)
    
    function GetClosestCoin()
    local coin = workspace.__THINGS.Breakables
    --local closestZone = nil
    local a = math.huge
    local closest = nil
    --local table = {}
    for i,v in pairs(coin:GetChildren()) do
    if v.Name ~= "Highlight" then
    local adolf =  v:GetPivot().Position
    local me = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local magnituda = (adolf - me).Magnitude
    if magnituda < a then
    a = magnituda
    closest = v.Name
    --closestZone = v:GetAttribute("ParentID")
    --table[1] = closest 
    --table[2] = closestZone
    end
    end
    end
    return closest
    end

for i,v in next, getgc() do
    if type(v) == "function" then
        if getfenv(v).script == Player.PlayerScripts.Scripts.Game.Misc["Hidden Presents"] then
            if getinfo(v).name == "GetActive" then
                GetActive = v
            elseif getinfo(v).name == "Clicked" then
                Clicked = v
            end
        end
        if getfenv(v).script == Player.PlayerScripts.Scripts.Game.Misc["Shiny Relics"] then
            if getinfo(v).name == "RequestRelics" then
                RequestRelics = v
            elseif getinfo(v).name == "RelicClicked" then
                RelicClicked = v
            end
        end
    end
end

--[[local GetPresentTable = function(Pre)
    if Pre then
        for i,v in next, getupvalue(GetActive, 1) do
            if v.Model == Pre then
                return v
            end
        end
    end
end]]--

local getShiny = function(Shin)
    if Shin then
        for i,v in next, getupvalue(RequestRelics,1) do
            if v.Model == Shin then
                return v
            end
        end
    end
end

--Main System | Update
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({Name = "Cat Hub Revival", HidePremium = true, SaveConfig = true, ConfigFolder = "Cat Hub Revival", IntroEnabled = true, IntroText = "Cat Hub|Loader",IntroIcon = "rbxassetid://10472045394", Icon = "rbxassetid://10472045394" })
--Player Info Tab
local InfoTab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://7733978098",
	PremiumOnly = false
})

local Section = InfoTab:AddSection({
	Name = "Player Information"
})

InfoTab:AddLabel("Player Username | "..game.Players.LocalPlayer.name)
InfoTab:AddLabel("Player Id | "..game.Players.LocalPlayer.UserId)
InfoTab:AddLabel("Local Game Name: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
InfoTab:AddLabel("Join In Discord Server For New Updates")
InfoTab:AddLabel("discord.gg/ZBPmWjkPG2")
--Main Tab
local FarmTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://15257082607",
    PremiumOnly = false
})
 
local Section = FarmTab:AddSection({
    Name = "Auto Farm"
})

local maps = workspace:WaitForChild("Map")
local nigger = {}
local kebab = maps:GetChildren()

for i,v in pairs(kebab) do
    if v.Name ~= "SHOP" then
    table.insert(nigger, v.Name)
    end end
    table.sort(nigger ,function(a,b)
        return tonumber(string.match(a,"%d+")) < tonumber(string.match(b,"%d+"))
    end)

FarmTab:AddDropdown({
    Name = "Select Zone",
    Default = "",
    Options = nigger,
    Callback = function(zone)
    getgenv().tofarm = string.sub(zone, string.find(zone, "%u"), #zone)
getgenv().towalk = zone
    end
})

FarmTab:AddDropdown({
	Name = " Select Type Farm",
	Default = "",
	Options = {"Nearest","Zone"},
	Callback = function(Value)
		getgenv().TypeAutoFarm = Value
	end    
})

FarmTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(Value)
    getgenv().AutoFarmK = Value
    if getgenv().TypeAutoFarm == "Nearest" then
        while AutoFarmK and wait() do
            local coins2 = GetClosestCoin()
            game.ReplicatedStorage:WaitForChild("Network"):WaitForChild("Breakables_PlayerDealDamage"):FireServer(GetClosestCoin())
            end
    elseif getgenv().TypeAutoFarm == "Zone" then
        if AutoFarmK and Check() and GetCurrentZone() ~= tofarm and Zone_Unlocked(tofarm) == true then
            local args = {
                [1] = tofarm
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Teleports_RequestTeleport"):InvokeServer(unpack(args))
            wait(5)
            end
            if AutoFarmK and GetCurrentZone() == tofarm then
            game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.Map[towalk].INTERACT.BREAK_ZONES.BREAK_ZONE.Position)
            end
            while AutoFarmK and wait(.1) do
            local coins = GetCoins(tofarm)
            for i,v in pairs(coins) do
            game.ReplicatedStorage:WaitForChild("Network"):WaitForChild("Breakables_PlayerDealDamage"):FireServer(v.Name)
            end
            end
    end
end
})


FarmTab:AddToggle({
    Name = "Auto Shoot Ballons",
    Default = false,
    Callback = function(dd)
    getgenv().balon = dd
while balon and wait(.1) do
Shotballs()
for i,v in pairs(GetCoinsBALL()) do
local coinId = v.Name
local coinPos = v:GetPivot()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = coinPos
repeat task.wait()
game.ReplicatedStorage:WaitForChild("Network"):WaitForChild("Breakables_PlayerDealDamage"):FireServer(coinId)
until not 
workspace.__THINGS.Breakables:FindFirstChild(coinId)
end
end
end
})

FarmTab:AddToggle({
    Name = "Claim Rewards",
    Default = false,
    Callback = function(dd2)
    getgenv().Adolfgitler = dd2
while Adolfgitler and wait(.1) do
ClaimDaily()
end
end
})

local Section = FarmTab:AddSection({
    Name = "Settings"
})

FarmTab:AddToggle({
    Name = "Auto Collect Orbs/Lootbags",
    Default = false,
    Callback = function(Value)
        getgenv().AutoCollctLootOrbs = Value
        while AutoCollctLootOrbs and wait() do
local a = require(game:GetService("ReplicatedStorage").Library.Client.OrbCmds.Orb)
if AutoCollctLootOrbs then
a.DefaultPickUpDistance = math.huge
a.CollectDistance = math.huge
else
a.DefaultPickUpDistance = oldCollect2
a.CollectDistance = oldCollect1
end
if AutoCollctLootOrbs then
    local Lootbag = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game["Lootbags Frontend"])
    for i,v in pairs(workspace.__THINGS.Lootbags:GetChildren()) do
    Lootbag.Claim(v.Name)
    end
end
        end
    end
})

FarmTab:AddToggle({
    Name = "Auto Buy Next Zone",
    Default = false,
    Callback = function(retard23)
    getgenv().autobuy_zone = retard23
while autobuy_zone and wait() do
local args = {
    [1] = GetNextZone()
}

game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Zones_RequestPurchase"):InvokeServer(unpack(args))
end
end
})

FarmTab:AddToggle({
    Name = "Pet speed inf",
    Default = false,
    Callback = function(retard2)
    getgenv().petsped = retard2
if petsped == true then
local a = require(game:GetService("ReplicatedStorage").__DIRECTORY.Upgrades["Upgrade | Pet Speed"])
a.TierPowers[1] = math.huge
else
local a = require(game:GetService("ReplicatedStorage").__DIRECTORY.Upgrades["Upgrade | Pet Speed"])
a.TierPowers[1] = oldpetspeed
end
end
})

local Section = FarmTab:AddSection({
    Name = "Auto Ultimate"
})

FarmTab:AddDropdown({
	Name = " Select Ultimate",
	Default = "",
	Options = {"Ground Pound","Pet Surge","Black Hole","Hidden Treasure","Chest Spell","Tornado","Lightning Storm","TNT Shower"},
	Callback = function(Value)
		getgenv().UltimateSel = Value
	end    
})

FarmTab:AddToggle({
	Name = "Auto Use Selected Ultimate",
	Default = false,
	Callback = function(Value)
getgenv().UseUltimate = Value
if UseUltimate == true then
while UseUltimate == true and task.wait() do
local args = {[1] = UltimateSel}
game:GetService("ReplicatedStorage").Network:FindFirstChild("Ultimates: Activate"):InvokeServer(unpack(args))
end
end
end    
})

local Section = FarmTab:AddSection({
    Name = "Misc"
})

FarmTab:AddToggle({
	Name = "Auto Collect Free Gifts",
	Default = false,
	Callback = function(Value)
getgenv().AutoGifts = Value
if AutoGifts == true then
while AutoGifts == true and task.wait() do
for i=1,12 do
local args = {
    [1] = i
}

game:GetService("ReplicatedStorage").Network:FindFirstChild("Redeem Free Gift"):InvokeServer(unpack(args))
end
end
end
	end    
})

FarmTab:AddButton({
	Name = "Auto Collect Shiny Relics",
	Callback = function()
        for i,v in next, Workspace.__THINGS.ShinyRelics:GetChildren() do
            if v:IsA("BasePart") and v.Transparency == 0 then
                RelicClicked(getShiny(v))
            end
        end
  	end 
})

--Eggs Tab
local EggTab = Window:MakeTab({
	Name = "Eggs",
	Icon = "rbxassetid://15057348341",
	PremiumOnly = false
})

local Section = EggTab:AddSection({
	Name = "Select Egg"
})

EggTab:AddDropdown({
    Name = "Select Egg",
    Default = "",
    Options = GetAllEggs(),
    Callback = function(SWASTON)
    getgenv().egg = SWASTON
    end
})

EggTab:AddDropdown({
    Name = "Amount",
    Default = "",
    Options = {'Max',1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99},
    Callback = function(Value)
if type(Value) == "string" then
getgenv().AmountEgg = GetMaxEggOpen()
else
        getgenv().AmountEgg = Value
    end     end
})

EggTab:AddToggle({
    Name = "Auto Hatch Eggs",
    Default = false,
    Callback = function(Value)
        getgenv().AutoHatch = Value
        while AutoHatch == true do task.wait(.1)
            local CatHubRevival = {
                [1] = getgenv().egg,
                [2] = getgenv().AmountEgg
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Eggs_RequestPurchase"):InvokeServer(unpack(CatHubRevival))
if egganim == false then
            game:GetService("VirtualUser"):ClickButton1(Vector2.new(9e9,9e9))
end
        end
    end    
})

local Section = EggTab:AddSection({
    Name = "Settings"
})

local oldfunction 
local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']
    oldfunction = getsenv(Eggs).PlayEggAnimation 

EggTab:AddToggle({
    Name = "Remove Egg Animation",
    Default = false,
    Callback = function(anim)
    getgenv().egganim = anim
if egganim then
local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']
        getsenv(Eggs).PlayEggAnimation = function() return end
else
local Eggs = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Egg Opening Frontend']
        getsenv(Eggs).PlayEggAnimation = oldfunction
end
end
})

--Obby Tab
local ObbyTab = Window:MakeTab({
    Name = "Obby",
    Icon = "rbxassetid://15048277985",
    PremiumOnly = false
})
 
local Section = ObbyTab:AddSection({
    Name = "Auto Obby"
})

ObbyTab:AddDropdown({
	Name = "Select Obby",
	Default = "",
	Options = {"SpawnObby","Minefield","JungleObby", "Atlantis", "PyramidObby","IceObby", "SledRace", "FlowerGarden", "Minecraft", "LuckyBlocks","Fishing","Digsite","AdvancedFishing", "AdvancedDigsite"},
	Callback = function(Value)
		getgenv().SelectObby = Value
	end
})

ObbyTab:AddButton({
	Name = "Teleport To Obby",
	Callback = function()
    ObbyPart = Workspace.__THINGS.Instances:FindFirstChild(SelectObby).Teleports.Enter
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ObbyPart.CFrame
  	end
})

ObbyTab:AddButton({
	Name = "Complete Selected Obby",
	Callback = function()
        if SelectObby == "SpawnObby" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-109.909439, 135.086746, -2893.54028, -0.0185306966, -0.00377289974, -0.999821186, 0.000585422327, 0.999992669, -0.00378438807, 0.9998281, -0.00065544527, -0.0185284615) --Need fix
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.661621, 144.304489, -2885.19507, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        elseif SelectObby == "JungleObby" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2955.17554, 263.149078, -688.842957, -0.998900771, 3.34223878e-05, 0.0468751192, 2.53459912e-05, 0.99999994, -0.000172898159, -0.0468750894, -0.00017151238, -0.998900652) --Need fix
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3304.70874, 186.770706, -498.320892, -0.573439598, 0, -0.819247961, 0, 1, 0, 0.819247961, 0, -0.573439598)
        elseif SelectObby == "Atlantis" then
wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2105.42, 96.5346, -2304.51)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2139.903, 98.214, -2299.464)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2174.48, 89.076, -2287.267)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2206.968, 79.711, -2258.823)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2225.204, 84.146, -2208.523)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2194.407, 84.146, -2168.648)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2152.992, 84.146, -2144.23)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2106.479, 74.359, -2176.607)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2097.818, 74.359, -2233.387)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2083.136, 74.359, -2281.724)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2083.136, 74.359, -2315.669)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2083.136, 74.359, -2348.481)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2105.169, 99.339, -2392.591)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2136.518, 117.098, -2420.89)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2168.291, 117.098, -2432.914)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2208.305, 99.339, -2432.914)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2217.829, 99.339, -2391.808)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2217.829, 104.591, -2318.057)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2188.771, 83.103, -2273.229)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2183.53, 83.103, -2224.655)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2155.252, 83.103, -2208.192)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2125.85, 87.7445, -2208.16)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.896, 97.085, -2247.048)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2088.443, 97.085, -2312.356)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2093.924, 97.085, -2371.736)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2124.808, 109.32, -2417.833)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2172.292, 128.173, -2432.568)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2214.701, 144.418, -2419.105)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2214.701, 130.492, -2344.991)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2169.161, 107.937, -2305.246)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2105.671, 98.214, -2304.623)
        elseif SelectObby == "PyramidObby" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2412.00586, 28.95187, -2867.57202, 0.234556615, 0.000783547643, 0.972102106, 8.18414774e-05, 0.999999583, -0.000825807452, -0.972102463, 0.000273253769, 0.234556407) --Need fix
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2501.14453, 74.5063248, -2856.79126, -0.72219646, 0, 0.691688001, 0, 1, 0, -0.691688001, 0, -0.72219646)
        elseif SelectObby == "IceObby" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4574.78418, 14.1798906, -55.4925079, -0.0419339836, 0.00151115656, 0.999119222, 0.000257532985, 0.999998808, -0.00150167942, -0.999120235, 0.000194334949, -0.041934222)
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4507.86621, 11.0770788, -505.510773, -0.182919979, 0, -0.983127832, 0, 1, 0, 0.983127832, 0, -0.182919979)
        elseif SelectObby == "Minecraft" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1376.77612, -103.834427, -4656.25293, 0.624493182, 0.00135599053, 0.781028986, 0.000263588357, 0.999998033, -0.00194694102, -0.781030059, 0.00142171211, 0.624491572)
            wait(1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1033.98877, 53.9965744, -4660.75, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        end
  	end
})

local FlagTab = Window:MakeTab({
    Name = "Boosts",
    Icon = "rbxassetid://15057347575",
    PremiumOnly = false
})

local Section = FlagTab:AddSection({
    Name = "Flags"
})

FlagTab:AddDropdown({
	Name = "Select Flag For Use",
	Default = "",
	Options = {"Coins Flag","Diamonds Flag","Hasty Flag","Magnet Flag","Rainbow Flag","Strenght Flag","Shiny Flag","Fortune Flag","Exotic Treasure Flag"},
	Callback = function(Value)
		getgenv().SelectFlag = Value
	end
})

FlagTab:AddButton({
	Name = "Use Selected Flag",
	Callback = function()
        for i,v in pairs(lib.Save.Get().Inventory.Misc) do
            local id = v.id
            if id == "Coins Flag" or id == "Diamonds Flag" or id == "Magnet Flag" or id == "Hasty Flag" or id == "Rainbow Flag" or id == "Strenght Flag" or id == "Shiny Flag" or id == "Fortune Flag" or id == "Exotic Treasure Flag" then
           local args = {[1] = SelectFlag,[2] = i}
           game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Flags: Consume"):InvokeServer(unpack(args))
        end
end
  	end
})

local Section = FlagTab:AddSection({
    Name = "Fruits"
})

FlagTab:AddDropdown({
	Name = "Select Fruit For Use",
	Default = "",
	Options = {"Apple","Orange","Banana","Pineapple","Rainbow","Watermelon"},
	Callback = function(Value)
		getgenv().SelectFruit = Value
	end
})

FlagTab:AddDropdown({
	Name = "Select Amount For Use",
	Default = "",
	Options = {1,2,3,4,5,6,7,8,9,10},
	Callback = function(Value)
		getgenv().SelectAm = Value
	end
})

FlagTab:AddButton({
	Name = "Use Selected Fruit",
	Callback = function()
        for i,v in pairs(lib.Save.Get().Inventory.Fruit) do
            local id = v.id
            if id == "Apple" and SelectFruit == "Apple" or id == "Orange" and SelectFruit == "Orange" or id == "Banana" and SelectFruit == "Banana" or id == "Pineapple" and SelectFruit == "Pineapple" or id == "Rainbow" and SelectFruit == "Rainbow" or id == "Watermelon" and SelectFruit == "Watermelon" then
            local args = {[1] = i,[2] = SelectAm}
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Fruits: Consume"):FireServer(unpack(args))
            end
            end
  	end
})

local Section = FlagTab:AddSection({
    Name = "Boosts"
})

FlagTab:AddDropdown({
	Name = "Select Boost For Use",
	Default = "",
	Options = {"SqueakyToy","ChristmasCookie","HotCocoa","MiniLucklyBlock","PartyBox","TNT","TNT Crate","ToyBall","ToyBone"},
	Callback = function(Value)
		getgenv().SelectToy = Value
	end
})

FlagTab:AddButton({
	Name = "Use Selected Boost",
	Callback = function()
    local test = game:GetService("ReplicatedStorage"):WaitForChild("Network")
    if SelectToy == "SqueakyToy" then
        test:WaitForChild("SqueakyToy_Consume"):InvokeServer()
    elseif SelecToy == "ChristmasCookie" then
        test:WaitForChild("ChristmasCookie_Consume"):InvokeServer()
    elseif SelecToy == "HotCocoa" then
        test:WaitForChild("HotCocoa_Consume"):InvokeServer()
    elseif SelecToy == "MiniLucklyBlock" then
        test:WaitForChild("MiniLucklyBlock_Consume"):InvokeServer()
    elseif SelecToy == "PartyBox" then
        test:WaitForChild("PartyBox_Consume"):InvokeServer()
    elseif SelecToy == "TNT" then
        test:WaitForChild("TNT_Consume"):InvokeServer()
    elseif SelecToy == "TNT Crate" then
        test:WaitForChild("TNT_Crate_Consume"):InvokeServer()
    elseif SelecToy == "ToyBall" then
        test:WaitForChild("ToyBall_Consume"):InvokeServer()
    elseif SelecToy == "ToyBone" then
        test:WaitForChild("ToyBone_Consume"):InvokeServer()
       end
  	end
})

local Section = FlagTab:AddSection({
    Name = "Gifts"
})

FlagTab:AddDropdown({
	Name = "Select Gift For Open",
	Default = "",
	Options = {"Gift Bag","Seed Bag","Large Gift Bag"},
	Callback = function(Value)
		getgenv().SelectGift = Value
	end
})

FlagTab:AddToggle({
	Name = "Auto Open Selected Gift",
	Default = false,
	Callback = function(Value)
		getgenv().AutoOpenSelGift = Value
        if AutoOpenSelGift == true then
            while AutoOpenSelGift == true and task.wait() do
                local args = {[1] = SelectGift}
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(unpack(args))      
    end
        end
	end
})

FlagTab:AddToggle({
	Name = "Auto Open All Gifts",
	Default = false,
	Callback = function(Value)
		getgenv().AutoOpenAllGifts = Value
        if AutoOpenAllGifts == true then
            while AutoOpenAllGifts == true and task.wait() do
                for i,v in pairs(lib.Save.Get().Inventory.Misc) do
                local id = v.id
                if id == "Gift Bag" or id == "Seed Bag" or id == "Large Gift Bag" then
                    local args = {[1] = id}
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(unpack(args))      
                end
            end
    end
        end
	end
})

FlagTab:AddToggle({
	Name = "Auto Open All Bundles",
	Default = false,
	Callback = function(Value)
		getgenv().AutoOpenBundles = Value
        if AutoOpenBundles == true then
            while AutoOpenBundles == true and task.wait() do
                for i,v in pairs(lib.Save.Get().Inventory.Misc) do
                    local id = v.id
                    if id == "Enchant Bundle" or id == "Flag Bundle" or id == "Fruit Bundle" or id == "Large Enchant Bundle" or id == "Large Potion Bundle" or id == "Potion Bundle" or id == "Toy Bundle" then
                    local args = {[1] = id}
                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("GiftBag_Open"):InvokeServer(unpack(args))
            end
        end
    end
        end
	end
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://15048277045",
    PremiumOnly = false
})

local Section = MiscTab:AddSection({
    Name = "Visual Pets"
})

MiscTab:AddTextbox({
	Name = "Enter Your Pet",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		getgenv().PetY = Value
	end
})

MiscTab:AddTextbox({
	Name = "Enter Visual Pet",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		getgenv().PetV = Value
	end
})

MiscTab:AddButton({
	Name = "Change Pet",
	Callback = function()
        local pet = getgenv().PetY
        local pet1 = getgenv().PetV

        for i,v in pairs(lib.Directory.Pets[pet]) do
            lib.Directory.Pets[pet][i] = nil
        end
        for i,v in pairs(lib.Directory.Pets[pet1]) do
            lib.Directory.Pets[pet][i] = v
        end
  	end
})

local Section = MiscTab:AddSection({
    Name = "Keys"
})

MiscTab:AddToggle({
	Name = "Auto Combine All Keys",
	Default = false,
	Callback = function(Value)
		getgenv().AutoCombineK = Value
        if AutoCombineK == true then
            while AutoCombineK == true and task.wait() do
                local args = {[1] = 1}
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("TechKey_Combine"):InvokeServer(unpack(args))
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("CrystalKey_Combine"):InvokeServer(unpack(args))
                game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("SecretKey_Combine"):InvokeServer(unpack(args))
    end
        end
	end
})

local Section = MiscTab:AddSection({
    Name = "Wheels"
})

MiscTab:AddToggle({
	Name = "Auto Use Spinny Wheel",
	Default = false,
	Callback = function(Value)
		getgenv().AutoWheel = Value
        if AutoWheel == true then
            while AutoWheel == true and wait(1) do
            local args = {[1] = "StarterWheel"}   
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Spinny Wheel: Request Spin"):InvokeServer(unpack(args))
    end
        end
	end
})

local Section = MiscTab:AddSection({
    Name = "Merchants"
})

MiscTab:AddDropdown({
	Name = "Select Merchant",
	Default = "",
	Options = {"RegularMerchant","AdvancedMerchant","GardenMerchant","SnowMerchant"},
	Callback = function(Value)
		getgenv().MerchantSel = Value
	end    
})

MiscTab:AddToggle({
	Name = "Auto Buy Selected Merchant",
	Default = false,
	Callback = function(Value)
		getgenv().MerchBuy = Value
        if MerchBuy == true then
            while MerchBuy == true and task.wait() do
                for i=1,6 do
                local args = {
                    [1] = MerchantSel,
                    [2] = i
                }
                game:GetService("ReplicatedStorage").Network.Merchant_RequestPurchase:InvokeServer(unpack(args)) 
        end
    end
        end
	end
})

local Section = MiscTab:AddSection({
    Name = "Vending Machines"
})

MiscTab:AddDropdown({
	Name = "Select Vending Machine",
	Default = "",
	Options = {"PotionVendingMachine1","EnchantVendingMachine1","FruitVendingMachine1","FruitVendingMachine2","PotionVendingMachine2","EnchantVendingMachine2"},
	Callback = function(Value)
		getgenv().VendingSel = Value
	end    
})

MiscTab:AddDropdown({
	Name = "Select Amount For Buy",
	Default = "",
	Options = {1,2,3,4},
	Callback = function(Value)
		getgenv().BuyAm = Value
	end    
})

MiscTab:AddToggle({
	Name = "Auto Buy Selected Machine",
	Default = false,
	Callback = function(Value)
		getgenv().VendingBuyAuto = Value
        if VendingBuyAuto == true then
            while VendingBuyAuto == true and task.wait() do
                local args = {[1] = VendingSel,[2] = BuyAm}
                game:GetService("ReplicatedStorage").Network.VendingMachines_Purchase:InvokeServer(unpack(args))
    end
        end
	end
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://15048278534",
    PremiumOnly = false
})
 
local Section = CreditsTab:AddSection({
    Name = "Credits Information"
})

CreditsTab:AddLabel("Library | Orion")

CreditsTab:AddLabel("Creator Information:")

CreditsTab:AddDropdown({
	Name = "Creators",
	Default = "",
	Options = {"Senpaigmx"},
	Callback = function()
	end    
})

CreditsTab:AddButton({
	Name = "Disable Script",
	Callback = function()
        OrionLib:Destroy()
  	end
})