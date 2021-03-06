-- PlotUI Story
-- Tech0tron
-- 03/05/2021

--// Nevermore init
local require = require(game:GetService('ReplicatedStorage'):WaitForChild('Nevermore'))

--// Services

--// Modules
local Roact = require('Roact')
local PlotUI = require('PlotUI')

local e = Roact.createElement

return function(target)
  local PlotUIUI = Roact.mount(e(PlotUI), target)

  return function()
    Roact.unmount(PlotUIUI)
  end
end