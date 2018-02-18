local config = {
	[31225] = Position(33195, 32852, 4),
	[31226] = Position(33192, 32846, 8)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	player:teleportTo(config[item.uid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end