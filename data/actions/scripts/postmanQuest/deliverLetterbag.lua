function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid ~= 31288 then
		return false
	end

	if player:getStorageValue(2013) == 2 then
		player:setStorageValue(2013, 3)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
		item:transform(1993)
	end

	return true
end