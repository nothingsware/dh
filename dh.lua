local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Da Hood | Solara Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "SH"})

game.StarterGui:SetCore("SendNotification", {Title = "Solara Hub", Text = "Solara Hub was founded by .bluuu. and brennen_n in 2024", Icon = "rbxassetid://505845268", Duration = 10, Button1 = "Alright We Winning!"})
game.StarterGui:SetCore("SendNotification", {Title = "Solara Hub", Text = "Made by brennen_n and .bluuu.", Icon = "rbxassetid://505845268", Duration = 9, Button1 = "Alright They Are Kings!"})
local Main = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Main:AddButton({
    Name = "Monster Human(N)",
    Callback = function()
        superhuman = false
    plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)				
        if key == "n" and superhuman == false then
            superhuman = true
            game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
            game.Players.LocalPlayer.Character.Humz.WalkSpeed = 100
            game.Players.LocalPlayer.Character.Humz.JumpPower = 200
        elseif key == "n" and superhuman == true then
            superhuman = false
            game.Players.LocalPlayer.Character.Humz.WalkSpeed = 16
            game.Players.LocalPlayer.Character.Humz.JumpPower = 50
            game.Players.LocalPlayer.Character.Humz.Name = "Humanoid"
        end
     end)   
end
})



Main:AddButton({
    Name = "Split Grenade",
    Callback = function()
        local plr = game.Players.LocalPlayer
    local lastpos = plr.Character.HumanoidRootPart.CFrame

    repeat wait()
        plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
        fireclickdetector(game.Workspace.Ignored.Shop["[Grenade] - $700"].ClickDetector)
    until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
    plr.Character.HumanoidRootPart.CFrame = lastpos

    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        wait(0.05)
        spawn(function()
            if v.Name == "[Grenade]" then
                v.Parent = plr.Character; v:Activate(); wait(0.1); v:Deactivate(); wait(0.1); v:Activate()
            end
        end)
    end
end
})

Main:AddButton({
    Name = "Bike Fly",
    Callback = function()
        local speed = 20
        local old
        local Plr = game.Players.LocalPlayer
        local wheels = {}
        local control = {q=false,e=false,w=false,a=false,s=false,d=false}
        local Mouse = Plr:GetMouse()
    
        Mouse.KeyDown:connect(function(KEY)
            local key = KEY:lower()
            if control[key] ~= nil then
                control[key]=true
            end
        end)
    
        Mouse.KeyUp:connect(function(KEY)
            local key = KEY:lower()
            if control[key] ~= nil then
                control[key]=false
            end
        end)
    
        while game.RunService.Stepped:wait() do
            local seat = (Plr.Character or Plr.CharacterAdded:wait()):WaitForChild("Humanoid").SeatPart
            if Plr.PlayerGui:FindFirstChild("MainScreenGui") and Plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and Plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
                Plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
            else
                local c = Plr.PlayerGui.MainScreenGui.Bar.HP
                local g = c:Clone()
                g.Name = "Speed"
                g.Position = UDim2.new(0.5, 0, 1, -120)
                g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
                g.Picture.Image.Image = "rbxassetid://181035717"
                g.TextLabel.Text = "Speed"
                g.Parent = c.Parent
            end
            if seat ~= nil and seat:IsDescendantOf(game.Workspace.Vehicles) then
                if seat ~= old then
                    if old then
                        old.Vel:Destroy()
                        old.Gyro:Destroy()
                    end
                    old = seat
                    for i = 1, 2 do
                        if wheels[i] then
                            wheels[i][2].Parent = wheels[i][1]
                        end
                        local wheel = seat.Parent.Wheel
                        wheels[i] = {seat.Parent, wheel}
                        wheel:remove()
                    end
                    local gyro = Instance.new("BodyGyro", seat)
                    gyro.Name = "Gyro"
                    local pos = Instance.new("BodyVelocity", seat)
                    pos.Name = "Vel"
                    gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    pos.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                else 
                    seat.Gyro.cframe = workspace.CurrentCamera.CoordinateFrame
                    local vel = CFrame.new(0, 0, 0)
                    if control.w then
                        vel = vel * CFrame.new(0, 0, -speed)
                    end
                    if control.s then
                        vel = vel * CFrame.new(0, 0, speed)
                    end
                    if control.a then
                        vel = vel * CFrame.new(-speed, 0, 0)
                    end
                    if control.d then
                        vel = vel * CFrame.new(speed, 0, 0)
                    end
                    seat.Vel.Velocity = (seat.CFrame*vel).p - seat.CFrame.p
                end
            end
            if control.e and speed<200 then
                speed = speed + 1
            end
            if control.q and speed > 0 then
                speed = speed - 1
            end
        end
    end
    })


