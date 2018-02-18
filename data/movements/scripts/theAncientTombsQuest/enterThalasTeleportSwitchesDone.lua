function onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return
	end

	if Game.getStorageValue(102) < 8 then
		player:teleportTo(fromPosition, true)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return
	end	

	player:teleportTo(Position(33367, 32805, 14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end