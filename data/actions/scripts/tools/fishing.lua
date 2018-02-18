local waterIds = {4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4664, 4665, 4666}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not isInArray(waterIds, target.itemid) then
		return false
	end

	player:addSkillTries(SKILL_FISHING, 1)
	if math.random(1, 100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if not player:removeItem(3976, 1) then
			return true
		end
		player:addItem(2667, 1)
	end

	toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	return true
end
