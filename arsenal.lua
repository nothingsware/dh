local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Arsenal | Solara Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "arsenal"})

game.StarterGui:SetCore("SendNotification", {Title = "Solara Hub", Text = "Solara Hub was founded by .bluuu. and brennen_n in 2024", Icon = "rbxassetid://505845268", Duration = 10, Button1 = "Alright We Winning!"})
game.StarterGui:SetCore("SendNotification", {Title = "Solara Hub", Text = "Made by brennen_n and .bluuu.", Icon = "rbxassetid://505845268", Duration = 9, Button1 = "Alright They Are Kings!"})

local Tab = Window:MakeTab({
	Name = "HitBox Extender",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "HitBox Extender",
	Callback = function()
      		-- Gui to Lua
-- Version: 3.2

-- Instances:

local HBE = Instance.new("ScreenGui")
local HBE_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local MadeBy = Instance.new("TextLabel")
local HitBoxExtender = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local PlayersInServer = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local MadeBy_2 = Instance.new("TextLabel")

--Properties:

HBE.Name = "HBE"
HBE.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
HBE.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

HBE_2.Name = "HBE"
HBE_2.Parent = HBE
HBE_2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
HBE_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
HBE_2.BorderSizePixel = 0
HBE_2.Position = UDim2.new(0.395617783, 0, 0.307328612, 0)
HBE_2.Size = UDim2.new(0, 343, 0, 326)

UICorner.Parent = HBE_2

MadeBy.Name = "Made By"
MadeBy.Parent = HBE_2
MadeBy.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MadeBy.BorderColor3 = Color3.fromRGB(0, 0, 0)
MadeBy.BorderSizePixel = 0
MadeBy.Size = UDim2.new(0, 343, 0, 47)
MadeBy.Font = Enum.Font.Bangers
MadeBy.Text = "Arsenal HB Extender Made By .bluu."
MadeBy.TextColor3 = Color3.fromRGB(170, 0, 0)
MadeBy.TextSize = 27.000

HitBoxExtender.Name = "HitBox Extender"
HitBoxExtender.Parent = HBE_2
HitBoxExtender.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
HitBoxExtender.BorderColor3 = Color3.fromRGB(0, 0, 0)
HitBoxExtender.BorderSizePixel = 0
HitBoxExtender.Position = UDim2.new(0.172011659, 0, 0.184049085, 0)
HitBoxExtender.Size = UDim2.new(0, 224, 0, 77)
HitBoxExtender.Font = Enum.Font.Bangers
HitBoxExtender.Text = "Enable HB Extender"
HitBoxExtender.TextColor3 = Color3.fromRGB(170, 0, 0)
HitBoxExtender.TextSize = 29.000

UICorner_2.Parent = HitBoxExtender

PlayersInServer.Name = "Players In Server"
PlayersInServer.Parent = HBE_2
PlayersInServer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayersInServer.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayersInServer.BorderSizePixel = 0
PlayersInServer.Position = UDim2.new(0.172011659, 0, 0.558282197, 0)
PlayersInServer.Size = UDim2.new(0, 224, 0, 77)
PlayersInServer.Font = Enum.Font.Bangers
PlayersInServer.Text = "Players In Server:"
PlayersInServer.TextColor3 = Color3.fromRGB(170, 0, 0)
PlayersInServer.TextSize = 29.000

UICorner_3.Parent = PlayersInServer

MadeBy_2.Name = "Made By"
MadeBy_2.Parent = HBE_2
MadeBy_2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MadeBy_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
MadeBy_2.BorderSizePixel = 0
MadeBy_2.Position = UDim2.new(-0.002915452, 0, 0.855828226, 0)
MadeBy_2.Size = UDim2.new(0, 343, 0, 47)
MadeBy_2.Font = Enum.Font.Bangers
MadeBy_2.Text = "B To Close/Open GUI"
MadeBy_2.TextColor3 = Color3.fromRGB(170, 0, 0)
MadeBy_2.TextSize = 40.000

-- Scripts:

local function NQCCR_fake_script() -- PlayersInServer.Player Count 
	local script = Instance.new('LocalScript', PlayersInServer)

	local playerCountLabel = script.Parent
	
	local function updatePlayerCount()
		local players = game.Players:GetPlayers()
		playerCountLabel.Text = "Player Count: " .. #players
	end
	
	
	updatePlayerCount()
	
	game.Players.PlayerAdded:Connect(updatePlayerCount)
	game.Players.PlayerRemoving:Connect(updatePlayerCount)
	
end
coroutine.wrap(NQCCR_fake_script)()
local function SYOTQDN_fake_script() -- HBE_2.Draggable 
	local script = Instance.new('LocalScript', HBE_2)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(SYOTQDN_fake_script)()
local function WXZT_fake_script() -- HBE.Toggle 
	local script = Instance.new('LocalScript', HBE)

	local Player = game:GetService("Players").LocalPlayer
	local Mouse = Player:GetMouse()
	local MainFrame = script.Parent.HBE
	local keybind = "b"
	
	Mouse.KeyDown:Connect(function(key)
		if key == keybind then
			if MainFrame.Visible == false then
				MainFrame.Visible = true
			else
				MainFrame.Visible = false
			end
		end
	end)
end
coroutine.wrap(WXZT_fake_script)()
HitBoxExtender.MouseButton1Down:connect(function()
	function getplrsname()
		for i,v in pairs(game:GetChildren()) do
			if v.ClassName == "Players" then
				return v.Name
			end
		end
	end
	local players = getplrsname()
	local plr = game[players].LocalPlayer
	coroutine.resume(coroutine.create(function()
		while  wait(1) do
			coroutine.resume(coroutine.create(function()
				for _,v in pairs(game[players]:GetPlayers()) do
					if v.Name ~= plr.Name and v.Character then
						v.Character.RightUpperLeg.CanCollide = false
						v.Character.RightUpperLeg.Transparency = 10
						v.Character.RightUpperLeg.Size = Vector3.new(13,13,13)

						v.Character.LeftUpperLeg.CanCollide = false
						v.Character.LeftUpperLeg.Transparency = 10
						v.Character.LeftUpperLeg.Size = Vector3.new(13,13,13)

						v.Character.HeadHB.CanCollide = false
						v.Character.HeadHB.Transparency = 10
						v.Character.HeadHB.Size = Vector3.new(13,13,13)

						v.Character.HumanoidRootPart.CanCollide = false
						v.Character.HumanoidRootPart.Transparency = 10
						v.Character.HumanoidRootPart.Size = Vector3.new(13,13,13)

					end
				end
			end))
		end
	end))
end)

  	end    
})


local ESP = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ESP:AddButton({
	Name = "ESP",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
  	end    
})
