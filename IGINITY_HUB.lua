-- UGINITY PROFESSIONAL UI - ULTIMATE EDITION
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- ULTIMATE CONFIGURATION
local THEMES = {
    ["Midnight Abyss"] = {
        background = Color3.fromRGB(8, 8, 15),
        panel = Color3.fromRGB(18, 18, 28),
        accent = Color3.fromRGB(147, 51, 234),
        secondary = Color3.fromRGB(88, 28, 135),
        text = Color3.fromRGB(255, 255, 255),
        glow = Color3.fromRGB(147, 51, 234)
    },
    ["Crimson Nightmare"] = {
        background = Color3.fromRGB(15, 5, 5),
        panel = Color3.fromRGB(30, 10, 10),
        accent = Color3.fromRGB(220, 20, 60),
        secondary = Color3.fromRGB(139, 0, 0),
        text = Color3.fromRGB(255, 240, 240),
        glow = Color3.fromRGB(255, 69, 0)
    },
    ["Cyber Genesis"] = {
        background = Color3.fromRGB(0, 8, 15),
        panel = Color3.fromRGB(0, 18, 30),
        accent = Color3.fromRGB(0, 255, 255),
        secondary = Color3.fromRGB(0, 191, 255),
        text = Color3.fromRGB(224, 255, 255),
        glow = Color3.fromRGB(0, 255, 255)
    },
    ["Toxic Venom"] = {
        background = Color3.fromRGB(5, 15, 0),
        panel = Color3.fromRGB(10, 25, 5),
        accent = Color3.fromRGB(50, 205, 50),
        secondary = Color3.fromRGB(34, 139, 34),
        text = Color3.fromRGB(240, 255, 240),
        glow = Color3.fromRGB(127, 255, 0)
    },
    ["Royal Gold"] = {
        background = Color3.fromRGB(15, 10, 0),
        panel = Color3.fromRGB(25, 20, 5),
        accent = Color3.fromRGB(255, 215, 0),
        secondary = Color3.fromRGB(218, 165, 32),
        text = Color3.fromRGB(255, 248, 220),
        glow = Color3.fromRGB(255, 223, 0)
    },
    ["Arctic Storm"] = {
        background = Color3.fromRGB(240, 248, 255),
        panel = Color3.fromRGB(248, 248, 255),
        accent = Color3.fromRGB(70, 130, 180),
        secondary = Color3.fromRGB(100, 149, 237),
        text = Color3.fromRGB(25, 25, 112),
        glow = Color3.fromRGB(135, 206, 250)
    }
}

local TEXT_COLORS = {
    ["Phantom White"] = Color3.fromRGB(255, 255, 255),
    ["Blood Red"] = Color3.fromRGB(255, 20, 20),
    ["Electric Blue"] = Color3.fromRGB(30, 144, 255),
    ["Toxic Green"] = Color3.fromRGB(50, 205, 50),
    ["Royal Purple"] = Color3.fromRGB(138, 43, 226),
    ["Molten Gold"] = Color3.fromRGB(255, 215, 0),
    ["Neon Cyan"] = Color3.fromRGB(0, 255, 255),
    ["Hot Pink"] = Color3.fromRGB(255, 20, 147),
    ["Shadow Black"] = Color3.fromRGB(20, 20, 20),
    ["Plasma Orange"] = Color3.fromRGB(255, 69, 0)
}

-- Current settings
local currentTheme = "Midnight Abyss"
local currentTextColor = "Phantom White"
local currentTab = "Welcome"

-- Create ScreenGui with Good effects
local gui = Instance.new("ScreenGui")
gui.Name = "UGINITY_ULTIMATE"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player.PlayerGui

-- Background blur effect
local backgroundBlur = Instance.new("Frame")
backgroundBlur.Size = UDim2.new(1, 0, 1, 0)
backgroundBlur.Position = UDim2.new(0, 0, 0, 0)
backgroundBlur.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundBlur.BackgroundTransparency = 0.3
backgroundBlur.BorderSizePixel = 0
backgroundBlur.Parent = gui

