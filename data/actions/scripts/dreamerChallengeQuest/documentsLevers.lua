local config = {
	[31263] = {position = Position(32836, 32221, 14), itemId = 7844},
	[31264] = {position = Position(32837, 32229, 14), itemId = 7846},
	[31265] = {position = Position(32833, 32225, 14), itemId = 7845},
	[31266] = {position = Position(32784, 32222, 14), itemId = 7844},
	[31267] = {position = Position(32785, 32230, 14), itemId = 7846},
	[31268] = {position = Position(32781, 32226, 14), itemId = 7845}
}

local function revertLever(position)
	local leverItem = Tile(position):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end
end

function onUse(cid, item, position, itemEx, toPosition)
	local altar = config[item.uid]
	if item.itemid ~= 1945 then
		return true
	end

	local diamondItem = Tile(altar.position):getItemById(2145)
	if not diamondItem then
		return true
	end

	diamondItem:remove(1)
	altar.position:sendMagicEffect(CONST_ME_TELEPORT)
	Game.createItem(altar.itemId, 1, altar.position)
	item:transform(1946)
	addEvent(revertLever, 4 * 1000, position)
	return true
end