function onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return
	end

	for i = 1025, 1031 do
		if player:getStorageValue(i) ~= 1 then
			player:teleportTo(fromPosition, true)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			break
		end
	end

	player:teleportTo(Position(33163, 32694, 14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end