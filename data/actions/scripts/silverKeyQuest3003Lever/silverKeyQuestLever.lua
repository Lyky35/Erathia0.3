local stonePosition = Position(32790, 31594, 7)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = stonePosition:getTile()
	if not tile then
		return
	end
		
	local thing = tile:getItemById(1285)
	if thing then
		thing:remove()
		stonePosition:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		Game.createItem(1285, 1, stonePosition)
	end
	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end