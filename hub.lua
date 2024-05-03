local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Solara Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "SH"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

OrionLib:MakeNotification({
	Name = "Welcome!",
	Content = "This is Script Hub for Solara, Meaning that it will support every script on here.",
	Image = "rbxassetid://4483345998",
	Time = 10
})

local Section = Tab:AddSection({
	Name = "Main"
})

Tab:AddSlider({
	Name = "WalkSpeed",
	Min = 5,
	Max = 200,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Walkspeed Value",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab:AddButton({
	Name = "Reset Walkspeed",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
  	end    
})

Tab:AddSlider({
	Name = "JumpPower",
	Min = 10,
	Max = 350,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JumpPower Value",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

Tab:AddButton({
	Name = "Reset JumpPower",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
  	end    
})

Tab:AddSlider({
	Name = "FOV",
	Min = 50,
	Max = 120,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "FOV Value",
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = Value
	end    
})


Tab:AddButton({
	Name = "FOV Reset",
	Callback = function()
        game.Workspace.CurrentCamera.FieldOfView = 50
  	end    
})

Tab:AddButton({
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

Tab:AddButton({
	Name = "Anti AFK",
	Callback = function()
		game.StarterGui:SetCore("SendNotification", {Title = "Solara Hub Anti AFK", Text = "Solara Hub was founded by .bluuu. and brennen_n in 2024", Icon = "rbxassetid://505845268", Duration = 10, Button1 = "Alright We Winning!"})


local virtualUser = game:GetService("VirtualUser")
local runService = game:GetService("RunService")


local function preventAFK()
    while true do
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
        wait(30) 
    end
end
runService.Heartbeat:Connect(preventAFK)
    end
})

Tab:AddButton({
    Name = "Teleport Tool",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Click Teleport"
        
        tool.Activated:Connect(function()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            pos = CFrame.new(pos.X, pos.Y, pos.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end)
        
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

Tab:AddButton({
	Name = "Xray (Press 1 To Toggle On/Off)",
	Callback = function()
		local camera = game.Workspace.CurrentCamera
		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()
		local xRayEnabled = false
		local originalTransparencies = {}
		
		-- Function to toggle X-ray mode
		local function toggleXRayMode()
			xRayEnabled = not xRayEnabled
			
			if xRayEnabled then
				for _, part in ipairs(game.Workspace:GetDescendants()) do
					if part:IsA("BasePart") and not part:IsDescendantOf(player.Character) then
						originalTransparencies[part] = part.Transparency
						part.Transparency = 0.5 -- Adjust transparency value as needed
					end
				end
			else
				for part, transparency in pairs(originalTransparencies) do
					part.Transparency = transparency
					originalTransparencies[part] = nil
				end
			end
		end
		
		-- Toggle X-ray mode when the key is pressed
		mouse.KeyDown:Connect(function(key)
			if key == "1" then
				toggleXRayMode()
			end
		end)
		
  	end    
})


Tab:AddButton({
	Name = "FreeCam (Shift + P to enable E Up Q Down)",
	Callback = function()
		function sandbox(var,func)
			local env = getfenv(func)
			local newenv = setmetatable({},{
			__index = function(self,k)
			if k=="script" then
			return var
			else
			return env[k]
			end
			end,
			})
			setfenv(func,newenv)
			return func
			end
			cors = {}
			mas = Instance.new("Model",game:GetService("Lighting"))
			LocalScript0 = Instance.new("LocalScript")
			LocalScript0.Name = "FreeCamera"
			LocalScript0.Parent = mas
			table.insert(cors,sandbox(LocalScript0,function()
			
			local pi    = math.pi
			local abs   = math.abs
			local clamp = math.clamp
			local exp   = math.exp
			local rad   = math.rad
			local sign  = math.sign
			local sqrt  = math.sqrt
			local tan   = math.tan
			
			local ContextActionService = game:GetService("ContextActionService")
			local Players = game:GetService("Players")
			local RunService = game:GetService("RunService")
			local StarterGui = game:GetService("StarterGui")
			local UserInputService = game:GetService("UserInputService")
			
			local LocalPlayer = Players.LocalPlayer
			if not LocalPlayer then
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			LocalPlayer = Players.LocalPlayer
			end
			
			local Camera = workspace.CurrentCamera
			workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			local newCamera = workspace.CurrentCamera
			if newCamera then
			Camera = newCamera
			end
			end)
			
			------------------------------------------------------------------------
			
			local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
			local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
			local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}
			
			local NAV_GAIN = Vector3.new(1, 1, 1)*64
			local PAN_GAIN = Vector2.new(0.75, 1)*8
			local FOV_GAIN = 300
			
			local PITCH_LIMIT = rad(90)
			
			local VEL_STIFFNESS = 1.5
			local PAN_STIFFNESS = 1.0
			local FOV_STIFFNESS = 4.0
			
			------------------------------------------------------------------------
			
			local Spring = {} do
			Spring.__index = Spring
			
			function Spring.new(freq, pos)
			local self = setmetatable({}, Spring)
			self.f = freq
			self.p = pos
			self.v = pos*0
			return self
			end
			
			function Spring:Update(dt, goal)
			local f = self.f*2*pi
			local p0 = self.p
			local v0 = self.v
			
			local offset = goal - p0
			local decay = exp(-f*dt)
			
			local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
			local v1 = (f*dt*(offset*f - v0) + v0)*decay
			
			self.p = p1
			self.v = v1
			
			return p1
			end
			
			function Spring:Reset(pos)
			self.p = pos
			self.v = pos*0
			end
			end
			
			------------------------------------------------------------------------
			
			local cameraPos = Vector3.new()
			local cameraRot = Vector2.new()
			local cameraFov = 0
			
			local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
			local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
			local fovSpring = Spring.new(FOV_STIFFNESS, 0)
			
			------------------------------------------------------------------------
			
			local Input = {} do
			local thumbstickCurve do
			local K_CURVATURE = 2.0
			local K_DEADZONE = 0.15
			
			local function fCurve(x)
			return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
			end
			
			local function fDeadzone(x)
			return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
			end
			
			function thumbstickCurve(x)
			return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
			end
			end
			
			local gamepad = {
			ButtonX = 0,
			ButtonY = 0,
			DPadDown = 0,
			DPadUp = 0,
			ButtonL2 = 0,
			ButtonR2 = 0,
			Thumbstick1 = Vector2.new(),
			Thumbstick2 = Vector2.new(),
			}
			
			local keyboard = {
			W = 0,
			A = 0,
			S = 0,
			D = 0,
			E = 0,
			Q = 0,
			U = 0,
			H = 0,
			J = 0,
			K = 0,
			I = 0,
			Y = 0,
			Up = 0,
			Down = 0,
			LeftShift = 0,
			RightShift = 0,
			}
			
			local mouse = {
			Delta = Vector2.new(),
			MouseWheel = 0,
			}
			
			local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
			local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
			local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
			local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
			local FOV_WHEEL_SPEED    = 1.0
			local FOV_GAMEPAD_SPEED  = 0.25
			local NAV_ADJ_SPEED      = 0.75
			local NAV_SHIFT_MUL      = 0.25
			
			local navSpeed = 1
			
			function Input.Vel(dt)
			navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)
			
			local kGamepad = Vector3.new(
			thumbstickCurve(gamepad.Thumbstick1.x),
			thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
			thumbstickCurve(-gamepad.Thumbstick1.y)
			)*NAV_GAMEPAD_SPEED
			
			local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A + keyboard.K - keyboard.H,
			keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
			keyboard.S - keyboard.W + keyboard.J - keyboard.U
			)*NAV_KEYBOARD_SPEED
			
			local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
			
			return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
			end
			
			function Input.Pan(dt)
			local kGamepad = Vector2.new(
			thumbstickCurve(gamepad.Thumbstick2.y),
			thumbstickCurve(-gamepad.Thumbstick2.x)
			)*PAN_GAMEPAD_SPEED
			local kMouse = mouse.Delta*PAN_MOUSE_SPEED
			mouse.Delta = Vector2.new()
			return kGamepad + kMouse
			end
			
			function Input.Fov(dt)
			local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
			local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
			mouse.MouseWheel = 0
			return kGamepad + kMouse
			end
			
			do
			local function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
			end
			
			local function GpButton(action, state, input)
			gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
			end
			
			local function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
			end
			
			local function Thumb(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position
			return Enum.ContextActionResult.Sink
			end
			
			local function Trigger(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position.z
			return Enum.ContextActionResult.Sink
			end
			
			local function MouseWheel(action, state, input)
			mouse[input.UserInputType.Name] = -input.Position.z
			return Enum.ContextActionResult.Sink
			end
			
			local function Zero(t)
			for k, v in pairs(t) do
			t[k] = v*0
			end
			end
			
			function Input.StartCapture()
			ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
			Enum.KeyCode.W, Enum.KeyCode.U,
			Enum.KeyCode.A, Enum.KeyCode.H,
			Enum.KeyCode.S, Enum.KeyCode.J,
			Enum.KeyCode.D, Enum.KeyCode.K,
			Enum.KeyCode.E, Enum.KeyCode.I,
			Enum.KeyCode.Q, Enum.KeyCode.Y,
			Enum.KeyCode.Up, Enum.KeyCode.Down
			)
			ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
			ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
			ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
			ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
			ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
			end
			
			function Input.StopCapture()
			navSpeed = 1
			Zero(gamepad)
			Zero(keyboard)
			Zero(mouse)
			ContextActionService:UnbindAction("FreecamKeyboard")
			ContextActionService:UnbindAction("FreecamMousePan")
			ContextActionService:UnbindAction("FreecamMouseWheel")
			ContextActionService:UnbindAction("FreecamGamepadButton")
			ContextActionService:UnbindAction("FreecamGamepadTrigger")
			ContextActionService:UnbindAction("FreecamGamepadThumbstick")
			end
			end
			end
			
			local function GetFocusDistance(cameraFrame)
			local znear = 0.1
			local viewport = Camera.ViewportSize
			local projy = 2*tan(cameraFov/2)
			local projx = viewport.x/viewport.y*projy
			local fx = cameraFrame.rightVector
			local fy = cameraFrame.upVector
			local fz = cameraFrame.lookVector
			
			local minVect = Vector3.new()
			local minDist = 512
			
			for x = 0, 1, 0.5 do
			for y = 0, 1, 0.5 do
			local cx = (x - 0.5)*projx
			local cy = (y - 0.5)*projy
			local offset = fx*cx - fy*cy + fz
			local origin = cameraFrame.p + offset*znear
			local part, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
			local dist = (hit - origin).magnitude
			if minDist > dist then
			minDist = dist
			minVect = offset.unit
			end
			end
			end
			
			return fz:Dot(minVect)*minDist
			end
			
			------------------------------------------------------------------------
			
			local function StepFreecam(dt)
			local vel = velSpring:Update(dt, Input.Vel(dt))
			local pan = panSpring:Update(dt, Input.Pan(dt))
			local fov = fovSpring:Update(dt, Input.Fov(dt))
			
			local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))
			
			cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
			cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
			cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))
			
			local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
			cameraPos = cameraCFrame.p
			
			Camera.CFrame = cameraCFrame
			Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
			Camera.FieldOfView = cameraFov
			end
			
			------------------------------------------------------------------------
			
			local PlayerState = {} do
			local mouseIconEnabled
			local cameraSubject
			local cameraType
			local cameraFocus
			local cameraCFrame
			local cameraFieldOfView
			local screenGuis = {}
			local coreGuis = {
			Backpack = true,
			Chat = true,
			Health = true,
			PlayerList = true,
			}
			local setCores = {
			BadgesNotificationsActive = true,
			PointsNotificationsActive = true,
			}
			
			-- Save state and set up for freecam
			function PlayerState.Push()
			for name in pairs(coreGuis) do
			coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
			end
			for name in pairs(setCores) do
			setCores[name] = StarterGui:GetCore(name)
			StarterGui:SetCore(name, false)
			end
			local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
			if playergui then
			for _, gui in pairs(playergui:GetChildren()) do
			if gui:IsA("ScreenGui") and gui.Enabled then
			screenGuis[#screenGuis + 1] = gui
			gui.Enabled = false
			end
			end
			end
			
			cameraFieldOfView = Camera.FieldOfView
			Camera.FieldOfView = 70
			
			cameraType = Camera.CameraType
			Camera.CameraType = Enum.CameraType.Custom
			
			cameraSubject = Camera.CameraSubject
			Camera.CameraSubject = nil
			
			cameraCFrame = Camera.CFrame
			cameraFocus = Camera.Focus
			
			mouseIconEnabled = UserInputService.MouseIconEnabled
			UserInputService.MouseIconEnabled = false
			
			mouseBehavior = UserInputService.MouseBehavior
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			end
			
			-- Restore state
			function PlayerState.Pop()
			for name, isEnabled in pairs(coreGuis) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
			end
			for name, isEnabled in pairs(setCores) do
			StarterGui:SetCore(name, isEnabled)
			end
			for _, gui in pairs(screenGuis) do
			if gui.Parent then
			gui.Enabled = true
			end
			end
			
			Camera.FieldOfView = cameraFieldOfView
			cameraFieldOfView = nil
			
			Camera.CameraType = cameraType
			cameraType = nil
			
			Camera.CameraSubject = cameraSubject
			cameraSubject = nil
			
			Camera.CFrame = cameraCFrame
			cameraCFrame = nil
			
			Camera.Focus = cameraFocus
			cameraFocus = nil
			
			UserInputService.MouseIconEnabled = mouseIconEnabled
			mouseIconEnabled = nil
			
			UserInputService.MouseBehavior = mouseBehavior
			mouseBehavior = nil
			end
			end
			
			local function StartFreecam()
			local cameraCFrame = Camera.CFrame
			cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
			cameraPos = cameraCFrame.p
			cameraFov = Camera.FieldOfView
			
			velSpring:Reset(Vector3.new())
			panSpring:Reset(Vector2.new())
			fovSpring:Reset(0)
			
			PlayerState.Push()
			RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
			Input.StartCapture()
			end
			
			local function StopFreecam()
			Input.StopCapture()
			RunService:UnbindFromRenderStep("Freecam")
			PlayerState.Pop()
			end
			
			------------------------------------------------------------------------
			
			do
			local enabled = false
			
			local function ToggleFreecam()
			if enabled then
			StopFreecam()
			else
			StartFreecam()
			end
			enabled = not enabled
			end
			
			local function CheckMacro(macro)
			for i = 1, #macro - 1 do
			if not UserInputService:IsKeyDown(macro[i]) then
			return
			end
			end
			ToggleFreecam()
			end
			
			local function HandleActivationInput(action, state, input)
			if state == Enum.UserInputState.Begin then
			if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
			CheckMacro(FREECAM_MACRO_KB)
			end
			end
			return Enum.ContextActionResult.Pass
			end
			
			ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
			end
			end))
			for i,v in pairs(mas:GetChildren()) do
			v.Parent = game:GetService("Players").LocalPlayer.PlayerGui
			pcall(function() v:MakeJoints() end)
			end
			mas:Destroy()
			for i,v in pairs(cors) do
			spawn(function()
			pcall(v)
			end)
			end
  	end    
})

local espActive = true

Tab:AddToggle({
    Name = "Universal ESP",
    Callback = function()
        espActive = not espActive
        
        local function createHighlight(player)
            local highlight = Instance.new("BoxHandleAdornment")
            highlight.Parent = player.Character.HumanoidRootPart
            highlight.Size = player.Character.HumanoidRootPart.Size * 1.1
            highlight.Adornee = player.Character.HumanoidRootPart
            highlight.Color3 = Color3.fromRGB(230, 30, 30) -- Slightly brighter red color
            highlight.Transparency = 0.35 -- Semi-transparent
            highlight.AlwaysOnTop = true
            highlight.ZIndex = 5 -- Ensure it's not occluded by other parts
            return highlight
        end
        
        local function highlightAllPlayers()
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player.Character then
                    createHighlight(player)
                end
            end
        end
        
        local function removeHighlights()
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player.Character then
                    for _, descendant in ipairs(player.Character:GetDescendants()) do
                        if descendant:IsA("BoxHandleAdornment") then
                            descendant:Destroy()
                        end
                    end
                end
            end
        end
        
        if espActive then
            highlightAllPlayers()
        else
            removeHighlights()
        end
    end
})


local Credits = Window:MakeTab({
    Name = "Credits & Info",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Credits:AddParagraph("Solara Hub","Solara Hub is a Script Hub made for Solara, making it easier to find scripts that work on Solara. Every script will be functional and will be checked for updates.")
Credits:AddParagraph("Founders & Developers","Solara Hub was founded and developed by .bluuu. & brennen_n.")
