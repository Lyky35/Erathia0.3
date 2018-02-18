local storages = {1053, 1054, 1055, 1056}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for i = 1, #storages do	
		if player:getStorageValue(storages[i]) ~= 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have not learned all the verses of the hymn.")
			toPosition:sendMagicEffect(CONST_ME_POFF)
			return true
		end
	end

	player:teleportTo(Position(32402, 32794, 9))
	player:say("You have sucessfully played the secret hymn of the cult.", TALKTYPE_MONSTER_SAY)
	toPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
	return true
end