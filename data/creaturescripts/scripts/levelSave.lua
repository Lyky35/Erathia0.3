function onAdvance(player, skill, oldLevel, newLevel)
        if skill == SKILL_LEVEL and newLevel > oldLevel then
		player:save()
	end

	return true
end