local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/LankyBoxSimulatorScript/main/LankyBoxSimulator.lua')))()
local w = library:CreateWindow("LankyBox Simulator")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("AutoRebirth")
local g = w:CreateFolder("Teleport")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

b:Toggle("Auto Sell",function(bool)
    shared.toggle = bool
    autosell = bool
end)

b:Toggle("Collect Hearts",function(bool)
    shared.toggle = bool
    heartcollect = bool
end)

e:Slider("WalkSpeed",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

e:Slider("JumpPower",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discrod Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)


while wait() do

    spawn(function()
        if autosell == true then
            game:GetService("ReplicatedStorage").Events.SellHearts:InvokeServer()
            wait(0.2)
        end
    end)

    spawn(function()
        if heartcollect == true then
            for i,v in pairs(game:GetService("Workspace").Hearts:GetChildren()) do
                if not heartcollect then break end
                if v.Name == "RedHeart" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.Position)
                    game:GetService("ReplicatedStorage").Events.CollectHeart:InvokeServer(game:GetService("Players").LocalPlayer.Hearts.RedHeart)
                elseif v.Name == "BlueHeart" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.Position)
                    game:GetService("ReplicatedStorage").Events.CollectHeart:InvokeServer(game:GetService("Players").LocalPlayer.Hearts.BlueHeart)
                elseif v.Name == "GreenHeart" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.CFrame.Position)
                    game:GetService("ReplicatedStorage").Events.CollectHeart:InvokeServer(game:GetService("Players").LocalPlayer.Hearts.GreenHeart)
                end
            end
        end
    end)
    
    spawn(function()
        if AntiAfk == true then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end)


end