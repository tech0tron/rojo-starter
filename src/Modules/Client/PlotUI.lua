-- PlotUI Class
-- Tech0tron
-- 03/05/2021

--// Nevermore init
local require = require(game:GetService('ReplicatedStorage'):WaitForChild('Nevermore'))

--// Services
local Players = game:GetService("Players")

--// Modules
local Roact = require('Roact')
local Flipper = require('Flipper')
local RoactFlipper = require('RoactFlipper')

local e = Roact.createElement

local PlotUI = Roact.Component:extend('PlotUI')

function PlotUI:init()
    -- Plot types:
    -- "unclaimed": No one is claiming plot
    -- "selfClaimed": Plot is claimed by local player
    -- "notSelfClaimed": Plot is claimed by someone other than local player
    -- Owner: User ID of the plot owner, should be sent with the zone enter event and stuff.
    self:setState({
        owner = Players.LocalPlayer.UserId,
        plotType = "selfClaimed"
    })
end

function PlotUI:render()
    local childrenOfFrame = {}
    local contentFrame = {}

    if self.state.plotType == "unclaimed" then
        table.insert(childrenOfFrame, e("TextButton", {
            AnchorPoint = Vector2.new(0.5,0.5),
            Position = UDim2.new(0.5,0,0.5,0),
            Size = UDim2.new(.66, 0, .33, 0),
            Text = "Claim Plot",
            BackgroundColor3 = Color3.fromRGB(0, 221, 18),
            TextSize = 36,
            Font = Enum.Font.GothamBold,
            BorderSizePixel = 0
        }, {
            corner = e("UICorner", {
                CornerRadius = UDim.new(0,25)
            })
        }))
    end
    
    if self.state.plotType == "notSelfClaimed" then
        table.insert(childrenOfFrame, e("ImageLabel", {
            Image = "rbxthumb://type=AvatarHeadShot&id=" .. self.state.owner .. "&w=150&h=150",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.16,0,0.5,0),
            Size = UDim2.new(0,100,0,100),
            BackgroundColor3 = Color3.fromRGB(255,255,255)
        }, {
            corner = e("UICorner", {
                CornerRadius = UDim.new(0.5,0)
            })
        }))
        table.insert(contentFrame, e("TextLabel", {
            AnchorPoint = Vector2.new(0,0),
            Position = UDim2.new(0,0,0,0),
            Size = UDim2.new(1, 0, .33, -10),
            Text = Players.LocalPlayer.Name .. " | Level 15",
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = Enum.Font.GothamBold,
            BorderSizePixel = 0
        }))
    end

    if self.state.plotType == "selfClaimed" then
        table.insert(childrenOfFrame, e("ImageLabel", {
            Image = "rbxthumb://type=AvatarHeadShot&id=" .. self.state.owner .. "&w=150&h=150",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0.16,0,0.5,0),
            Size = UDim2.new(0,100,0,100),
            BackgroundColor3 = Color3.fromRGB(255,255,255)
        }, {
            corner = e("UICorner", {
                CornerRadius = UDim.new(0.5,0)
            })
        }))

        table.insert(contentFrame, e("TextLabel", {
            AnchorPoint = Vector2.new(0,0),
            Position = UDim2.new(0,0,0,0),
            Size = UDim2.new(1, 0, .33, -10),
            Text = Players.LocalPlayer.Name .. " | Level 15",
            BackgroundTransparency = 1,
            TextScaled = true,
            Font = Enum.Font.GothamBold,
            BorderSizePixel = 0
        }))

        table.insert(contentFrame, e("TextButton", {
            AnchorPoint = Vector2.new(0,0),
            Position = UDim2.new(0,0,.33,0),
            Size = UDim2.new(1, 0, .33, -10),
            Text = "Upgrade Plot",
            BackgroundColor3 = Color3.fromRGB(0, 221, 18),
            TextSize = 36,
            Font = Enum.Font.GothamBold,
            BorderSizePixel = 0
        }, {
            corner = e("UICorner", {
                CornerRadius = UDim.new(0,25)
            })
        }))

        table.insert(contentFrame, e("TextButton", {
            AnchorPoint = Vector2.new(0,0),
            Position = UDim2.new(0,0,.66,0),
            Size = UDim2.new(1, 0, .33, -10),
            Text = "Unclaim Plot",
            BackgroundColor3 = Color3.fromRGB(221,0, 18),
            TextSize = 36,
            Font = Enum.Font.GothamBold,
            BorderSizePixel = 0
        }, {
            corner = e("UICorner", {
                CornerRadius = UDim.new(0,25)
            })
        }))
    end

    table.insert(childrenOfFrame, e("Frame", {
        Position = UDim2.new(0.33,0,.1),
        Size = UDim2.new(.66,0,.8,0),
        BackgroundTransparency = 1
    }, contentFrame))

    return e("Frame", {
        Size = UDim2.new(0,400,0,175),
        BorderMode = Enum.BorderMode.Outline,
        Position = UDim2.new(0,50,0,50),
        BorderColor3 = Color3.fromRGB(240, 91, 46),
        BackgroundColor3 = Color3.fromRGB(255,255,255),
        BorderSizePixel = 15
    }, childrenOfFrame)
end

return PlotUI