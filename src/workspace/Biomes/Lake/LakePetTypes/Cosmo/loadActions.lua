local loader = {}

local LocalPlayer = game.Players.LocalPlayer

local AbilityUI = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("AbilityGUI")
local actionmodule = require(AbilityUI.Source.CoreFunctionality.Actions)

local actions = {
	["self"] = {
		["Hurt Face"] = function()
			actionmodule.create("Hurt Face", "change_texture", "76562812231178") -- id is placeholder
		end, -- fixed lolz!!!
		["Shy Face"] = function()
			actionmodule.create("Shy Face", "change_texture", "84828130590735") -- id is placeholder
		end,
		["Sad Face"] = function()
			actionmodule.create("Sad Face", "change_texture", "99436085130686") -- id is placeholder
		end,
		["Angry Face"] = function()
			actionmodule.create("Angry Face", "change_texture", "81708429726326") -- id is placeholder
		end,
		["Freaky.. Face"] = function()
			actionmodule.create("Freaky.. Face", "change_texture", "111668448527081") -- id is placeholder
		end,
		["Normal Face"] = function()
			actionmodule.create("Normal Face", "change_texture", "18594789595") -- just in case it messes up
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
