local config = {
	[1945] = {
		sacrifices = {
			{position = Position(32878, 32270, 14), itemId = 2016},
			{position = Position(32881, 32267, 14), itemId = 2168},
			{position = Position(32881, 32273, 14), itemId = 6300},
			{position = Position(32884, 32270, 14), itemId = 1487}
		},
		wells = {
			{position = Position(32874, 32263, 14), itemId = 3729, transformId = 3733},
			{position = Position(32875, 32263, 14), itemId = 3730, transformId = 3734},
			{position = Position(32874, 32264, 14), itemId = 3731, transformId = 3735},
			{position = Position(32875, 32264, 14), itemId = 3732, transformId = 3736}
		}
	},
	[1946] = {
		wells = {
			{position = Position(32874, 32263, 14), itemId = 3733, transformId = 3729},
			{position = Position(32875, 32263, 14), itemId = 3734, transformId = 3730},
			{position = Position(32874, 32264, 14), itemId = 3735, transformId = 3731},
			{position = Position(32875, 32264, 14), itemId = 3736, transformId = 3732}
		}
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem = config[item.itemid]
	item:transform(item.itemid == 1945 and 1946 or 1945)

	local wellItem
	for i = 1, #useItem.wells do
		local well = useItem.wells[i]
		wellItem = Tile(well.position):getItemById(well.itemId)
		if wellItem then
			wellItem:transform(well.transformId)
		end
	end

	if useItem.sacrifices then
		local sacrificeItems, sacrificeItem = true
		for i = 1, #useItem.sacrifices do
			local sacrifice = useItem.sacrifices[i]
			sacrificeItem = Tile(sacrifice.position):getItemById(sacrifice.itemId)
			if not sacrificeItem then
				sacrificeItems = false
				break
			end
		end

		if not sacrificeItems then
			return true
		end

		local stonePosition = Position(32881, 32270, 14)
		local stoneItem = Tile(stonePosition):getItemById(1355)
		if stoneItem then
			stoneItem:transform(1387, 1)
			stoneItem:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, 31247)
			stonePosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end