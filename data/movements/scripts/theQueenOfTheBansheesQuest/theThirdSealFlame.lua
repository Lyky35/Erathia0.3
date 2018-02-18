local config = {
	[0] = 31068,
	[1] = 31069,
	[2] = 31070,
	[3] = 31071,
	[4] = 31072,

	basinPositions = {
		Position(32214, 31850, 15),
		Position(32215, 31850, 15),
		Position(32216, 31850, 15)
	},

	switchPositions = {
		Position(32220, 31846, 15),
		Position(32220, 31845, 15),
		Position(32220, 31844, 15),
		Position(32220, 31843, 15),
		Position(32220, 31842, 15)
	},

	destination = Position(32271, 31857, 15)
}

local function resetItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(1004) >= 1 or Game.getStorageValue(100) ~= 5 then
		player:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	player:setStorageValue(1004, 1)
	Game.setStorageValue(100, 0)
	player:teleportTo(config.destination)
	config.destination:sendMagicEffect(CONST_ME_TELEPORT)

	for i = 1, #config.basinPositions do
		resetItem(config.basinPositions[i], 1484, 1485)
	end

	for i = 1, #config.switchPositions do
		resetItem(config.switchPositions[i], 1945, 1946)
	end

	return true
end