Main:AddButton({
	Name = "Fly (X)",
	Callback = function()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
    
        localplayer = plr
    
        if workspace:FindFirstChild("Core") then
            workspace.Core:Destroy()
        end
    
        local Core = Instance.new("Part")
        Core.Name = "Core"
        Core.Size = Vector3.new(0.05, 0.05, 0.05)
    
        spawn(function()
            Core.Parent = workspace
            local Weld = Instance.new("Weld", Core)
            Weld.Part0 = Core
            Weld.Part1 = localplayer.Character.LowerTorso
            Weld.C0 = CFrame.new(0, 0, 0)
        end)
    
        workspace:WaitForChild("Core")
    
        local torso = workspace.Core
        flying = true
        local speed=7.5
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.cframe = torso.CFrame
            repeat
                wait()
                localplayer.Character.Humanoid.PlatformStand=true
                local new=gyro.cframe - gyro.cframe.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=7.5
                end
                if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+0
                end
                if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+0
                end
                if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+0
                end
                if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+0
                end
                if speed>3.2 then
                    speed=7.5
                end
                pos.position=new.p
                if keys.w then
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
                elseif keys.s then
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
                else
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame
                end
            until flying == false
            if gyro then gyro:Destroy() end
            if pos then pos:Destroy() end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=7.5
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            elseif key=="x" then
                if flying==true then
                    flying=false
                else
                    flying=true
                    start()
                end
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start() 		
    end
})

Main:AddButton({
	Name = "Anti-lock(z)",
	Callback = function()
        local Toggled = false
local KeyCode = Enum.KeyCode.Z  
 

local function AntiAim()
    local character = game.Players.LocalPlayer.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChild("Humanoid")
    if rootPart and humanoid then
        local oldVelocity = rootPart.Velocity
        rootPart.Velocity = Vector3.new(oldVelocity.X, -70, oldVelocity.Z)
        humanoid.HipHeight = 4.14
    end
end
 

local function ToggleAntiAim()
    if Toggled then
        Toggled = false
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.HipHeight = 1.85
        end
    else
        Toggled = true
        while Toggled do
            AntiAim()
            task.wait()  
        end
    end
end
 

 game:GetService('UserInputService').InputBegan:Connect(function(input)
    if input.KeyCode == KeyCode and not game:GetService('UserInputService'):GetFocusedTextBox() then
        ToggleAntiAim()
       end
    end)
end
})


------------------------------------------------------------------------------------------------------------------------------------
local Others = Window:MakeTab({
	Name = "Others",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Others:AddButton({
    Name = "Force Reset",
    Callback = function()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v:Destroy()
            end
        end
    end
})

Others:AddButton({
	Name = "Hide User(Mask Needed)",
	Callback = function()
        if game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
            game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChildWhichIsA("Model"):Destroy()
            game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChild('Handle'):Destroy()
        end
    end
})

Others:AddButton({
    Name = "Korblox",
    Callback = function()
        local ply = game.Players.LocalPlayer
        local chr = ply.Character
        chr.RightLowerLeg.MeshId = "902942093"
        chr.RightLowerLeg.Transparency = "1"
        chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
        chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
        chr.RightFoot.MeshId = "902942089"
        chr.RightFoot.Transparency = "1"
    end
})

Others:AddButton({
    Name = "Headless",
    Callback = function()
        game.Players.LocalPlayer.Character.Head.Transparency = 1
        game.Players.LocalPlayer.Character.Head.Transparency = 1
        for i, v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
            if (v:IsA("Decal")) then
                v.Transparency = 1
            end
        end
    end
})

Others:AddButton({
    Name = "UnJail",
    Callback = function()
        if game:GetService("Players").LocalPlayer.DataFolder.Currency.Value >= 125 then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-270.94, 20.327, -242.38)
            wait()
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
            wait(.1)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Key] - $125"].ClickDetector)
            repeat
                wait()
            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Key]")
            local Hum = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if Hum.Health > 0 then
                key1 = game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Key]")
                if key1 then
                    Hum:EquipTool(key1)
                    for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                        if v:isA("Tool") then
                            game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(key1)
                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-485.668, 23.631, -285.169)
                            v:Activate()
                        end
                    end
                end
            end
        end
    end
})

Others:AddButton({
    Name = "Anti-Bag",
    Callback = function()
        local LP = game.Players.LocalPlayer;

        for i, v in ipairs(LP.Character:GetDescendants()) do
            if v.Name == "Christmas_Sock" then
                v:Destroy()
            end
        end

        LP.Character.ChildAdded:Connect(function()
            wait(0.3)
            for i, v in ipairs(LP.Character:GetDescendants()) do
                if v.Name == "Christmas_Sock" then
                    v:Destroy()
                end
            end
        end)
    end
})

