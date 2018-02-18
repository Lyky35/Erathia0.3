local bridgePosition = Position(32801, 32336, 11)

local function resetScript(item)
	local bridge = Tile(bridgePosition):getItemById(5770)
	if bridge then
		bridge:transform(493)
	end
	item:transform(1945)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return true
	end

	local thing = Tile(Position(32800, 32339, 11)):getItemById(2016, 11)
	if thing then
		local water = Tile(bridgePosition):getItemById(493)
		if water then
			water:transform(5770)
			addEvent(resetScript, 10 * 60 * 1000, item, bridgePosition)
			item:transform(1946)
		end
	else
		player:say('The lever is creaking and rusty.', TALKTYPE_MONSTER_SAY)
	end
	return true
end