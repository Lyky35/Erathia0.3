local function doTransformCoalBasins(cbPos)
        local coalBasin = Tile(cbPos):getItemById(1485)
        if coalBasin then
        	coalBasin:transform(1484)
        end
end

local config = {
	[0] = 31068,
	[1] = 31069,
	[2] = 31070,
	[3] = 31071,
	[4] = 31072,
	coalBasins = {
		Position(32214, 31850, 15),
		Position(32215, 31850, 15),
		Position(32216, 31850, 15)
	},
	effects = {
		[0] = {
			Position(32217, 31845, 14),
			Position(32218, 31845, 14),
			Position(32219, 31845, 14),
			Position(32220, 31845, 14),
			Position(32217, 31843, 14),
			Position(32218, 31842, 14),
			Position(32219, 31841, 14)
		},
		[1] = {
			Position(32217, 31844, 14),
			Position(32218, 31844, 14),
			Position(32219, 31843, 14),
			Position(32220, 31845, 14),
			Position(32219, 31845, 14)
		},
		[2] = {
			Position(32217, 31842, 14),
			Position(32219, 31843, 14),
			Position(32219, 31845, 14),
			Position(32218, 31844, 14),
			Position(32217, 31844, 14),
			Position(32217, 31845, 14)
		},
		[3] = {
			Position(32217, 31845, 14),
			Position(32218, 31846, 14),
			Position(32218, 31844, 14),
			Position(32219, 31845, 14),
			Position(32220, 31846, 14)
		},
		[4] = {
			Position(32219, 31841, 14),
			Position(32219, 31842, 14),
			Position(32219, 31846, 14),
			Position(32217, 31843, 14),
			Position(32217, 31844, 14),
			Position(32217, 31845, 14),
			Position(32218, 31843, 14),
			Position(32218, 31845, 14)
		},
	},
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(1004) ~= 1 then
		local globalStorage = Game.getStorageValue(100)
		local table = config[globalStorage]
		if item.uid == table then
			item:transform(1945)
			Game.setStorageValue(100, math.max(1, globalStorage + 1))
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			for i = 1, #config.effects[globalStorage] do
				Position(config.effects[globalStorage][i]):sendMagicEffect(CONST_ME_ENERGYHIT)
			end
			if globalStorage == 4 then
				for i = 1, #config.coalBasins do
					doTransformCoalBasins(config.coalBasins[i])
				end
			end
		else
			toPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
		end
	else
		return false
	end
	return true
end
