local words = {
	'YOU ARE DREAMING !',
	'WAKE UP !',
	'TIC TAC',
	'TAC',
	'TIC'
}

function onStepIn(creature, item, position, fromPosition)
	position.x = position.x + math.random(-3, 3)
	position.y = position.y + math.random(-3, 3)
	local player = creature:getPlayer()
	for i = 1, 3 do
		player:say(words[math.random(#words)], TALKTYPE_MONSTER_SAY, false, 0, position)
	end
	return true
end