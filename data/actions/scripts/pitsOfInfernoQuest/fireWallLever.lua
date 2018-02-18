local wallPositions = {
	[31087] = Position(32831, 32333, 11),
	[31090] = Position(32833, 32333, 11),
	[31089] = Position(32835, 32333, 11),
	[31088] = Position(32837, 32333, 11)
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetTable = wallPositions[item.uid]
	if item.itemid == 1945 then
		local wall = Tile(targetTable):getItemById(6289)
		if wall then
			wall:remove()
			targetTable:sendMagicEffect(CONST_ME_FIREAREA)
		end
	else
		Game.createItem(6289, 1, targetTable)
		Position(targetTable):sendMagicEffect(CONST_ME_FIREAREA)
	end
	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
