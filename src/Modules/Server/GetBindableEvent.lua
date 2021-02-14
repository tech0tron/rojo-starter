--- Provides getting bindable events

local require = require(game:GetService("ReplicatedStorage"):WaitForChild("Nevermore"))

-- BindableEvents are stored on ServerStorage as opposed to ReplicatedStorage to avoid any debauchery
local ServerStorage = game:GetService("ServerStorage")
local RunService = game:GetService("RunService")

-- Normally this would be put into ResourceConstants, but as this isn't in the Nevermore Engine files, we just put it here :)
local BINDABLE_EVENT_STORAGE_NAME = "BindableEvents"

if not RunService:IsRunning() then
	return function(name)
		local event = Instance.new("BindableEvent")
		event.Name = "Mock" .. name

		return event
	end
elseif RunService:IsServer() then
	return function(name)
		assert(type(name) == "string")

		print("Bindable event starts")
		local storage = ServerStorage:FindFirstChild(BINDABLE_EVENT_STORAGE_NAME)
		if not storage then
			storage = Instance.new("Folder")
			storage.Name = BINDABLE_EVENT_STORAGE_NAME
			storage.Parent = ServerStorage
		end

		local event = storage:FindFirstChild(name)
		if event then
			print("Bindable event found already")
			return event
		end

		event = Instance.new("BindableEvent")
		event.Name = name
		event.Parent = storage
		
		print("No we didnt find it, so we created one!")
		return event
	end
end