-- Animated background particles
local particleContainer = Instance.new("Frame")
particleContainer.Size = UDim2.new(1, 0, 1, 0)
particleContainer.BackgroundTransparency = 1
particleContainer.Parent = gui

-- Create premium particles
local particles = {}
for i = 1, 50 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 8), 0, math.random(2, 8))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = THEMES[currentTheme].glow
    particle.BackgroundTransparency = math.random(70, 90) / 100
    particle.BorderSizePixel = 0
    particle.Parent = particleContainer
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    
    table.insert(particles, particle)
end

-- Main Container with glassmorphism
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(0, 900, 0, 700)
mainContainer.Position = UDim2.new(0.5, -450, 0.5, -350)
mainContainer.BackgroundColor3 = THEMES[currentTheme].background
mainContainer.BackgroundTransparency = 0.1
mainContainer.BorderSizePixel = 0
mainContainer.Parent = gui

-- Premium glass effect
local glassCorner = Instance.new("UICorner")
glassCorner.CornerRadius = UDim.new(0, 20)
glassCorner.Parent = mainContainer

local glassStroke = Instance.new("UIStroke")
glassStroke.Color = THEMES[currentTheme].accent
glassStroke.Thickness = 2
glassStroke.Transparency = 0.5
glassStroke.Parent = mainContainer

-- Animated glow effect
local glowFrame = Instance.new("Frame")
glowFrame.Size = UDim2.new(1, 20, 1, 20)
glowFrame.Position = UDim2.new(0, -10, 0, -10)
glowFrame.BackgroundColor3 = THEMES[currentTheme].glow
glowFrame.BackgroundTransparency = 0.8
glowFrame.BorderSizePixel = 0
glowFrame.ZIndex = mainContainer.ZIndex - 1
glowFrame.Parent = gui

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 25)
glowCorner.Parent = glowFrame

-- Premium Header
local headerPanel = Instance.new("Frame")
headerPanel.Size = UDim2.new(1, 0, 0, 100)
headerPanel.Position = UDim2.new(0, 0, 0, 0)
headerPanel.BackgroundTransparency = 1
headerPanel.Parent = mainContainer

-- Animated title with premium effects
local titleContainer = Instance.new("Frame")
titleContainer.Size = UDim2.new(0, 600, 0, 80)
titleContainer.Position = UDim2.new(0.5, -300, 0.5, -40)
titleContainer.BackgroundTransparency = 1
titleContainer.Parent = headerPanel

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ UGINITY ULTIMATE ⚡"
title.Font = Enum.Font.GothamBold
title.TextColor3 = TEXT_COLORS[currentTextColor]
title.TextSize = 36
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = THEMES[currentTheme].background
title.Parent = titleContainer

-- Premium glow text effect
local glowText1 = title:Clone()
glowText1.Position = UDim2.new(0, 2, 0, 2)
glowText1.TextColor3 = THEMES[currentTheme].glow
glowText1.TextTransparency = 0.5
glowText1.ZIndex = title.ZIndex - 1
glowText1.Parent = titleContainer

local glowText2 = title:Clone()
glowText2.Position = UDim2.new(0, -2, 0, -2)
glowText2.TextColor3 = THEMES[currentTheme].glow
glowText2.TextTransparency = 0.7
glowText2.ZIndex = title.ZIndex - 2
glowText2.Parent = titleContainer

-- Tab Navigation with premium styling
local tabPanel = Instance.new("Frame")
tabPanel.Size = UDim2.new(1, -40, 0, 60)
tabPanel.Position = UDim2.new(0, 20, 0, 110)
tabPanel.BackgroundColor3 = THEMES[currentTheme].panel
tabPanel.BackgroundTransparency = 0.2
tabPanel.BorderSizePixel = 0
tabPanel.Parent = mainContainer

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 15)
tabCorner.Parent = tabPanel

local tabStroke = Instance.new("UIStroke")
tabStroke.Color = THEMES[currentTheme].accent
tabStroke.Thickness = 1
tabStroke.Transparency = 0.7
tabStroke.Parent = tabPanel