Others:AddButton({
    Name = "Un-Grab",
    Callback = function()
        local player = game.Players.LocalPlayer
        local GC = game:GetService("Workspace").Players:WaitForChild(player.Name):FindFirstChild("GRABBING_CONSTRAINT")
        if GC then
            GC:Destroy()
            wait(0.04)
            player.character.Humanoid.Sit = true
            wait(0.04)
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(3)
        end
    end
})

Others:AddToggle({
    Name = "Anti-Slow",
    Default = false,
    Callback = function(Value)
        if gh == true then
            game:GetService('RunService'):BindToRenderStep("Anti-Slow", 0 , function()
                if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed"):Destroy() end
                if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk"):Destroy() end
                if game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoJumping") then game.Players.LocalPlayer.Character.BodyEffects.Movement:FindFirstChild("NoJumping"):Destroy() end
                if game.Players.LocalPlayer.Character.BodyEffects.Reload.Value == true then game.Players.LocalPlayer.Character.BodyEffects.Reload.Value = false end
            end)
        elseif gh == false then
            game:GetService('RunService'):UnbindFromRenderStep("Anti-Slow")
        end
    end
})

Others:AddButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})


Others:AddButton({
    Name = "Shotgun (auto farm)",
    Callback = function()
        if game.Players.LocalPlayer.Character.Animate:FindFirstChild("idle") then
            game.Players.LocalPlayer.Character.Animate.idle:Destroy()
        end
        local me = game:service'Players'.LocalPlayer
        local plr = game.Players.LocalPlayer
        local savedarmourpos = plr.Character.HumanoidRootPart.Position
        local toolname = "[Shotgun] - $1250"
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(game.Workspace.Ignored.Shop[toolname].Head.Position)
        wait(.1)
        fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
        wait(.1)
        fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
        wait(.1)
        fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
        wait(.1)
        fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
        wait(.1)
        fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
        wait(.1)
        fireclickdetector(game.Workspace.Ignored.Shop[toolname].ClickDetector)
        wait(.1)
        me.Character.Humanoid:EquipTool(me.Backpack:FindFirstChild("[Shotgun]"))
        wait(0.001)
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedarmourpos)
        function bypass()
            local oh1 = CFrame.new(-346.434296, 52.5954704, 446.756989)
            local oh2 = game:GetService("Players")
            local oh3 = oh2.LocalPlayer.Character.HumanoidRootPart
    
    
            oh3.CFrame = oh1
            wait(1.5)
        end
        repeat
            wait()
        until game:IsLoaded()
    
        if workspace.Players[game.Players.LocalPlayer.Name]:FindFirstChild("[Shotgun]") then
            workspace.Players[game.Players.LocalPlayer.Name]:FindFirstChild("[Shotgun]").Name = "[Drxco]"
    
            function Buy()
                fireclickdetector(workspace.Ignored.Shop["20 [Shotgun Ammo] - $60"].ClickDetector)
                fireclickdetector(workspace.Ignored.Shop["20 [Shotgun Ammo] - $60"].ClickDetector)
            end
    
            local ATM = "nil"
            local idk = false
            local dineros = false
            local lol = 0
    
            function GetATM()
                bypass()
                for i, v in pairs(workspace.Cashiers:GetChildren()) do
                    if v:WaitForChild("Humanoid").Health > 0 then
                        local cf = v.Open.CFrame
                        local lv = cf.lookVector
                        game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = cf + (lv * Vector3.new(0, 0, -2))
                        game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePos", v.Open.Position)
                        return v
                    end
                end
            end
    
            function GETMONEY()
                for i, v in pairs(workspace.Ignored.Drop:GetChildren()) do
                    if v.Name == "MoneyDrop" and (workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.Position - v.Position).Magnitude < 25
                    then
                        dineros = true
                        fireclickdetector(v.ClickDetector)
                        wait(0.7)
                        dineros = false
                    end
                end
            end
    
            ATM = GetATM()
    
            function reload(name, gun)
                local XD1 = "Reload"
                local XD2 = game:GetService("Workspace").Players[name][gun]
                local Event = game:GetService("ReplicatedStorage").MainEvent
                Event:FireServer(XD1, XD2)
            end
            game:GetService("RunService").Heartbeat:Connect(
            function()
                GETMONEY()
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                if lol == 0 and dineros == false then
                    if game.Players.LocalPlayer.DataFolder.Inventory["[Shotgun]"].Value == "0" and idk == false then
                        lol = 10
                        idk = true
                        local part = workspace.Ignored.Shop["20 [Shotgun Ammo] - $60"].Head
                        game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
                            CFrame.new(part.CFrame.X, part.CFrame.Y + 4, part.CFrame.Z)
                        game.workspace.Players[game.Players.LocalPlayer.Name]["[Drxco]"].Parent =
                            game.Players.LocalPlayer.Backpack
                        wait(2)
                        for i = 1, 10 do
                            game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
                                CFrame.new(
                                    part.CFrame.X + math.random(1, 2),
                                    part.CFrame.Y + math.random(1, 2),
                                    part.CFrame.Z + math.random(1, 2)
                                )
                            Buy()
                            wait(0.5)
                        end
                        game.Players.LocalPlayer.Backpack["[Drxco]"].Parent =
                            game.workspace.Players[game.Players.LocalPlayer.Name]
                        lol = 0
                        idk = false
                        local cf = ATM.Open.CFrame
                        local lv = cf.lookVector
                        game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
                            cf + (lv * Vector3.new(0, 0, -2))
                    end
                    if
                        game.workspace.Players[game.Players.LocalPlayer.Name]:WaitForChild("[Drxco]").Ammo.Value == 4 and
                            idk == false
                    then
                        idk = true
                        reload(game.Players.LocalPlayer.Name, "[Drxco]")
                        wait(0.5)
                        idk = false
                    else
                        for i, v in pairs(workspace.Cashiers:GetChildren()) do
                            if v:WaitForChild("Humanoid").Health > 0 then
                                if idk == false then
                                    if ATM.Humanoid.Health > 0 then
                                        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0, 0))
                                        local cf = ATM.Open.CFrame
                                        local lv = cf.lookVector
                                        game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
                                            cf + (lv * Vector3.new(0, 0, -2))
                                    end
                                end
                            end
                        end
                    end
                    for i, v in pairs(workspace.Cashiers:GetChildren()) do
                        if v:WaitForChild("Humanoid").Health > 0 then
                            if ATM.Humanoid.Health < 0 and idk == false then
                                lol = 10
                                wait(0.1)
                                if idk == false then
                                    local cf = ATM.Open.CFrame
                                    local lv = cf.lookVector
                                    game.workspace.Players[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame =
                                        cf + (lv * Vector3.new(0, 0, -2))
    
                                    ATM = GetATM()
                                end
                                lol = 0
                            end
                        end
                    end
                end
            end)
        end
    end
})
-------------------------------------------------------------------------------------------------------------------------
local Teleports = Window:MakeTab({
    Name = "Teleports",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})



