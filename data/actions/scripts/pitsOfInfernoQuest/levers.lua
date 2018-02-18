local text = {
	[1] = 'first', [2] = 'second', [3] = 'third', [4] = 'fourth', [5] = 'fifth',
	[6] = 'sixth', [7] = 'seventh', [8] = 'eighth', [9] = 'ninth', [10] = 'tenth',
	[11] = 'eleventh', [12] = 'twelfth', [13] = 'thirteenth', [14] = 'fourteenth', [15] = 'fifteenth'
}

local stonePositions = {
	Position(32851, 32333, 12),
	Position(32852, 32333, 12)
}

local function createStones()
	for i = 1, #stonePositions do
		Game.createItem(1304, 1, stonePositions[i])
	end

	Game.setStorageValue(101)
end

local function revertLever(position)
	local leverItem = Tile(position):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end

	if Game.getStorageValue(101) > 0 then
		Game.setStorageValue(101, Game.getStorageValue(101) - 1)
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 1945 then
		return false
	end

	if item.uid > 31091 and item.uid < 31106 then
		if (Game.getStorageValue(101) or -1) < 0 then
			Game.setStorageValue(101, 0)
		end

		local number = item.uid - 31090
		if (Game.getStorageValue(101) + 1) ~= number then
			return false
		end

		Game.setStorageValue(101, number)
		player:say('You flipped the ' .. text[number] .. ' lever. Hurry up and find the next one!', TALKTYPE_MONSTER_SAY)
	elseif item.uid == 31106 then
		if Game.getStorageValue(101) ~= 15 then
			player:say('The final lever won\'t budge... yet.', TALKTYPE_MONSTER_SAY)
			return true
		end

		local stone
		for i = 1, #stonePositions do
			stone = Tile(stonePositions[i]):getItemById(1304)
			if stone then
				stone:remove()
				stonePositions[i]:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			end
		end

		addEvent(createStones, 15 * 60 * 1000)
	end

	item:transform(1946)
	addEvent(revertLever, 15 * 60 * 1000, toPosition)
	return true
end