local tabs = {"Welcome", "Settings", "About"}
local tabButtons = {}

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 180, 0, 40)
    tabButton.Position = UDim2.new(0, (i-1) * 190 + 30, 0, 10)
    tabButton.BackgroundColor3 = currentTab == tabName and THEMES[currentTheme].accent or THEMES[currentTheme].panel
    tabButton.BackgroundTransparency = currentTab == tabName and 0.2 or 0.8
    tabButton.BorderSizePixel = 0
    tabButton.Text = tabName
    tabButton.Font = Enum.Font.GothamBold
    tabButton.TextColor3 = THEMES[currentTheme].text
    tabButton.TextSize = 16
    tabButton.Parent = tabPanel
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 10)
    btnCorner.Parent = tabButton
    
    if currentTab == tabName then
        local btnStroke = Instance.new("UIStroke")
        btnStroke.Color = THEMES[currentTheme].accent
        btnStroke.Thickness = 2
        btnStroke.Parent = tabButton
    end
    
    tabButtons[tabName] = tabButton
end

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -40, 1, -210)
contentArea.Position = UDim2.new(0, 20, 0, 180)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainContainer

-- Welcome Tab Content
local welcomeContent = Instance.new("Frame")
welcomeContent.Size = UDim2.new(1, 0, 1, 0)
welcomeContent.BackgroundTransparency = 1
welcomeContent.Visible = currentTab == "Welcome"
welcomeContent.Parent = contentArea

-- Premium UGINITY Display
local uginityDisplay = Instance.new("Frame")
uginityDisplay.Size = UDim2.new(1, 0, 0, 300)
uginityDisplay.Position = UDim2.new(0, 0, 0.5, -150)
uginityDisplay.BackgroundTransparency = 1
uginityDisplay.Parent = welcomeContent

-- Main UGINITY text with extreme effects
local mainText = Instance.new("TextLabel")
mainText.Size = UDim2.new(1, 0, 0, 120)
mainText.Position = UDim2.new(0, 0, 0.5, -60)
mainText.BackgroundTransparency = 1
mainText.Text = "🌟 UGINITY UNLEASHED 🌟"
mainText.Font = Enum.Font.GothamBold
mainText.TextColor3 = TEXT_COLORS[currentTextColor]
mainText.TextSize = 48
mainText.TextStrokeTransparency = 0
mainText.TextStrokeColor3 = THEMES[currentTheme].background
mainText.Parent = uginityDisplay

-- Multiple glow layers for extreme effect
for i = 1, 5 do
    local glow = mainText:Clone()
    glow.Position = UDim2.new(0, math.random(-3, 3), 0, math.random(-3, 3))
    glow.TextColor3 = THEMES[currentTheme].glow
    glow.TextTransparency = 0.3 + (i * 0.1)
    glow.TextStrokeTransparency = 0.5 + (i * 0.1)
    glow.ZIndex = mainText.ZIndex - i
    glow.Parent = uginityDisplay
end

-- Settings Tab Content - PREMIUM EDITION
local settingsContent = Instance.new("Frame")
settingsContent.Size = UDim2.new(1, 0, 1, 0)
settingsContent.BackgroundTransparency = 1
settingsContent.Visible = currentTab == "Settings"
settingsContent.Parent = contentArea

-- Settings Title
local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0, 50)
settingsTitle.Position = UDim2.new(0, 0, 0, 0)
settingsTitle.BackgroundTransparency = 1
settingsTitle.Text = "⚙️ ULTIMATE SETTINGS ⚙️"
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextColor3 = THEMES[currentTheme].accent
settingsTitle.TextSize = 24
settingsTitle.Parent = settingsContent

-- Developer Credits
local devCredits = Instance.new("Frame")
devCredits.Size = UDim2.new(1, 0, 0, 80)
devCredits.Position = UDim2.new(0, 0, 0, 60)
devCredits.BackgroundColor3 = THEMES[currentTheme].panel
devCredits.BackgroundTransparency = 0.3
devCredits.BorderSizePixel = 0
devCredits.Parent = settingsContent

local devCorner = Instance.new("UICorner")
devCorner.CornerRadius = UDim.new(0, 12)
devCorner.Parent = devCredits

local devStroke = Instance.new("UIStroke")
devStroke.Color = THEMES[currentTheme].accent
devStroke.Thickness = 1
devStroke.Transparency = 0.5
devStroke.Parent = devCredits

