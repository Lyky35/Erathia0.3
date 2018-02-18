function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(2024) == 7 and player:getStorageValue(2028) ~= 1 then
		player:setStorageValue(2028, 1)
	end

	player:say("!-! -O- I_I (/( --I Morgathla", TALKTYPE_MONSTER_SAY)
	return true
end