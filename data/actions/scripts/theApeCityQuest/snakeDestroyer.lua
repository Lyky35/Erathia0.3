function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 4861 then
		return false
	end

	if player:getStorageValue(2024) ~= 17 or player:getStorageValue(2032) == 1 then
		return false
	end

	player:setStorageValue(2032, 1)
	item:remove()
	target:transform(4862)
	target:decay()
	toPosition:sendMagicEffect(CONST_ME_FIREAREA)
	return true
end