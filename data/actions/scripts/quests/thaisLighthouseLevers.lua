local ladderPos = Position(32225, 32276, 8)
local portalPos = Position(32232, 32276, 9)

local function revertLever(leverPosition)
	local leverItem = Tile(leverPosition):getItemById(1946)
	if leverItem then
		leverItem:transform(1945)
	end

	local teleportItem = Tile(portalPos):getItemById(1387)
	if teleportItem then
		teleportItem:remove()
	end

	return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- first lever to open the ladder
	if item.uid == 31269 then
		local laddertile
		if item.itemid == 1945 then
			laddertile = Tile(ladderPos):getItemById(351)
			if laddertile then
				laddertile:transform(369)
			end
		else
			laddertile = Tile(ladderPos):getItemById(369)
			if laddertile then
				laddertile:transform(351)
			end
		end
	-- second lever to open the portal to cyclops
	elseif item.uid == 31270 then
		local teleportTile
		if item.itemid == 1945 then
			teleportTile = Tile(portalPos):getItemById(1387)
			if not teleportTile then
				local portal = Game.createItem(1387, 1, Position(32232, 32276, 9))
				if portal then
					portal:setDestination(Position(32225, 32274, 10))
					e = addEvent(revertLever, 5 * 60 * 1000, toPosition)
				end
			end
		else
			teleportTile = Tile(portalPos):getItemById(1387)
			if teleportTile then
				teleportTile:remove()
				stopEvent(e)
			end
		end
	end

	item:transform(item.itemid == 1946 and 1945 or 1946)
	return true
end