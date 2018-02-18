function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	
	if item.actionid == 30036 then
		if player:getStorageValue(1020) ~= 1 then
			player:setStorageValue(1020, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You discovered a shortcut to the pits of inferno.')
		end
	else
		if player:getStorageValue(1021) ~= 1 then
			player:setStorageValue(1021, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You discovered a shortcut to the pits of inferno.')
		end
	end
	return true
end
