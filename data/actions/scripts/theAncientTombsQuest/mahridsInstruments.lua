local instruments = {
	[2367] = {value = 1},
	[2373] = {value = 2},
	[2370] = {value = 3},
	[2372] = {value = 4},
	[2369] = {value = 5}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(1024) == 1 then
		return false
	end

	local itemTarget = instruments[item.itemid]
	if not itemTarget then
		player:setStorageValue(1023, 0)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You played them wrong, now you must begin with first again!')
		player:addHealth(-20)
		player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
		return false
	end
		
	if player:getStorageValue(1023) < itemTarget.value then
		player:setStorageValue(1023, itemTarget)
		fromPosition:sendMagicEffect(CONST_ME_SOUND_BLUE)
	elseif player:getStorageValue(1023) == 5 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You played them in correct order and got the access through door!")
		player:setStorageValue(1024, 1)
	end
	return true
end