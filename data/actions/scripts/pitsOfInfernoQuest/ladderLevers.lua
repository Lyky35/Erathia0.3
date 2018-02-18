local positions = {
	[31108] = Position(32861, 32305, 11),
	[31109] = Position(32860, 32313, 11)
}

local function removeBorder(position, itemId)
	local tile = Tile(position):getItemById(itemId)
	if tile then
		tile:remove()
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetPosition = positions[item.uid]
	if item.uid == 31108 then
		local stone = Tile(targetPosition):getItemById(387)
		if stone then
			stone:remove()
		end
	else
		removeBorder(targetPosition, 4810)
		removeBorder(targetPosition, 4808)
		Game.createItem(1284, 1, targetPosition)
	end
	return true
end