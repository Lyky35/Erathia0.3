local rooms = {
	Position(32316, 32194, 15),
	Position(32328, 32194, 15),
	Position(32340, 32194, 15),
	Position(32352, 32194, 15),
	Position(32364, 32194, 15),
	Position(32376, 32194, 15),
	Position(32578, 32195, 15),
	Position(32316, 32204, 15),
	Position(32328, 32204, 15),
	Position(32340, 32204, 15),
	Position(32352, 32204, 15),
	Position(32364, 32204, 15),
	Position(32376, 32204, 15),
	Position(32316, 32214, 15),
	Position(32328, 32214, 15),
	Position(32340, 32214, 15),
	Position(32352, 32214, 15),
	Position(32364, 32214, 15),
	Position(32376, 32214, 15),
	Position(32316, 32224, 15),
	Position(32328, 32224, 15),
	Position(32340, 32224, 15),
	Position(32352, 32224, 15),
	Position(32364, 32224, 15),
	Position(32376, 32224, 15),
	Position(32316, 32233, 15),
	Position(32328, 32233, 15),
	Position(32340, 32233, 15),
	Position(32352, 32233, 15),
	Position(32364, 32233, 15),
	Position(32376, 32233, 15),
	Position(32316, 32243, 15),
	Position(32328, 32243, 15),
	Position(32340, 32243, 15),
	Position(32352, 32243, 15),
	Position(32364, 32243, 15),
	Position(32316, 32253, 15),
	Position(32328, 32253, 15),
	Position(32340, 32253, 15),
	Position(32352, 32253, 15),
	Position(32364, 32253, 15),
	Position(32376, 32253, 15),
	Position(32316, 32263, 15),
	Position(32328, 32263, 15),
	Position(32340, 32263, 15),
	Position(32352, 32263, 15),
	Position(32364, 32263, 15),
	Position(32376, 32263, 15),
	Position(32316, 32194, 15),
	Position(32328, 32194, 15),
	Position(32340, 32194, 15),
	Position(32352, 32194, 15),
	Position(32364, 32194, 15),
	Position(32376, 32194, 15),
	Position(32316, 32204, 15),
	Position(32328, 32204, 15),
	Position(32340, 32204, 15),
	Position(32352, 32204, 15),
	Position(32364, 32204, 15),
	Position(32376, 32204, 15),
	Position(32316, 32214, 15),
	Position(32328, 32214, 15),
	Position(32340, 32214, 15),
	Position(32352, 32214, 15),
	Position(32364, 32214, 15),
	Position(32376, 32214, 15),
	Position(32316, 32224, 15),
	Position(32328, 32224, 15),
	Position(32340, 32224, 15),
	Position(32352, 32224, 15),
	Position(32364, 32224, 15),
	Position(32376, 32224, 15),
	Position(32316, 32233, 15),
	Position(32328, 32233, 15),
	Position(32340, 32233, 15),
	Position(32352, 32233, 15),
	Position(32364, 32233, 15),
	Position(32376, 32233, 15),
	Position(32316, 32243, 15),
	Position(32328, 32243, 15),
	Position(32340, 32243, 15),
	Position(32352, 32243, 15),
	Position(32364, 32243, 15),
	Position(32376, 32243, 15),
	Position(32316, 32253, 15),
	Position(32328, 32253, 15),
	Position(32340, 32253, 15),
	Position(32352, 32253, 15),
	Position(32364, 32253, 15),
	Position(32376, 32253, 15),
	Position(32316, 32263, 15),
	Position(32328, 32263, 15),
	Position(32340, 32263, 15),
	Position(32352, 32263, 15),
	Position(32364, 32263, 15),
	Position(32376, 32263, 15)
}

local function emptyRoom()
	for i = 1, #rooms do
		if rooms[i]:getTile():getCreatureCount() == 0 then
			return true
		end
	end
	return false
end

local function kickTrainers(cid)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	local kick = false
	player:sendTextMessage(MESSAGE_INFO_DESCR, 'Your training time is over.')
	local playerPos = player:getPosition()
	local specs = Game.getSpectators(playerPos, false, false, 0, 3, 0, 3)
	for i = 1, #specs do
		if specs[i]:getName() == 'Training Monk' then
			kick = true
			break
		end
	end

	if kick then
		player:teleportTo(player:getTown():getTemplePosition())
		playerPos:sendMagicEffect(CONST_ME_TELEPORT)
	end
end

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end

	if item.actionid == 31251 then
		if player:getStorageValue(1086) < os.time() and player:getStorageValue(1085) ~= 1 then
			player:teleportTo(fromPosition, true)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'Go talk with Maximus.')
			return false
		end

		if not emptyRoom() then
			player:teleportTo(fromPosition, true)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'It seems all the training rooms is taken.')
			return false
		end

		for i = 1, #rooms do
			if rooms[i]:getTile():getCreatureCount() == 0 then
				player:teleportTo(rooms[i])
				rooms[i]:sendMagicEffect(CONST_ME_TELEPORT)
				if player:getStorageValue(1085) == 1 then
					if player:getPremiumDays() == 0 then
						player:setStorageValue(1086, os.time() + 2 * 60 * 60) -- 2 hour (Training Time Left)
					else
						player:setStorageValue(1086, os.time() + 3 * 60 * 60) -- 3 hour (Training Time Left)
					end
					player:setStorageValue(1085, 0)
				end

				addEvent(kickTrainers, (player:getStorageValue(1086) - os.time()) * 1000, cid)
				break
			end
		end
	else
		player:teleportTo(player:getTown():getTemplePosition())
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end