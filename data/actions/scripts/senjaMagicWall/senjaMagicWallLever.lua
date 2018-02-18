local magicWallPositions = {
	Position(32186, 31626, 8),
	Position(32187, 31626, 8),
	Position(32188, 31626, 8),
	Position(32189, 31626, 8)
}

local function resetScript(positions, lever)
	local item = Tile(positions):getItemById(1498)
	if not item then
		Game.createItem(1498, 1, positions)
	end
	Item(lever.uid):transform(1945)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for i = 1, #magicWallPositions do
		local tile = magicWallPositions[i]:getTile()
		if not tile then
			return
		end
		
		local thing = tile:getItemById(1498)
		if thing then
			thing:remove()
			magicWallPositions[i]:sendMagicEffect(CONST_ME_MAGIC_RED)
		else
			Game.createItem(1498, 1, magicWallPositions[i])
		end
		addEvent(resetScript, 30 * 1000, magicWallPositions[i], item)
	end
	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end