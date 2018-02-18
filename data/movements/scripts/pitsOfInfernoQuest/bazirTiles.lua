local config = {
	[31149] = Position(32754, 32365, 15),
	[31150] = Position(32725, 32381, 15),
	[31151] = Position(32827, 32241, 12),
	[31152] = Position(32745, 32394, 14),
	[31153] = Position(32745, 32394, 14)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	player:teleportTo(config[item.actionid])
	return true
end