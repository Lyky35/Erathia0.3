function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(1083) > 8 then
		player:teleportTo(Position(32786, 32308, 15))
	else
		player:teleportTo(fromPosition)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'To enter Pumin\'s domain you must gain permission from the bureaucrats.')
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end