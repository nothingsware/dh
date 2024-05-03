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
    Name = "Aimlock (t)",
    Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local CurrentCamera = game.Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local MarkerFolder = Instance.new("Folder", game.CoreGui)
MarkerFolder.Name = "Markers"

local lockedPlayer = nil

local function CreateMarker(parent, adornee, color, size, size2)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = adornee
    billboardGui.Size = UDim2.new(size, size2, size, size2)
    billboardGui.AlwaysOnTop = true
    
    local frame = Instance.new("Frame", billboardGui)
    frame.Size = UDim2.new(4, 0, 4, 0)
    frame.BackgroundTransparency = 0.1
    frame.BackgroundColor3 = color
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(50, 50)
    
    billboardGui.Parent = parent
    
    return billboardGui
end

local function GetClosestPlayerToCursor()
    local Mouse = UserInputService:GetMouseLocation()
    local closestPlayer
    local shortestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            local pos = CurrentCamera:WorldToViewportPoint(player.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = player
                shortestDistance = magnitude
            end
        end
    end
    
    return closestPlayer
end

local function UpdateMarkers()
    for _, marker in ipairs(MarkerFolder:GetChildren()) do
        if Players:FindFirstChild(marker.Name) then
            local player = Players[marker.Name]
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local character = player.Character
                local pos = CurrentCamera:WorldToViewportPoint(character.HumanoidRootPart.Position)
                marker.Adornee = character.HumanoidRootPart
            else
                marker:Destroy()
            end
        else
            marker:Destroy()
        end
    end
end

local function Main()
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.T then
            if not lockedPlayer then
                -- Lock onto the closest player
                lockedPlayer = GetClosestPlayerToCursor()
                if lockedPlayer then
                    local marker = CreateMarker(MarkerFolder, lockedPlayer.Character.HumanoidRootPart, Color3.new(1, 1, 1), 0.1, 0)
                    marker.Name = lockedPlayer.Name
                end
            else
                -- Unlock the currently locked player
                lockedPlayer = nil
                for _, marker in ipairs(MarkerFolder:GetChildren()) do
                    marker:Destroy()
                end
            end
        end
    end)
end

RunService.Stepped:Connect(UpdateMarkers)
Main()

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
	Name = "Hide User(Mask Needed)",
	Callback = function()
        if game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
            game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChildWhichIsA("Model"):Destroy()
            game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChild('Handle'):Destroy()
        end
    end
})
Main:AddButton({
    Name = "Force Reset",
    Callback = function()
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v:Destroy()
            end
        end
    end
})

Main:AddButton({
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

Main:AddButton({
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

Main:AddButton({
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

Main:AddButton({
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

Main:AddButton({
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


local Others = Window:MakeTab({
	Name = "Others",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
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
    Name = "Muscle Autofarm (reset when done)", 
    Callback = function()
        while true do
            wait()
            if not game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
                wait()
                local k = game.Workspace.Ignored.Shop["[HeavyWeights] - $250"]
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
                    wait(.2)
                    fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
                end
            end
            if not game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
                tool = game.Players.LocalPlayer.Backpack:WaitForChild("[HeavyWeights]")
                tool.Parent = game.Players.LocalPlayer.Character
            end
            game:GetService("VirtualUser"):ClickButton1(Vector2.new())
            local d = Vector3.new(-1006.99, -51.1542, -1014.33)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
        end
    end
})

Others:AddButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
})

local Credits = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Credits:AddParagraph("Solara Hub","Solara Hub is made by .bluuu. and brennen_n there discord, they have decided to make this as a script hub to make it easier for people to find scripts that are functional using solara, all scripts made will work and will be checked and updated every day! ")

OrionLib:MakeNotification({
    Name = "Da Hood",
    Content = "Welcome, this is a script for dh enjoy and check out the credits tab!",
    Image = "rbxassetid://4483345998",
    Time = 15
})
