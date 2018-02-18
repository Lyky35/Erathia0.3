function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(1006) == 1 and player:getStorageValue(1007) ~= 1 then
		if item.itemid == 5114 then
			item:transform(item.itemid + 1)
			player:teleportTo(toPosition, true)
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
	end		
	return true
end
