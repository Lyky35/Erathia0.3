local config = {
	[31217] = Position(33072, 32589, 13),
	[31218] = Position(33097, 32815, 13),
	[31219] = Position(33137, 32683, 12),
	[31220] = Position(33162, 32832, 10),
	[31221] = Position(33234, 32693, 13),
	[31222] = Position(33239, 32856, 13),
	[31223] = Position(33277, 32553, 14),
	[31224] = Position(33291, 32742, 13)
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