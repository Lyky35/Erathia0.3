function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	if player:getStorageValue(1002) < 1 then
		player:setStorageValue(1002, 1)
		player:teleportTo({x = 32268, y = 31856, z = 15}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo({x = 32185, y = 31939, z = 14}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
