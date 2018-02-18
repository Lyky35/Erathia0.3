function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 1945 then
		local stone = Tile(Position(32827, 32273, 11)):getItemById(1285)
		if stone then
			stone:remove()
		end
	end

	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end