local devText = Instance.new("TextLabel")
devText.Size = UDim2.new(1, -20, 1, 0)
devText.Position = UDim2.new(0, 10, 0, 0)
devText.BackgroundTransparency = 1
devText.Text = "🔥 Developer Themes and Textcolor-Shizo | k1ngBloodit 🔥\n💀 ULTIMATE EDITION - UNMATCHED POWER 💀"
devText.Font = Enum.Font.GothamBold
devText.TextColor3 = THEMES[currentTheme].text
devText.TextSize = 16
devText.TextWrapped = true
devText.Parent = devCredits

-- Theme Selection Panel
local themePanel = Instance.new("Frame")
themePanel.Size = UDim2.new(0.48, 0, 0, 280)
themePanel.Position = UDim2.new(0, 0, 0, 160)
themePanel.BackgroundColor3 = THEMES[currentTheme].panel
themePanel.BackgroundTransparency = 0.2
themePanel.BorderSizePixel = 0
themePanel.Parent = settingsContent

local themePanelCorner = Instance.new("UICorner")
themePanelCorner.CornerRadius = UDim.new(0, 12)
themePanelCorner.Parent = themePanel

local themePanelStroke = Instance.new("UIStroke")
themePanelStroke.Color = THEMES[currentTheme].accent
themePanelStroke.Thickness = 2
themePanelStroke.Parent = themePanel

local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(1, 0, 0, 40)
themeLabel.Position = UDim2.new(0, 0, 0, 10)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "🎨 PREMIUM THEMES"
themeLabel.Font = Enum.Font.GothamBold
themeLabel.TextColor3 = THEMES[currentTheme].accent
themeLabel.TextSize = 18
themeLabel.Parent = themePanel

-- Theme buttons
local themeY = 60
for themeName, themeData in pairs(THEMES) do
    local themeButton = Instance.new("TextButton")
    themeButton.Size = UDim2.new(1, -20, 0, 30)
    themeButton.Position = UDim2.new(0, 10, 0, themeY)
    themeButton.BackgroundColor3 = currentTheme == themeName and themeData.accent or themeData.panel
    themeButton.BackgroundTransparency = currentTheme == themeName and 0.2 or 0.5
    themeButton.BorderSizePixel = 0
    themeButton.Text = themeName
    themeButton.Font = Enum.Font.GothamSemibold
    themeButton.TextColor3 = themeData.text
    themeButton.TextSize = 14
    themeButton.Parent = themePanel
    
    local themeButtonCorner = Instance.new("UICorner")
    themeButtonCorner.CornerRadius = UDim.new(0, 8)
    themeButtonCorner.Parent = themeButton
    
    if currentTheme == themeName then
        local selectedStroke = Instance.new("UIStroke")
        selectedStroke.Color = themeData.accent
        selectedStroke.Thickness = 2
        selectedStroke.Parent = themeButton
    end
    
    themeButton.MouseButton1Click:Connect(function()
        currentTheme = themeName
        updateTheme()
    end)
    
    themeY = themeY + 35
end

-- Text Color Selection Panel
local colorPanel = Instance.new("Frame")
colorPanel.Size = UDim2.new(0.48, 0, 0, 280)
colorPanel.Position = UDim2.new(0.52, 0, 0, 160)
colorPanel.BackgroundColor3 = THEMES[currentTheme].panel
colorPanel.BackgroundTransparency = 0.2
colorPanel.BorderSizePixel = 0
colorPanel.Parent = settingsContent

local colorPanelCorner = Instance.new("UICorner")
colorPanelCorner.CornerRadius = UDim.new(0, 12)
colorPanelCorner.Parent = colorPanel

local colorPanelStroke = Instance.new("UIStroke")
colorPanelStroke.Color = THEMES[currentTheme].accent
colorPanelStroke.Thickness = 2
colorPanelStroke.Parent = colorPanel

