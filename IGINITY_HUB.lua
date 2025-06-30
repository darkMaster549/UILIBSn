local UGINITY = {}

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Animation Properties
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local hoverTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Main GUI Setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "UGINITY_HUB"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Floating Circle Button
local openBtn = Instance.new("ImageButton", screenGui)
openBtn.Size = UDim2.new(0, 70, 0, 70)
openBtn.Position = UDim2.new(0, 30, 0.5, -35)
openBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openBtn.BorderSizePixel = 0
openBtn.Image = ""
openBtn.Draggable = true
openBtn.Active = true
openBtn.ZIndex = 1000

-- Circle corner radius
local btnCorner = Instance.new("UICorner", openBtn)
btnCorner.CornerRadius = UDim.new(1, 0)

-- Button gradient
local gradient = Instance.new("UIGradient", openBtn)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
}
gradient.Rotation = 45

-- Button stroke
local stroke = Instance.new("UIStroke", openBtn)
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 2
stroke.Transparency = 0.3

-- Button text
local btnText = Instance.new("TextLabel", openBtn)
btnText.Size = UDim2.new(1, 0, 1, 0)
btnText.Text = "UGINITY"
btnText.TextColor3 = Color3.fromRGB(255, 255, 255)
btnText.TextScaled = true
btnText.Font = Enum.Font.GothamBold
btnText.BackgroundTransparency = 1
btnText.TextStrokeTransparency = 0.5
btnText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- Button glow effect
local shadow = Instance.new("ImageLabel", openBtn)
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.ZIndex = openBtn.ZIndex - 1

-- Main UI Frame
local Main = Instance.new("Frame", screenGui)
Main.Size = UDim2.new(0, 520, 0, 340)
Main.Position = UDim2.new(0.5, -260, 0.5, -170)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Visible = false
Main.ClipsDescendants = true
Main.ZIndex = 10
Main.Active = true
Main.Draggable = true

-- Main frame corner
local mainCorner = Instance.new("UICorner", Main)
mainCorner.CornerRadius = UDim.new(0, 12)

-- Main frame gradient
local mainGradient = Instance.new("UIGradient", Main)
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 22, 22)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
}
mainGradient.Rotation = 135

-- Main frame stroke
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Color = Color3.fromRGB(40, 40, 40)
mainStroke.Thickness = 1

-- Top bar
local topBar = Instance.new("Frame", Main)
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
topBar.BorderSizePixel = 0

local topBarCorner = Instance.new("UICorner", topBar)
topBarCorner.CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.Text = "✨ UGINITY HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 2.5)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.BorderSizePixel = 0

local closeBtnCorner = Instance.new("UICorner", closeBtn)
closeBtnCorner.CornerRadius = UDim.new(0, 6)

-- Minimize button
local minBtn = Instance.new("TextButton", topBar)
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -70, 0, 2.5)
minBtn.Text = "−"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minBtn.BorderSizePixel = 0

local minBtnCorner = Instance.new("UICorner", minBtn)
minBtnCorner.CornerRadius = UDim.new(0, 6)

-- Sidebar (Tabs)
local TabFrame = Instance.new("Frame", Main)
TabFrame.Size = UDim2.new(0, 130, 1, -45)
TabFrame.Position = UDim2.new(0, 10, 0, 40)
TabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TabFrame.BorderSizePixel = 0

local tabFrameCorner = Instance.new("UICorner", TabFrame)
tabFrameCorner.CornerRadius = UDim.new(0, 8)

local tabFrameStroke = Instance.new("UIStroke", TabFrame)
tabFrameStroke.Color = Color3.fromRGB(35, 35, 35)
tabFrameStroke.Thickness = 1

local TabList = Instance.new("UIListLayout", TabFrame)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 6)
TabList.HorizontalAlignment = Enum.HorizontalAlignment.Center

local tabPadding = Instance.new("UIPadding", TabFrame)
tabPadding.PaddingTop = UDim.new(0, 10)
tabPadding.PaddingLeft = UDim.new(0, 8)
tabPadding.PaddingRight = UDim.new(0, 8)

-- Content Area
local ContentFrame = Instance.new("Frame", Main)
ContentFrame.Size = UDim2.new(1, -160, 1, -55)
ContentFrame.Position = UDim2.new(0, 150, 0, 45)
ContentFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
ContentFrame.BorderSizePixel = 0
ContentFrame.ClipsDescendants = true

local contentCorner = Instance.new("UICorner", ContentFrame)
contentCorner.CornerRadius = UDim.new(0, 8)

local contentStroke = Instance.new("UIStroke", ContentFrame)
contentStroke.Color = Color3.fromRGB(35, 35, 35)
contentStroke.Thickness = 1

