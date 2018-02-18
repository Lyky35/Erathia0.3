local positions = {
	Position(33314, 31592, 15), -- stone position
	Position(33316, 31591, 15), -- teleport creation position
	Position(33322, 31592, 14) -- where the teleport takes you
}
 
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local item = positions[1]:getItemById(1355)
		if item then
			item:remove()
		end

		local teleport = Game.createItem(1387, 1, positions[2])
		if teleport then
			teleport:setDestination(t[3])
			positions[2]:sendMagicEffect(CONST_ME_TELEPORT)
		end
	elseif item.itemid == 1946 then
		local item = positions[2]:getItemById(1387)
		if item then
			item:remove()
		end

		positions[2]:sendMagicEffect(CONST_ME_POFF)
		Game.createItem(1355, 1, positions[1])
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end