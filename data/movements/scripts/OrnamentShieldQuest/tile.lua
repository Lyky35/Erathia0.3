local tile = Tile(Position({x = 32771, y = 32297, z = 10}))
function onStepIn(creature, item, position, fromPosition)

	if creature:isPlayer() and creature:isInGhostMode() then
		return true
	end

	if tile:getItemById(387) then
			tile:getItemById(387):remove()
	end
	return true
end

function onStepOut(creature, item, position, fromPosition)
	if creature:isPlayer() and creature:isInGhostMode() then
		return true
	end
	Game.createItem(387, 1, {x = 32771, y = 32297, z = 10})
	return true
end

