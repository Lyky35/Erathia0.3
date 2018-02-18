local pharaohs = {
	['omruc'] = 103,
	['thalas'] = 104,
	['dipthrah'] = 105,
	['mahrdis'] = 106,
	['vashresamun'] = 107,
	['morguthis'] = 108,
	['rahemos'] = 109,
	['ashmunrah'] = 110
}

function onKill(creature, target)
	if not target:isMonster() then
		return true
	end

	local pharaohStorage = pharaohs[target:getName():lower()]
	if not pharaohStorage then
		return
	end

	Game.setStorageValue(pharaohStorage, 1)
	addEvent(Game.setStorageValue, 3 * 60 * 1000, pharaohStorage, 0)
	creature:say('You now have 3 minutes to exit this room through the teleporter. It will bring you to the reward room.', TALKTYPE_MONSTER_SAY)
	return true
end