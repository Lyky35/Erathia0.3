local function revertLever(position)
	local item = Tile(position):getItemById(1946)
	if item then
		item:transform(1945)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return false
	end

	local ticTacPosition = Position(32838, 32264, 14)
	Game.createItem(2638, 1, ticTacPosition)
	Game.createItem(2639, 1, ticTacPosition)
	ticTacPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)

	item:transform(1946)
	addEvent(revertLever, 4000, toPosition)
	return true
end