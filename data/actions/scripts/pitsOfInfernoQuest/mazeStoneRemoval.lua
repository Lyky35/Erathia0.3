local function resetScript(item, position)
	Game.createItem(1304, 1, position)
	item:transform(1945)
end

local stonePosition = Position(32849, 32281, 10)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return
	end
	
	if item.uid == 31136 then
		toPosition.x = toPosition.x - 1
		toPosition.y = toPosition.y + 1
	
		local stone = Tile(toPosition):getItemById(1304)
		if stone then
			stone:remove()
			addEvent(resetScript, 30 * 60 * 1000, item, toPosition)
		end
	else
		local bigStone = Tile(stonePosition):getItemById(1304)
		if bigStone then
			bigStone:remove()
			stonePosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			addEvent(resetScript, 30 * 60 * 1000, item, stonePosition)
		end
	end
	item:transform(1946)
	return true
end