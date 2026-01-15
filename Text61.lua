if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,500,0,370)
mainFrame.Position = UDim2.new(0.5,-250,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2

-- Drag GUI principal
do
    local dragging, dragStart, startPos, dragInput
    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.Text = "SBS HUB | BARRY'S PRISON RUN"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = mainFrame

local line = Instance.new("Frame", mainFrame)
line.Size = UDim2.new(1,0,0,2)
line.Position = UDim2.new(0,0,0,50)
line.BackgroundColor3 = Color3.fromRGB(255,255,255)

local leftFrame = Instance.new("Frame", mainFrame)
leftFrame.Size = UDim2.new(0,150,1,-52)
leftFrame.Position = UDim2.new(0,0,0,52)
leftFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)

local rightFrame = Instance.new("Frame", mainFrame)
rightFrame.Size = UDim2.new(1,-150,1,-52)
rightFrame.Position = UDim2.new(0,150,0,52)
rightFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)

local midLine = Instance.new("Frame", mainFrame)
midLine.Size = UDim2.new(0,2,1,-52)
midLine.Position = UDim2.new(0,150,0,52)
midLine.BackgroundColor3 = Color3.fromRGB(255,255,255)

local function createButton(parent,text,y,callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.BackgroundColor3 = Color3.fromRGB(20,20,20)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    b.Parent = parent
    b.MouseEnter:Connect(function() b.BackgroundColor3 = Color3.fromRGB(40,40,40) end)
    b.MouseLeave:Connect(function() b.BackgroundColor3 = Color3.fromRGB(20,20,20) end)
    b.MouseButton1Click:Connect(callback)
end

local menuOrder = {"MAIN","STAGES","GUARD","MISC","YOUTUBE"}
local menuData = {
    ["MAIN"] = {"DESYNC","LOCALPLAYER","INVISIBLE","GODMODE","GODMODE 2","Troll GUI","Tools"},
    ["STAGES"] = {"Stages Selector","Auto Win","Auto Win v2"},
    ["GUARD"] = {"AUTO ARREST"},
    ["MISC"] = {"GUI para divertirse"},
    ["YOUTUBE"] = {"YOUTUBE:SEBAS SCRIPT","SUSCRIBETE:)"}
}

local function clearFrame(frame)
    for _, v in pairs(frame:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            v:Destroy()
        end
    end
end

for _, menu in ipairs(menuOrder) do
    createButton(leftFrame, menu, 10 + (_-1)*35, function()
        clearFrame(rightFrame)
        local titleLabel = Instance.new("TextLabel", rightFrame)
        titleLabel.Size = UDim2.new(1,0,0,30)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = menu
        titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 18

        local oy = 40
        for _, opt in ipairs(menuData[menu]) do
            createButton(rightFrame,opt,oy,function()
                if menu == "MAIN" then
                    if opt == "DESYNC" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text24/refs/heads/main/Text23.lua",true))()
                    elseif opt == "LOCALPLAYER" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua",true))()
                    elseif opt == "INVISIBLE" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text25/refs/heads/main/Text25.lua",true))()
                    elseif opt == "GODMODE" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text52/refs/heads/main/Text52.lua", true))()
                    elseif opt == "GODMODE 2" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text58/refs/heads/main/Text58.lua", true))()
                    elseif opt == "Troll GUI" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text59/refs/heads/main/Text59.lua", true))()
                    elseif opt == "Tools" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text57/refs/heads/main/Text57.lua", true))()
                    end
                elseif menu == "STAGES" then
                    if opt == "Stages Selector" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text53/refs/heads/main/Text53.lua", true))()
                    elseif opt == "Auto Win" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text55/refs/heads/main/Text55.lua", true))()
                    elseif opt == "Auto Win v2" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text54/refs/heads/main/Text54.lua", true))()
                    end
                elseif menu == "GUARD" then
                    if opt == "AUTO ARREST" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text56/refs/heads/main/Text56.lua", true))()
                    end
                elseif menu == "MISC" then
                    if opt == "GUI para divertirse" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text60/refs/heads/main/Text60.lua", true))()
                    end
                elseif menu == "YOUTUBE" then
                    if opt == "YOUTUBE:SEBAS SCRIPT" then
                        print("Botón YouTube ejecutado")
                    elseif opt == "SUSCRIBETE:)" then
                        print("Botón Suscribete ejecutado")
                    end
                end
            end)
            oy = oy + 40
        end
    end)
end

-- Toggle SBS con drag seguro
local toggle = Instance.new("TextButton", screenGui)
toggle.Size = UDim2.new(0,60,0,60)
toggle.Position = UDim2.new(1,-80,0,20)
toggle.BackgroundColor3 = Color3.fromRGB(20,20,20)
toggle.Text = "SBS"
toggle.TextColor3 = Color3.fromRGB(255,255,255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 24
toggle.BorderSizePixel = 0
local corner = Instance.new("UICorner", toggle)
corner.CornerRadius = UDim.new(0.3,0)

local dragging, dragInput, dragStart, startPos
local open = true

toggle.MouseButton1Click:Connect(function()
    open = not open
    mainFrame.Visible = open
end)

toggle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = toggle.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

toggle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        toggle.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                    startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
