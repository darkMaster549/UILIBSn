local IGINITY = {}

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Main GUI Setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "IGINITY_HUB"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Floating Button
local openBtn = Instance.new("TextButton", screenGui)
openBtn.Text = "IGINITY✨"
openBtn.Size = UDim2.new(0, 60, 0, 60)
openBtn.Position = UDim2.new(0, 20, 0.5, -30)
openBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Font = Enum.Font.GothamBlack
openBtn.TextSize = 13
openBtn.Draggable = true
openBtn.Active = true
openBtn.ZIndex = 999

Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)

-- Main UI
local Main = Instance.new("Frame", screenGui)
Main.Size = UDim2.new(0, 480, 0, 310)
Main.Position = UDim2.new(0.5, -240, 0.5, -155)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.BorderSizePixel = 0
Main.Visible = false
Main.ClipsDescendants = true
Main.ZIndex = 10
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

-- Sidebar (Tabs)
local TabFrame = Instance.new("Frame", Main)
TabFrame.Size = UDim2.new(0, 110, 1, -30)
TabFrame.Position = UDim2.new(0, 0, 0, 0)
TabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", TabFrame)

local TabList = Instance.new("UIListLayout", TabFrame)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 4)

-- Content Area
local ContentFrame = Instance.new("Frame", Main)
ContentFrame.Size = UDim2.new(1, -120, 1, -40)
ContentFrame.Position = UDim2.new(0, 120, 0, 10)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ClipsDescendants = true

-- Bottom Logo
local logo = Instance.new("TextLabel", Main)
logo.Text = "[✨IGINITY HUB✨]"
logo.Size = UDim2.new(1, 0, 0, 25)
logo.Position = UDim2.new(0, 0, 1, -25)
logo.TextColor3 = Color3.fromRGB(0, 255, 255)
logo.Font = Enum.Font.GothamBold
logo.TextSize = 14
logo.BackgroundTransparency = 1

-- Tab Creation
function IGINITY:CreateTab(name)
	local tabBtn = Instance.new("TextButton", TabFrame)
	tabBtn.Text = name
	tabBtn.Size = UDim2.new(1, -10, 0, 35)
	tabBtn.Position = UDim2.new(0, 5, 0, 5)
	tabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	tabBtn.TextColor3 = Color3.new(1, 1, 1)
	tabBtn.Font = Enum.Font.Gotham
	tabBtn.TextSize = 14
	Instance.new("UICorner", tabBtn)

	local page = Instance.new("ScrollingFrame", ContentFrame)
	page.Size = UDim2.new(1, 0, 1, 0)
	page.CanvasSize = UDim2.new(0, 0, 0, 0)
	page.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	page.ScrollBarThickness = 6
	page.Visible = false
	page.BorderSizePixel = 0

	local layout = Instance.new("UIListLayout", page)
	layout.Padding = UDim.new(0, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end)

	tabBtn.MouseButton1Click:Connect(function()
		for _, child in pairs(ContentFrame:GetChildren()) do
			if child:IsA("ScrollingFrame") then
				child.Visible = false
			end
		end
		page.Visible = true
	end)

	return page
end

-- ELEMENT: Label
function IGINITY:CreateLabel(tab, text)
	local lbl = Instance.new("TextLabel", tab)
	lbl.Text = text
	lbl.Size = UDim2.new(1, -10, 0, 25)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = Color3.new(1, 1, 1)
	lbl.Font = Enum.Font.Gotham
	lbl.TextSize = 14
end

-- ELEMENT: Button
function IGINITY:CreateButton(tab, text, callback)
	local btn = Instance.new("TextButton", tab)
	btn.Text = text
	btn.Size = UDim2.new(1, -10, 0, 35)
	btn.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 14
	Instance.new("UICorner", btn)
	btn.MouseButton1Click:Connect(function()
		pcall(callback)
	end)
end

-- ELEMENT: Toggle
function IGINITY:CreateToggle(tab, text, default, callback)
	local toggled = default
	local frame = Instance.new("Frame", tab)
	frame.Size = UDim2.new(1, -10, 0, 30)
	frame.BackgroundTransparency = 1

	local box = Instance.new("TextButton", frame)
	box.Size = UDim2.new(0, 30, 1, 0)
	box.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
	box.Text = ""
	Instance.new("UICorner", box)

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, -40, 1, 0)
	label.Position = UDim2.new(0, 40, 0, 0)
	label.Text = text
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.Gotham
	label.TextSize = 14
	label.TextXAlignment = Enum.TextXAlignment.Left

	box.MouseButton1Click:Connect(function()
		toggled = not toggled
		box.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
		pcall(callback, toggled)
	end)
end

-- ELEMENT: Slider
function IGINITY:CreateSlider(tab, name, min, max, default, callback)
	local frame = Instance.new("Frame", tab)
	frame.Size = UDim2.new(1, -10, 0, 45)
	frame.BackgroundTransparency = 1

	local label = Instance.new("TextLabel", frame)
	label.Size = UDim2.new(1, 0, 0, 20)
	label.Text = name .. ": " .. default
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.Gotham
	label.TextSize = 14
	label.BackgroundTransparency = 1

	local slider = Instance.new("Frame", frame)
	slider.Size = UDim2.new(1, 0, 0, 15)
	slider.Position = UDim2.new(0, 0, 0, 25)
	slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Instance.new("UICorner", slider)

	local fill = Instance.new("Frame", slider)
	fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
	fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
	Instance.new("UICorner", fill)

	local dragging = false

	slider.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
	end)
	slider.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
	end)
	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local scale = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
			fill.Size = UDim2.new(scale, 0, 1, 0)
			local value = math.floor(min + (max - min) * scale)
			label.Text = name .. ": " .. value
			pcall(callback, value)
		end
	end)
end

-- ELEMENT: Dropdown
function IGINITY:CreateDropdown(tab, title, list, callback)
	local frame = Instance.new("Frame", tab)
	frame.Size = UDim2.new(1, -10, 0, 40)
	frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	Instance.new("UICorner", frame)

	local drop = Instance.new("TextButton", frame)
	drop.Size = UDim2.new(1, 0, 1, 0)
	drop.Text = title
	drop.TextColor3 = Color3.new(1, 1, 1)
	drop.Font = Enum.Font.Gotham
	drop.TextSize = 14
	drop.BackgroundTransparency = 1

	local open = false
	local listFrame = Instance.new("ScrollingFrame", tab)
	listFrame.Size = UDim2.new(1, -10, 0, 100)
	listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	listFrame.ScrollBarThickness = 6
	listFrame.Visible = false
	listFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Instance.new("UICorner", listFrame)

	local layout = Instance.new("UIListLayout", listFrame)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		listFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end)

	for _, opt in ipairs(list) do
		local optBtn = Instance.new("TextButton", listFrame)
		optBtn.Size = UDim2.new(1, 0, 0, 25)
		optBtn.Text = opt
		optBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		optBtn.TextColor3 = Color3.new(1, 1, 1)
		optBtn.Font = Enum.Font.Gotham
		optBtn.TextSize = 14
		Instance.new("UICorner", optBtn)

		optBtn.MouseButton1Click:Connect(function()
			drop.Text = title .. ": " .. opt
			listFrame.Visible = false
			open = false
			pcall(callback, opt)
		end)
	end

	drop.MouseButton1Click:Connect(function()
		open = not open
		listFrame.Visible = open
	end)
end

-- Open/Close Toggle Animation
local open = false
openBtn.MouseButton1Click:Connect(function()
	open = not open
	Main.Visible = open
end)

return IGINITY
