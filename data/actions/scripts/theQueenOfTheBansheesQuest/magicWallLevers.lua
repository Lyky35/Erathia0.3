local config = {
	[31059] = {position = Position(32259, 31891, 10), revert = true},
	[31060] = {position = Position(32259, 31890, 10), revert = true},
	time = 300
}

local function revertWall(wallPosition, leverPosition)
	local leverItem = Tile(leverPosition):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end

	Game.createItem(1498, 1, wallPosition)
end

local function removeWall(position)
	local wall = Tile(position):getItemById(1498)
	if wall then
		wall:remove()
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	end
end

function onUse(cid, item, position, itemEx, toPosition)
	if item.itemid ~= 1945 then
		player:sendCancelMessage('The lever has already been used.')
		return true
	end

	local wall = config[item.uid]
	removeWall(wall.position)
	if wall.revert then
		addEvent(revertWall, config.time * 1000, wall.position, position)
	end
	item:transform(1946)
	return true
end