-- Status bar
local statusBar = Instance.new("Frame", Main)
statusBar.Size = UDim2.new(1, 0, 0, 8)
statusBar.Position = UDim2.new(0, 0, 1, -8)
statusBar.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
statusBar.BorderSizePixel = 0

local statusCorner = Instance.new("UICorner", statusBar)
statusCorner.CornerRadius = UDim.new(0, 12)

-- Animations
local function animateHover(element, hoverColor, normalColor)
    element.MouseEnter:Connect(function()
        local tween = TweenService:Create(element, hoverTweenInfo, {BackgroundColor3 = hoverColor})
        tween:Play()
    end)
    
    element.MouseLeave:Connect(function()
        local tween = TweenService:Create(element, hoverTweenInfo, {BackgroundColor3 = normalColor})
        tween:Play()
    end)
end

-- Button hover animations
animateHover(openBtn, Color3.fromRGB(25, 25, 25), Color3.fromRGB(0, 0, 0))
animateHover(closeBtn, Color3.fromRGB(220, 70, 70), Color3.fromRGB(200, 50, 50))
animateHover(minBtn, Color3.fromRGB(70, 70, 70), Color3.fromRGB(50, 50, 50))

-- Tab Creation
local activeTab = nil
function UGINITY:CreateTab(name, icon)
    local tabBtn = Instance.new("TextButton", TabFrame)
    tabBtn.Text = (icon or "📁") .. " " .. name
    tabBtn.Size = UDim2.new(1, 0, 0, 40)
    tabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.TextSize = 13
    tabBtn.BorderSizePixel = 0
    
    local tabCorner = Instance.new("UICorner", tabBtn)
    tabCorner.CornerRadius = UDim.new(0, 6)
    
    local tabStroke = Instance.new("UIStroke", tabBtn)
    tabStroke.Color = Color3.fromRGB(45, 45, 45)
    tabStroke.Thickness = 1
    tabStroke.Transparency = 0.5

    local page = Instance.new("ScrollingFrame", ContentFrame)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 8
    page.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
    page.Visible = false
    page.BorderSizePixel = 0

    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local pagePadding = Instance.new("UIPadding", page)
    pagePadding.PaddingTop = UDim.new(0, 10)
    pagePadding.PaddingLeft = UDim.new(0, 10)
    pagePadding.PaddingRight = UDim.new(0, 10)

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)

    -- Tab hover effect
    animateHover(tabBtn, Color3.fromRGB(45, 45, 45), Color3.fromRGB(30, 30, 30))

    tabBtn.MouseButton1Click:Connect(function()
        -- Deactivate previous tab
        if activeTab then
            local prevTween = TweenService:Create(activeTab.button, tweenInfo, {
                BackgroundColor3 = Color3.fromRGB(30, 30, 30),
                TextColor3 = Color3.fromRGB(200, 200, 200)
            })
            prevTween:Play()
            activeTab.page.Visible = false
        end
        
        -- Activate current tab
        local activeTween = TweenService:Create(tabBtn, tweenInfo, {
            BackgroundColor3 = Color3.fromRGB(0, 120, 255),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
        activeTween:Play()
        
        page.Visible = true
        activeTab = {button = tabBtn, page = page}
    end)

    return page
end

-- ELEMENT: Label
function UGINITY:CreateLabel(tab, text, color)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -20, 0, 30)
    frame.BackgroundTransparency = 1

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.Text = text
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = color or Color3.fromRGB(220, 220, 220)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 14
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    
    return lbl
end

-- ELEMENT: Button
function UGINITY:CreateButton(tab, text, callback)
    local btn = Instance.new("TextButton", tab)
    btn.Text = text
    btn.Size = UDim2.new(1, -20, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 6)
    
    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Color = Color3.fromRGB(60, 60, 60)
    btnStroke.Thickness = 1
    
    animateHover(btn, Color3.fromRGB(60, 60, 60), Color3.fromRGB(40, 40, 40))
    
    btn.MouseButton1Click:Connect(function()
        -- Click animation
        local clickTween = TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, -22, 0, 36)})
        clickTween:Play()
        clickTween.Completed:Connect(function()
            local backTween = TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, -20, 0, 38)})
            backTween:Play()
        end)
        pcall(callback)
    end)
    
    return btn
end

