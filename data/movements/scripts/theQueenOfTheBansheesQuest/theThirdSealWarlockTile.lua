function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getStorageValue(1008) ~= 1 then
		player:setStorageValue(1008, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		Game.createMonster('Warlock', Position(32215, 31835, 15), false, true)
		Game.createMonster('Warlock', Position(32215, 31840, 15), false, true)
	end	
	return true
end
