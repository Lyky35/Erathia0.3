local config = {
	[31254] = {storageValue = 1, toPosition = Position(32750, 32344, 14)}, -- Dream Realm
	[31255] = {storageValue = 1, toPosition = Position(32360, 31782, 7)}, -- Carlin
	[31256] = {storageValue = 1, toPosition = Position(32369, 32241, 7)}, -- Thais
	[31257] = {storageValue = 2, toPosition = Position(32649, 31925, 11)}, -- Kazo
	[31258] = {storageValue = 2, toPosition = Position(32732, 31634, 7)}, -- Ab
	[31259] = {storageValue = 2, toPosition = Position(32181, 32436, 7)}, -- Fibula
	[31260] = {storageValue = 4, toPosition = Position(33213, 32454, 1)}, -- Darashia
	[31261] = {storageValue = 4, toPosition = Position(33194, 32853, 8)}, -- Ankrahmun
	[31262] = {storageValue = 4, toPosition = Position(32417, 32139, 15)} -- Mintwalin
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player:removeItem(5022, 1) then
		player:teleportTo(config[item.uid].toPosition)
	else
		player:teleportTo(fromPosition, true)
	end

	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end