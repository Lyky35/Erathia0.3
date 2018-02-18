function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local thing = Tile(toPosition):getItemById(2016, 2)
	if thing then
		thing:remove()
		player:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
		player:teleportTo(Position(32791, 32332, 10))
		player:say('Muahaha..', TALKTYPE_MONSTER_SAY)
		Position(32791, 32332, 10):sendMagicEffect(CONST_ME_MORTAREA)
	end
	return true
end
