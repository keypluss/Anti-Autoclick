--[[
	//Made by @keypluss
	//GitHub: https://github.com/keypluss/Anti-Autoclick
	//Version: 1.0
	//Updates: none lol
	//TODO:
	put in startergui
	blame me for lazy scripting
]]
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local RefreshRate = 5 --Time that the recorded clicks refresh
local MaxiumClicks = 50 --Change this if you want
local ClicksRecorded = 0 --Don't change this

function RecordClick()
	ClicksRecorded = ClicksRecorded + 1
    wait(RefreshRate)
	ClicksRecorded = 0
end	

UserInputService.InputBegan:Connect(function(Button)
	if Button.UserInputType == Enum.UserInputType.MouseButton1 or Button.UserInputType == Enum.UserInputType.MouseButton2 then
	RecordClick()
	end
end)



RunService.RenderStepped:Connect(function()
	if ClicksRecorded == MaxiumClicks then
		LocalPlayer:Kick("AutoClick Detected")
	end
end)