local colorLabel = Instance.new("TextLabel")
colorLabel.Size = UDim2.new(1, 0, 0, 40)
colorLabel.Position = UDim2.new(0, 0, 0, 10)
colorLabel.BackgroundTransparency = 1
colorLabel.Text = "🌈 TEXT COLORS"
colorLabel.Font = Enum.Font.GothamBold
colorLabel.TextColor3 = THEMES[currentTheme].accent
colorLabel.TextSize = 18
colorLabel.Parent = colorPanel

-- Color buttons
local colorY = 60
for colorName, colorValue in pairs(TEXT_COLORS) do
    local colorButton = Instance.new("TextButton")
    colorButton.Size = UDim2.new(1, -20, 0, 30)
    colorButton.Position = UDim2.new(0, 10, 0, colorY)
    colorButton.BackgroundColor3 = currentTextColor == colorName and colorValue or THEMES[currentTheme].panel
    colorButton.BackgroundTransparency = currentTextColor == colorName and 0.2 or 0.5
    colorButton.BorderSizePixel = 0
    colorButton.Text = colorName
    colorButton.Font = Enum.Font.GothamSemibold
    colorButton.TextColor3 = colorValue
    colorButton.TextSize = 14
    colorButton.Parent = colorPanel
    
    local colorButtonCorner = Instance.new("UICorner")
    colorButtonCorner.CornerRadius = UDim.new(0, 8)
    colorButtonCorner.Parent = colorButton
    
    if currentTextColor == colorName then
        local selectedStroke = Instance.new("UIStroke")
        selectedStroke.Color = colorValue
        selectedStroke.Thickness = 2
        selectedStroke.Parent = colorButton
    end
    
    colorButton.MouseButton1Click:Connect(function()
        currentTextColor = colorName
        updateTextColor()
    end)
    
    colorY = colorY + 25
end

-- About Tab Content
local aboutContent = Instance.new("Frame")
aboutContent.Size = UDim2.new(1, 0, 1, 0)
aboutContent.BackgroundTransparency = 1
aboutContent.Visible = currentTab == "About"
aboutContent.Parent = contentArea

local aboutPanel = Instance.new("Frame")
aboutPanel.Size = UDim2.new(1, 0, 1, 0)
aboutPanel.BackgroundColor3 = THEMES[currentTheme].panel
aboutPanel.BackgroundTransparency = 0.3
aboutPanel.BorderSizePixel = 0
aboutPanel.Parent = aboutContent

local aboutCorner = Instance.new("UICorner")
aboutCorner.CornerRadius = UDim.new(0, 15)
aboutCorner.Parent = aboutPanel

local aboutText = Instance.new("TextLabel")
aboutText.Size = UDim2.new(1, -40, 1, -40)
aboutText.Position = UDim2.new(0, 20, 0, 20)
aboutText.BackgroundTransparency = 1
aboutText.Text = [[
💀 UGINITY ULTIMATE EDITION 💀

🔥 THE MOST POWERFUL UI EVER CREATED 🔥

⚡ Features:
• 6 Premium Themes with Glassmorphism
• 10 Epic Text Colors
• Smooth Tab Animations
• Particle Effects
• Glow Effects
• Professional Design

👑 Created by: k1ngBloodit
🎨 Theme System: Shizo Engine
💫 Effects: Ultimate Graphics

🌟 EXPERIENCE THE POWER 🌟
]]
aboutText.Font = Enum.Font.GothamBold
aboutText.TextColor3 = THEMES[currentTheme].text
aboutText.TextSize = 16
aboutText.TextWrapped = true
aboutText.TextYAlignment = Enum.TextYAlignment.Top
aboutText.Parent = aboutPanel

