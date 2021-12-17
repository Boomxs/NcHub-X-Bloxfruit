local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Boomxs/NcHub/main/B1.lua"))()
local venyx = library.new("NC HUB X BloxFruit", 5012544693)

local Tab1 = venyx:addPage("General", 5012544693)
local Tab2 = venyx:addPage("Teleport", 5012544693)
local Tab3 = venyx:addPage("Cadits", 5012544693)
local Section1 = Tab2:addSection("Teleport Player")
local Section3 = Tab2:addSection("Teleport")
local Section7 = Tab1:addSection("AutoFarm")
local Section2 = Tab1:addSection("Speed Option")
local Section4 = Tab1:addSection("Jump Option")
local Section5 = Tab1:addSection("Other Option")
local Section6 = Tab3:addSection("This Script Create By BooomXs Or Nc_Dev")

players = {}
 
for i,v in pairs(game:GetService("Players"):GetChildren()) do
   table.insert(players,v.Name)
end
 
Section1:addDropdown("Select Player", players, function(Tpp)
    Select = Tpp
end)

Section5:addKeybind("Ui Visible", Enum.KeyCode.RightControl, function()
    venyx:toggle()
    end, function()
end)
 
Section1:addButton("Refresh", function()
    table.clear(players)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
       table.insert(players,v.Name)
    end
end)

Section1:addButton("Teleport", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Select].Character.HumanoidRootPart.CFrame
end)

Section2:addSlider("Speed Option", 0, 16, 500, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section2:addButton("Reset Speed", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

Section4:addSlider("Jump Option", 0, 40, 500, function(s)     
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s  
end)
Section4:addButton("Reset Speed", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 40
end)


Section3:addButton("7-11", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-956.445251, 46.2777214, -145.111298, 0.24723056, -2.30793629e-09, 0.968956709, -2.58374167e-09, 1, 3.04112269e-09, -0.968956709, -3.25539218e-09, 0.24723056)
end)

Section3:addButton("Toy Store", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-902.259216, 46.90308, -465.079803, 0.0659450144, -3.81973599e-08, 0.997823238, 3.34349544e-08, 1, 3.60710111e-08, -0.997823238, 3.09834718e-08, 0.0659450144)
end)

Section3:addButton("Store", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-835.783203, 46.215332, -52.7868538, 0.999684989, 7.41957749e-08, 0.0250990447, -7.54916272e-08, 1, 5.0682182e-08, -0.0250990447, -5.25609849e-08, 0.999684989)
end)

Section3:addButton("NoodleTower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-856.40649414062, 46.21533203125, -280.29629516602)
end)

_G.AutoFarm_Level = false
_G.FastAttack = false

Weapons = {}

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weapons,v.Name)
end

Section7:addDropdown("Select Weapons", Weapons, function(Wps)
    local A_1 = "weaponChange"
    local A_2 = Wps
    local Event = game:GetService("ReplicatedStorage").RigControllerEvent
    Event:FireServer(A_1, A_2)
end)

Section7:addButton("Refresh", function()
    table.clear(Weapons)
    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
       table.insert(Weapons,v.Name)
    end
end)

function checklevel()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Level == 1 or Level <= 9 then
        MON = "Bandit [Lv. 5]"
        QUESTTITLE = "Bandit"
        QUESTPOS = CFrame.new(1060.0158691406, 16.424287796021, 1547.9769287109)
        MONPOS = CFrame.new(1148.8698730469, 16.432844161987, 1630.5396728516)
        QUESTNAME = "BanditQuest1"
        QUESTNUMBER = 1
        SPAWNPOINT = "Default"
        SPAWNPOINTPOS = CFrame.new(973.96197509766, 16.273551940918, 1413.2775878906)
    end
end

Method = CFrame.new(0,25,0)
 
spawn(function()
   while wait(3) do
       if Methodnow == 1 then
        Methodnow = 2
        Method = CFrame.new(0,25,0)
        else
        Methodnow = 1
        Method = CFrame.new(0,0,25)
       end
    end
end)
 
spawn(function()
   while wait() do
       if _G.WARP then
           game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end
    end
end)
 
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and _G.AutoFarm_Level then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)
 
 
spawn(function()
    while wait() do
        if _G.AutoFarm_Level then
            pcall(function()
                checklevel()
    
                if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,QUESTTITLE) then
                    local args = {
                        [1] = "AbandonQuest"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    
                    if game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value == SPAWNPOINT then
                        local args = {
                            [1] = "SetTeam",
                            [2] = "Pirates"
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        wait(0.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = QUESTPOS
                        wait(0.8)
                            local args = {
                                [1] = "StartQuest",
                                [2] = QUESTNAME,
                                [3] = QUESTNUMBER
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        wait(0.8)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = MONPOS
                    else
                        _G.WARP = true
                        repeat 
                            wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SPAWNPOINTPOS
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                        until game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value == SPAWNPOINT or _G.AutoFarm_Level == false
                        _G.WARP = false
                    end
                end
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == MON and v2.Name == MON then
                            v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            v2.HumanoidRootPart.CanCollide = false
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * Method
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end)
        end
    end
end)
 
 
 
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if _G.FastAttack then
                local Combat = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                local Cemara = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
                Cemara.CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}
                Combat.activeController.timeToNextAttack = 0
                Combat.activeController.hitboxMagnitude = 120
                Combat.activeController.increment = 3
            end
        end)
    end) 
end)
 
 
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if _G.AutoFarm_Level then
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
            end
        end)
    end) 
end)