Teleports:AddButton({
    Name = "Food Shop [Bank]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-335.141, 23.7129, -298.029)
    end
})

Teleports:AddButton({
    Name = "Food Shop [Uphill]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(298.477, 49.3129, -615.231)
    end
})

Teleports:AddButton({
    Name = "Gun Shop [Uphill]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.925, 48.1008, -621.23)
    end
})

Teleports:AddButton({
    Name = "Gun Shop [Armor]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-580.27, 8.34504, -734.832)
    end
})

Teleports:AddButton({
    Name = "Bank",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-438.689, 39.0127, -284.731)
    end
})

local ESP = Window:MakeTab({
    Name = "Esp",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ESP:AddButton({
    Name = "ESP Boxes",
    Callback = function()
        local Workspace = game:GetService("Workspace")
        local Players = game:GetService("Players")
        
        for _, Check1 in ipairs(game:GetDescendants()) do
            if Check1:IsA("Players") then
                Players = Check1
            end
        end
        
        local NoneTeam = Instance.new("Model", Workspace)
        NoneTeam.Name = "NoneTeam"
        local Highlight = Instance.new("Highlight", NoneTeam)
        Highlight.FillTransparency = 1
        
        local function abcdefg()
            for _, Player in ipairs(Players:GetChildren()) do
                for _, Character in ipairs(Workspace:GetDescendants()) do
                    if Character:IsA("Model") and Character.Name == Player.Name then
                        Character.Parent = NoneTeam
                    end
                end
            end
        end
        
        Workspace.ChildAdded:Connect(function(Child)
            wait(0.1)
            for _, Player in ipairs(Players:GetChildren()) do
                if Child:IsA("Model") and Child.Name == Player.Name then
                    warn("Joined: "..Child.Name)
                    abcdefg()
                end
            end
        end)
        
        abcdefg()
        
        
    end
})


local Credits = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Credits:AddParagraph("Solara Hub","Solara Hub is made by .bluuu. and brennen_n there discord, they have decided to make this as a script hub to make it easier for people to find scripts that are functional using solara, all scripts made will work and will be checked and updated every day! ")