-- Functions
function updateTheme()
    local theme = THEMES[currentTheme]
    
    -- Update main elements
    mainContainer.BackgroundColor3 = theme.background
    glowFrame.BackgroundColor3 = theme.glow
    glassStroke.Color = theme.accent
    
    -- Update header
    title.TextColor3 = TEXT_COLORS[currentTextColor]
    glowText1.TextColor3 = theme.glow
    glowText2.TextColor3 = theme.glow
    
    -- Update tabs
    tabPanel.BackgroundColor3 = theme.panel
    tabStroke.Color = theme.accent
    
    for tabName, button in pairs(tabButtons) do
        button.TextColor3 = theme.text
        if currentTab == tabName then
            button.BackgroundColor3 = theme.accent
            button.BackgroundTransparency = 0.2
        else
            button.BackgroundColor3 = theme.panel
            button.BackgroundTransparency = 0.8
        end
    end
    
    -- Update settings
    settingsTitle.TextColor3 = theme.accent
    devText.TextColor3 = theme.text
    devCredits.BackgroundColor3 = theme.panel
    devStroke.Color = theme.accent
    themeLabel.TextColor3 = theme.accent
    colorLabel.TextColor3 = theme.accent
    themePanel.BackgroundColor3 = theme.panel
    colorPanel.BackgroundColor3 = theme.panel
    themePanelStroke.Color = theme.accent
    colorPanelStroke.Color = theme.accent
    
    -- Update about
    aboutText.TextColor3 = theme.text
    aboutPanel.BackgroundColor3 = theme.panel
    
    -- Update particles
    for _, particle in pairs(particles) do
        particle.BackgroundColor3 = theme.glow
    end
end

function updateTextColor()
    title.TextColor3 = TEXT_COLORS[currentTextColor]
    mainText.TextColor3 = TEXT_COLORS[currentTextColor]
end

function switchTab(newTab)
    if currentTab == newTab then return end
    
    -- Get current and new content
    local currentContent = currentTab == "Welcome" and welcomeContent or 
                          currentTab == "Settings" and settingsContent or aboutContent
    local newContent = newTab == "Welcome" and welcomeContent or 
                      newTab == "Settings" and settingsContent or aboutContent
    
    -- Animate out current tab
    TweenService:Create(currentContent, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Position = UDim2.new(-1, 0, 0, 0)
    }):Play()
    
    -- Update current tab
    currentTab = newTab
    
    -- Animate in new tab
    newContent.Position = UDim2.new(1, 0, 0, 0)
    newContent.Visible = true
    
    TweenService:Create(newContent, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()
    
    -- Hide old content after animation
    spawn(function()
        wait(0.3)
        currentContent.Visible = false
        currentContent.Position = UDim2.new(0, 0, 0, 0)
    end)
    
    updateTheme()
end

-- Tab functionality
for tabName, button in pairs(tabButtons) do
    button.MouseButton1Click:Connect(function()
        switchTab(tabName)
    end)
end

-- Ultimate animations
spawn(function()
    while gui.Parent do
        -- Glow pulsing
        TweenService:Create(glowFrame, TweenInfo.new(2, Enum.EasingStyle.Sine), {
            BackgroundTransparency = 0.6
        }):Play()
        wait(2)
        TweenService:Create(glowFrame, TweenInfo.new(2, Enum.EasingStyle.Sine), {
            BackgroundTransparency = 0.9
        }):Play()
        wait(2)
    end
end)

-- Particle animation
spawn(function()
    while gui.Parent do
        for _, particle in pairs(particles) do
            if particle.Parent then
                local newX = math.random() * 0.8 + 0.1
                local newY = math.random() * 0.8 + 0.1
                
                TweenService:Create(particle, TweenInfo.new(
                    math.random(30, 60) / 10,
                    Enum.EasingStyle.Sine
                ), {
                    Position = UDim2.new(newX, 0, newY, 0),
                    BackgroundTransparency = math.random(60, 95) / 100
                }):Play()
            end
        end
        wait(3)
    end
end)

-- Text pulsing
spawn(function()
    while gui.Parent do
        TweenService:Create(mainText, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
            TextSize = 52
        }):Play()
        wait(1.5)
        TweenService:Create(mainText, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
            TextSize = 48
        }):Play()
        wait(1.5)
    end
end)

-- Initialize
updateTheme()
updateTextColor()

-- Epic entrance animation
mainContainer.Size = UDim2.new(0, 0, 0, 0)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)

TweenService:Create(mainContainer, TweenInfo.new(1.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 900, 0, 700),
    Position = UDim2.new(0.5, -450, 0.5, -350)
}):Play()

print("🔥 UGINITY ULTIMATE EDITION LOADED! 🔥")
print("💀 MOST POWERFUL UI EVER CREATED 💀")
print("👑 Created by k1ngBloodit 👑")
