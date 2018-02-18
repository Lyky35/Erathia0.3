function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addHealth(player:getMaxHealth())
	player:addMana(player:getMaxMana())
	player:say('You feel very refreshed and relaxed.', TALKTYPE_MONSTER_SAY)
	return true
end