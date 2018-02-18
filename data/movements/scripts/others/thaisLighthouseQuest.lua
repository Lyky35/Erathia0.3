local stairsPosition = Position(32225, 32282, 9)

function onStepIn(creature, item, position, fromPosition)
	-- create stairs
	if item.uid == 31271 then
		local stairsItem = Tile(stairsPosition):getItemById(424)
		if stairsItem then
			stairsItem:transform(4837)
		end
		Item(item.uid):transform(425)
	end
	return true
end

--stairs disappear if stepout stone tile
function onStepOut(cid, item, position, fromPosition)
	local stairsItem = Tile(stairsPosition):getItemById(4837)
	if stairsItem then
		stairsItem:transform(424)
	end

	Item(item.uid):transform(426)
	return true
end