local effectPositions = {
	Position(32861, 32239, 9),
	Position(32860, 32238, 9),
	Position(32860, 32237, 9),
	Position(32861, 32236, 9)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if item.uid == 31232 then
		if not player:removeItem(2684, 1) then
			player:teleportTo(fromPosition, true)
			doAreaCombatHealth(cid, COMBAT_FIREDAMAGE, fromPosition, 0, -10, -20, CONST_ME_HITBYFIRE)
			return true
		end

		player:teleportTo(Position(32861, 32235, 9))
	elseif item.uid == 31233 then
		player:teleportTo(Position(32861, 32240, 9))
	end

	for i = 1, #effectPositions do
		effectPositions[i]:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end