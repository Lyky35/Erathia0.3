local config = {
	[31141] = {text = 'You have touched Infernatil\'s throne and absorbed some of his spirit.', effect = CONST_ME_FIREAREA, toPosition = Position(32909, 32211, 15)},
	[31142] = {text = 'You have touched Tafariel\'s throne and absorbed some of his spirit.', effect = CONST_ME_MORTAREA, toPosition = Position(32761, 32243, 15)},
	[31143] = {text = 'You have touched Verminor\'s throne and absorbed some of his spirit.', effect = CONST_ME_POISONAREA, toPosition = Position(32840, 32327, 15)},
	[31144] = {text = 'You have touched Apocalypse\'s throne and absorbed some of his spirit.', effect = CONST_ME_EXPLOSIONAREA, toPosition = Position(32875, 32267, 15)},
	[31145] = {text = 'You have touched Bazir\'s throne and absorbed some of his spirit.', effect = CONST_ME_MAGIC_GREEN, toPosition = Position(32745, 32385, 15)},
	[31146] = {text = 'You have touched Ashfalor\'s throne and absorbed some of his spirit.', effect = CONST_ME_FIREAREA, toPosition = Position(32839, 32310, 15)},
	[31147] = {text = 'You have touched Pumin\'s throne and absorbed some of his spirit.', effect = CONST_ME_MORTAREA, toPosition = Position(32785, 32279, 15)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local useThrone = config[item.uid]

	if player:getStorageValue(item.uid) ~= 1 then
		player:setStorageValue(item.uid, 1)
		player:getPosition():sendMagicEffect(useThrone.effect)
		player:say(useThrone.text, TALKTYPE_MONSTER_SAY)
	else
		player:teleportTo(useThrone.toPosition)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		player:say('Begone!', TALKTYPE_MONSTER_SAY)
	end
	return true
end
