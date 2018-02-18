local teleports = {
	[31248] = Position(32915, 32263, 14),
	[31249] = Position(32946, 32270, 13),
	[31250] = Position(32976, 32270, 14),
	[31251] = Position(32933, 32282, 13),
	[31252] = Position(32752, 32345, 14),
	[31253] = Position(32752, 32345, 14)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	player:teleportTo(teleports[item.uid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end