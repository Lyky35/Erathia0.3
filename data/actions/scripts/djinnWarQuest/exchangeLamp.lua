function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:removeItem(2344, 1) or (player:getStorageValue(1093) >= 2 or player:getStorageValue(1099) >= 2) then	
		return false
	end

	if item.uid == 31283 then
		player:setStorageValue(1093, 2)
	else
		player:setStorageValue(1099, 2)
	end

	player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have exchanged the lamp.')
	player:addItem(2356, 1)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
	return true
end