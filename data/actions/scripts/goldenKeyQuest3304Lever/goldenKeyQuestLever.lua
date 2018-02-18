local ovenPosition = Position(32790, 31594, 7)

local function resetScript(position, leverPosition)
	local item = Tile(position):getItemById(1787)
	if not item then
		Game.createItem(1787, 1, position)
	end

	local item = Tile(leverPosition):getItemById(1946)
	if item then
		item:transform(1945)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = ovenPosition:getTile()
	if not tile then
		return
	end
		
	local thing = tile:getItemById(1787)
	if thing then
		thing:remove()
		ovenPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		Game.createItem(1787, 1, ovenPosition)
	end

	addEvent(resetScript, 30 * 1000, ovenPosition, toPosition)
	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end