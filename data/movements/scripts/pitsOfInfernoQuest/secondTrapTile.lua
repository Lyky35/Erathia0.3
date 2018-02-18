function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	
	player:teleportTo(Position(32827, 32272, 12))
	player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	Game.createItem(1285, 1, Position(fromPosition.x, fromPosition.y, fromPosition.z))
	return true
end
