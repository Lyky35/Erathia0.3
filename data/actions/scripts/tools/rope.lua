local holeId = {
	294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 430, 462, 469, 470, 482,
	484, 485, 489, 924, 3135, 3136, 7933, 7938, 8170, 8286, 8285, 8284, 8281,
	8280, 8279, 8277, 8276, 8323, 8567, 8585, 8596, 8595, 8249, 8250, 8251,
	8252, 8253, 8254, 8255, 8256, 8972, 9606, 9625, 13190, 14461, 19519, 21536
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local tile = Tile(toPosition)
	if isInArray(ropeSpots, tile:getGround():getId()) or tile:getItemById(14435) then
		player:teleportTo(toPosition:moveUpstairs(), false)
		return true
	elseif isInArray(holeId, target.itemid) then
		toPosition.z = toPosition.z + 1
		tile = Tile(toPosition)
		if tile then
			local thing = tile:getTopVisibleThing()
			if thing:isItem() and thing:getType():isMovable() then
				return thing:moveTo(toPosition:moveUpstairs())
			end
		end
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end
	return false
end
