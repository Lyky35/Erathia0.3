function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if item.actionid == 30001 then
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	else
		player:teleportTo(Position(32185, 31939, 14))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end		
	return true
end
