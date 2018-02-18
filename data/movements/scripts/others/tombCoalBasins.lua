local config = {
	[31181] = {flamePosition = Position(33097, 32816, 13), toPosition = Position(33093, 32824, 13)},
	[31182] = {flamePosition = Position(33293, 32742, 13), toPosition = Position(33299, 32742, 13)},
	[31183] = {flamePosition = Position(33073, 32590, 13), toPosition = Position(33080, 32588, 13)},
	[31184] = {flamePosition = Position(33240, 32856, 13), toPosition = Position(33246, 32850, 13)},
	[31185] = {flamePosition = Position(33276, 32553, 14), toPosition = Position(33271, 32553, 14)},
	[31186] = {flamePosition = Position(33234, 32692, 13), toPosition = Position(33234, 32687, 13)},
	[31187] = {flamePosition = Position(33135, 32683, 12), toPosition = Position(33130, 32683, 12)},
	[31188] = {flamePosition = Position(33162, 32831, 10), toPosition = Position(33156, 32832, 10)}
}

function onAddItem(moveitem, tileitem, position)
	if moveitem.itemid ~= 2159 then
		position:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	Item(moveitem.uid):remove(1)
	position:sendMagicEffect(CONST_ME_FIREAREA)

	local targetCoalBasin = config[tileitem.uid]
	local creature = Tile(targetCoalBasin.flamePosition):getTopCreature()
	if not creature or not creature:isPlayer() then
		return
	end

	creature:teleportTo(targetCoalBasin.toPosition)
	targetCoalBasin.toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end