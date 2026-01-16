-- ╔══════════════════════════════════════════════════════════════╗
-- ║  Custom Roblox GUI - Generiert mit Lua GUI Generator Pro    ║
-- ╚══════════════════════════════════════════════════════════════╝

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- // CLEANUP //
local old = CoreGui:FindFirstChild("Mein GUI") or LP.PlayerGui:FindFirstChild("Mein GUI")
if old then old:Destroy() end

-- // GUI SETUP //
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Mein GUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LP:WaitForChild("PlayerGui") end

-- // VIGNETTE (AKTIVIERT) //
local Vignette = Instance.new("ImageLabel", ScreenGui)
Vignette.BackgroundTransparency = 1
Vignette.Size = UDim2.new(1, 0, 1, 0)
Vignette.Image = "rbxassetid://257684567"
Vignette.ImageColor3 = Color3.new(0, 0, 0)
Vignette.ImageTransparency = 1
Vignette.ZIndex = 0

-- // CURSOR & MODAL LOGIK //
local wasCursorVisibleBeforeOpening = false

local function toggleCursor(opening)
    if opening then
        wasCursorVisibleBeforeOpening = UserInputService.MouseIconEnabled
        UserInputService.MouseIconEnabled = true
        
        local ModalFix = Instance.new("TextButton", ScreenGui)
        ModalFix.Name = "ModalFix"
        ModalFix.Modal = true
        ModalFix.Visible = false
        
        local vignetteInfo = TweenInfo.new(0.3)
        local vignetteGoal = {}
        vignetteGoal.ImageTransparency = 0.5
        TweenService:Create(Vignette, vignetteInfo, vignetteGoal):Play()
    else
        if not wasCursorVisibleBeforeOpening then
            UserInputService.MouseIconEnabled = false
        end
        
        if ScreenGui:FindFirstChild("ModalFix") then ScreenGui.ModalFix:Destroy() end
        
        local vignetteInfo = TweenInfo.new(0.3)
        local vignetteGoal = {}
        vignetteGoal.ImageTransparency = 1
        TweenService:Create(Vignette, vignetteInfo, vignetteGoal):Play()
    end
end

toggleCursor(true)

-- // DRAG FUNKTION //
local function makeDraggable(topbar, object)
    local dragging, dragStart, startPos
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = object.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            object.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- // TAB ERSTELLUNG //
local startX = 60


-- Tab: Test
local MainFrame_Test = Instance.new("Frame", ScreenGui)
MainFrame_Test.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame_Test.BackgroundTransparency = 0.2
MainFrame_Test.Position = UDim2.new(0, startX, 0, 100)
MainFrame_Test.Size = UDim2.new(0, 160, 0, 0)
MainFrame_Test.AutomaticSize = Enum.AutomaticSize.Y
MainFrame_Test.ZIndex = 2

local Corner_Test = Instance.new("UICorner", MainFrame_Test)
Corner_Test.CornerRadius = UDim.new(0, 6)

local Stroke_Test = Instance.new("UIStroke", MainFrame_Test)
Stroke_Test.Color = Color3.fromRGB(40, 40, 40)

local Title_Test = Instance.new("TextButton", MainFrame_Test)
Title_Test.Size = UDim2.new(1, 0, 0, 35)
Title_Test.BackgroundTransparency = 1
Title_Test.Text = "TEST"
Title_Test.TextColor3 = Color3.fromRGB(200, 200, 200)
Title_Test.Font = Enum.Font.GothamBold
Title_Test.TextSize = 13

local Container_Test = Instance.new("Frame", MainFrame_Test)
Container_Test.Name = "Container"
Container_Test.Position = UDim2.new(0, 0, 0, 35)
Container_Test.Size = UDim2.new(1, 0, 0, 0)
Container_Test.AutomaticSize = Enum.AutomaticSize.Y
Container_Test.BackgroundTransparency = 1

local UIList_Test = Instance.new("UIListLayout", Container_Test)
UIList_Test.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList_Test.Padding = UDim.new(0, 5)

local Padding_Test = Instance.new("UIPadding", Container_Test)
Padding_Test.PaddingBottom = UDim.new(0, 10)


-- Button: Fly
local active_Fly = false
local Btn_Fly = Instance.new("TextButton", Container_Test)
Btn_Fly.Size = UDim2.new(0, 140, 0, 28)
Btn_Fly.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Btn_Fly.BackgroundTransparency = 0.4
Btn_Fly.Text = "Fly"
Btn_Fly.TextColor3 = Color3.fromRGB(200, 200, 200)
Btn_Fly.Font = Enum.Font.GothamMedium
Btn_Fly.TextSize = 11

local BtnCorner_Fly = Instance.new("UICorner", Btn_Fly)
BtnCorner_Fly.CornerRadius = UDim.new(0, 4)

local BtnStroke_Fly = Instance.new("UIStroke", Btn_Fly)
BtnStroke_Fly.Color = Color3.fromRGB(80, 140, 255)
BtnStroke_Fly.Enabled = false

Btn_Fly.MouseButton1Click:Connect(function()
    task.spawn(function()
        loadstring(game:HttpGet("KommtNoch"))()
    end)
    active_Fly = not active_Fly
    BtnStroke_Fly.Enabled = active_Fly
    
    local btnInfo = TweenInfo.new(0.2)
    local btnGoal = {}
    if active_Fly then
        btnGoal.BackgroundColor3 = Color3.fromRGB(50, 90, 180)
        btnGoal.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        btnGoal.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        btnGoal.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
    TweenService:Create(Btn_Fly, btnInfo, btnGoal):Play()
end)

makeDraggable(Title_Test, MainFrame_Test)

-- Minimieren bei Rechtsklick
local isMinimized_Test = false
Title_Test.MouseButton2Click:Connect(function()
    isMinimized_Test = not isMinimized_Test
    Container_Test.Visible = not isMinimized_Test
    MainFrame_Test.AutomaticSize = isMinimized_Test and Enum.AutomaticSize.None or Enum.AutomaticSize.Y
    if isMinimized_Test then
        MainFrame_Test.Size = UDim2.new(0, 160, 0, 35)
    end
end)

startX = startX + 175

-- // TOGGLE HUB MIT RightShift //
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        ScreenGui.Enabled = not ScreenGui.Enabled
        toggleCursor(ScreenGui.Enabled)
    end
end)

print("✓ Custom GUI geladen! Toggle: RightShift")
