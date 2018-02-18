local config = {
	[6087] = {storage = 1053, text = 'first'},
	[6088] = {storage = 1054, text = 'second'},
	[6089] = {storage = 1055, text = 'third'},
	[6090] = {storage = 1056, text = 'fourth'}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	if player:getStorageValue(useItem.storage) ~= 1 then
		player:setStorageValue(useItem.storage, 1)
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have learned the ".. useItem.text .." part of a hymn.")
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		item:remove(1)
	else
		player:sendTextMessage(MESSAGE_STATUS_WARNING, "You already know the ".. useItem.text .." verse of the hymn.")
	end

	return true
end