-- ELEMENT: Toggle
function UGINITY:CreateToggle(tab, text, default, callback)
    local toggled = default
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -20, 0, 35)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    
    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 6)

    local toggleFrame = Instance.new("Frame", frame)
    toggleFrame.Size = UDim2.new(0, 50, 0, 25)
    toggleFrame.Position = UDim2.new(1, -55, 0.5, -12.5)
    toggleFrame.BackgroundColor3 = toggled and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(60, 60, 60)
    toggleFrame.BorderSizePixel = 0
    
    local toggleCorner = Instance.new("UICorner", toggleFrame)
    toggleCorner.CornerRadius = UDim.new(1, 0)

    local toggleButton = Instance.new("Frame", toggleFrame)
    toggleButton.Size = UDim2.new(0, 21, 0, 21)
    toggleButton.Position = toggled and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BorderSizePixel = 0
    
    local buttonCorner = Instance.new("UICorner", toggleButton)
    buttonCorner.CornerRadius = UDim.new(1, 0)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -65, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.Text = text
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    local clickBtn = Instance.new("TextButton", frame)
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.Text = ""
    clickBtn.BackgroundTransparency = 1

    clickBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        
        local colorTween = TweenService:Create(toggleFrame, tweenInfo, {
            BackgroundColor3 = toggled and Color3.fromRGB(0, 150, 255) or Color3.fromRGB(60, 60, 60)
        })
        local positionTween = TweenService:Create(toggleButton, tweenInfo, {
            Position = toggled and UDim2.new(1, -23, 0.5, -10.5) or UDim2.new(0, 2, 0.5, -10.5)
        })
        
        colorTween:Play()
        positionTween:Play()
        pcall(callback, toggled)
    end)
    
    return frame
end

-- ELEMENT: Slider
function UGINITY:CreateSlider(tab, name, min, max, default, callback)
    local frame = Instance.new("Frame", tab)
    frame.Size = UDim2.new(1, -20, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    
    local frameCorner = Instance.new("UICorner", frame)
    frameCorner.CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -10, 0, 20)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.Text = name .. ": " .. default
    label.TextColor3 = Color3.fromRGB(220, 220, 220)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left

    local sliderTrack = Instance.new("Frame", frame)
    sliderTrack.Size = UDim2.new(1, -20, 0, 6)
    sliderTrack.Position = UDim2.new(0, 10, 0, 30)
    sliderTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    sliderTrack.BorderSizePixel = 0
    
    local trackCorner = Instance.new("UICorner", sliderTrack)
    trackCorner.CornerRadius = UDim.new(1, 0)

    local sliderFill = Instance.new("Frame", sliderTrack)
    sliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    sliderFill.BorderSizePixel = 0
    
    local fillCorner = Instance.new("UICorner", sliderFill)
    fillCorner.CornerRadius = UDim.new(1, 0)

    local sliderButton = Instance.new("Frame", sliderTrack)
    sliderButton.Size = UDim2.new(0, 14, 0, 14)
    sliderButton.Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7)
    sliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderButton.BorderSizePixel = 0
    
    local buttonCorner = Instance.new("UICorner", sliderButton)
    buttonCorner.CornerRadius = UDim.new(1, 0)

    local dragging = false
    local connection

    sliderTrack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            connection = UIS.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local scale = math.clamp((input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X, 0, 1)
                    local value = math.floor(min + (max - min) * scale)
                    
                    sliderFill.Size = UDim2.new(scale, 0, 1, 0)
                    sliderButton.Position = UDim2.new(scale, -7, 0.5, -7)
                    label.Text = name .. ": " .. value
                    pcall(callback, value)
                end
            end)
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            if connection then
                connection:Disconnect()
            end
        end
    end)
    
    return frame
end

-- Open/Close Animation
local isOpen = false

local function toggleGUI()
    isOpen = not isOpen
    
    if isOpen then
        Main.Visible = true
        Main.Size = UDim2.new(0, 0, 0, 0)
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        local openTween = TweenService:Create(Main, tweenInfo, {
            Size = UDim2.new(0, 520, 0, 340),
            Position = UDim2.new(0.5, -260, 0.5, -170)
        })
        openTween:Play()
        
        -- Button animation
        local btnTween = TweenService:Create(btnText, tweenInfo, {
            TextColor3 = Color3.fromRGB(0, 150, 255)
        })
        btnTween:Play()
    else
        local closeTween = TweenService:Create(Main, tweenInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        closeTween:Play()
        
        closeTween.Completed:Connect(function()
            Main.Visible = false
        end)
        
        -- Button animation
        local btnTween = TweenService:Create(btnText, tweenInfo, {
            TextColor3 = Color3.fromRGB(255, 255, 255)
        })
        btnTween:Play()
    end
end

-- Button connections
openBtn.MouseButton1Click:Connect(toggleGUI)
closeBtn.MouseButton1Click:Connect(toggleGUI)
minBtn.MouseButton1Click:Connect(toggleGUI)

-- Floating animation for the button
local floatTween = TweenService:Create(openBtn, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Position = UDim2.new(0, 30, 0.5, -25)
})
floatTween:Play()

return UGINITY
