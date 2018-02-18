local config = {
	[31272] = 1,
	[31273] = 2,
	[31274] = 3,
	[31275] = 4,
	[31276] = 5,
	[31277] = 7,
	[31278] = 8,
	[31279] = 9,
	[31280] = 10,
	[31281] = 11,
	[31282] = 12
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local town = Town(config[item.uid])
	local templePosition = town:getTemplePosition()
	player:setTown(town)
	player:teleportTo(templePosition)
	templePosition:sendMagicEffect(CONST_ME_TELEPORT)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You are now a citizen of ' .. town:getName() .. '.')
	return true
end