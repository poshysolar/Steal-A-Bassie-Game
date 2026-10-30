local loader = {}

local LocalPlayer = game.Players.LocalPlayer

local AbilityUI = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("AbilityGUI")
local actionmodule = require(AbilityUI.Source.CoreFunctionality.Actions)

local actions = {
	["self"] = {
		["Hurt Face"] = function()
			actionmodule.create("Hurt Face", "change_texture", "140696443195245") -- id is placeholder
		end, -- fixed lolz!!!
		["Happiest Face"] = function()
			actionmodule.create("Happiest Face", "change_texture", "96683506062387") -- id is placeholder
		end,
		["Scared Face"] = function()
			actionmodule.create("Scared Face", "change_texture", "131518850613430") -- id is placeholder
		end,
		["AHHHHHHH! Face"] = function()
			actionmodule.create("AHHHHHHH! Face", "change_texture", "117546539931997") -- id is placeholder
		end,
		["Mad Face"] = function()
			actionmodule.create("Mad Face", "change_texture", "123335533571646") -- id is placeholder
		end,
		["Sad Face"] = function()
			actionmodule.create("Sad Face", "change_texture", "97935902499954") -- id is placeholder
		end,
		["Cute Face"] = function()
			actionmodule.create("Adorable Face", "change_texture", "133309109352316") -- id is placeholder
		end,
		["Normal Face"] = function()
			actionmodule.create("Normal Face", "change_texture", "18715447688") -- just in case it messes up
		end,
	}
}

function loader.load()
	actionmodule.clear()
	if actions["self"] then
		for name, actionFunc in pairs(actions["self"]) do
			actionFunc()
		end
	end
end

return loader
