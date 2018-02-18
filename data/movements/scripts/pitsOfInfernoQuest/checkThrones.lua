local config = {
	[31154] = 31141,
	[31155] = 31142,
	[31156] = 31143,
	[31157] = 31144,
	[31158] = 31145,
	[31159] = 31146,
	[31160] = 31147 
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	if player:getStorageValue(config[item.uid]) ~= 1 then
		player:teleportTo(fromPosition, true)
		player:say("You've not absorbed energy from this throne.", TALKTYPE_MONSTER_SAY)
	end
	return true
end