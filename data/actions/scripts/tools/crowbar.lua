local function revertCask(position)
	local caskItem = Tile(position):getItemById(2249)
	if caskItem then
		caskItem:transform(5539)
		position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 0 or target.actionid == 0 then
		return destroyItem(player, target, toPosition)
	end

	if target.uid == 31285 then
		if player:getStorageValue(2006) == 1 then
			player:setStorageValue(2006, 2)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	
	elseif target.actionid == 31255 then
		local storage = player:getStorageValue(2030)
		if storage < 3 then
			player:setStorageValue(2030, math.max(0, storage) + 1)
			target:transform(2249)
			toPosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			addEvent(revertCask, 3 * 60 * 1000, toPosition)
		end
	end

	return true
end