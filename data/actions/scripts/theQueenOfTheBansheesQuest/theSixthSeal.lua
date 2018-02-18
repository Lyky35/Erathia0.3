function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local campfire = Tile(Position(toPosition.x - 1, toPosition.y, toPosition.z)):getItemById(item.itemid == 1945 and 1423 or 1421)
	if campfire then
		campfire:transform(item.itemid == 1945 and 1421 or 1423)
	end
   
	item:transform(item.itemid == 1945 and 1946 or 1945)
	return true
end