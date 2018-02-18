function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getItemCount(1970) >= 1 then
		if item.uid == 31083 then
			player:teleportTo(Position(32791, 32327, 10))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		elseif item.uid == 31084 then
			player:teleportTo(Position(32791, 32331, 10))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end
