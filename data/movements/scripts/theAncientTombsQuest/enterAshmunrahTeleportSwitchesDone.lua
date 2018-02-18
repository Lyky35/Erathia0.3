function onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return
	end

	if Game.getStorageValue(112) < 6 then
		player:teleportTo(fromPosition, true)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return
	end	

	player:teleportTo(Position(33198, 32885, 11))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end