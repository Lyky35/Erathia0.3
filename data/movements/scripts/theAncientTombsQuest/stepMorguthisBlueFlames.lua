local config = {
	[31201] = 1025,
	[31202] = 1026,
	[31203]	= 1027,
	[31204]	= 1028,
	[31205] = 1029,
	[31206] = 1030,
	[31207] = 1031
}

function onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
	if not player then
		return
	end

	local tableTarget = config[item.uid]
	if player:getStorageValue(tableTarget) ~= 1 then
		player:setStorageValue(tableTarget, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end