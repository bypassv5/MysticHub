local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local MysticGui = {}

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

function MysticGui.init()
	local MainFrame = Instance.new("ScrollingFrame", ScreenGui)
	MainFrame.Name = "MainFrame"
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderSizePixel = 0
	MainFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	MainFrame.ScrollBarThickness = 6
	MainFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	MainFrame.ClipsDescendants = true
	MainFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Instance.new("UIAspectRatioConstraint", MainFrame).AspectRatio = 1.75
	
	local layout = Instance.new("UIListLayout", MainFrame)
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.Padding = UDim.new(0, 15)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	
	local Spacer = Instance.new("Frame", MainFrame)
	Spacer.Size = UDim2.new(1, 0, 0.02, 0)
	Spacer.BackgroundTransparency = 1
	Spacer.LayoutOrder = 0
end

function MysticGui:MakeButton(Name, Tags, Function)
	local Holder = Instance.new("Frame", ScreenGui.MainFrame)
	Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Holder.Size = UDim2.new(0.8, 0, 0.8, 0)
	Holder.AnchorPoint = Vector2.new(0.5, 0)
	Holder.Position = UDim2.new(0.5, 0, 0, 0)
	Holder.BorderSizePixel = 0
	Holder.Name = Name .. "_Holder"
	Instance.new("UIAspectRatioConstraint", Holder).AspectRatio = 10
	local stroke = Instance.new("UIStroke", Holder)
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Thickness = 2

	local Button = Instance.new("TextButton", Holder)
	Button.BackgroundTransparency = 1
	Button.Size = UDim2.new(1, 0, 0.7, 0)
	Button.Position = UDim2.new(0, 0, 0, 0)
	Button.TextScaled = true
	Button.Text = Name
	Button.Name = Name
	Button.Font = Enum.Font.FredokaOne
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.BorderSizePixel = 0

	local TextSizeConstraint = Instance.new("UITextSizeConstraint", Button)
	TextSizeConstraint.MaxTextSize = 36
	TextSizeConstraint.MinTextSize = 10

	Button.MouseButton1Click:Connect(function()
		loadstring(Function)()
	end)

	local TagsLabel = Instance.new("TextLabel", Holder)
	TagsLabel.Size = UDim2.new(1, 0, 0.3, 0)
	TagsLabel.Position = UDim2.new(0, 0, 0.7, 0)
	TagsLabel.BackgroundTransparency = 1
	TagsLabel.TextScaled = true
	TagsLabel.Text = Tags
	TagsLabel.Font = Enum.Font.FredokaOne
	TagsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	TagsLabel.BorderSizePixel = 0

	local TagTextConstraint = Instance.new("UITextSizeConstraint", TagsLabel)
	TagTextConstraint.MaxTextSize = 18
	TagTextConstraint.MinTextSize = 8
end

return MysticGui, MysticGui.init()
