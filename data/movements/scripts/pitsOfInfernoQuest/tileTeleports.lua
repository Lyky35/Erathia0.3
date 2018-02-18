local config = {
	[31111] = Position(32838, 32304, 9),
	[31112] = Position(32839, 32320, 9),
	[31113] = Position(32844, 32310, 9),
	[31114] = Position(32847, 32307, 9),
	[31115] = Position(32856, 32306, 9),
	[31116] = Position(32827, 32308, 9),
	[31117] = Position(32840, 32317, 9),
	[31118] = Position(32855, 32296, 9),
	[31119] = Position(32857, 32307, 9),
	[31120] = Position(32856, 32289, 9),
	[31121] = Position(32843, 32313, 9),
	[31122] = Position(32861, 32320, 9),
	[31123] = Position(32841, 32323, 9),
	[31124] = Position(32847, 32287, 9),
	[31125] = Position(32854, 32323, 9),
	[31126] = Position(32855, 32304, 9),
	[31127] = Position(32841, 32323, 9),
	[31128] = Position(32861, 32317, 9),
	[31129] = Position(32827, 32314, 9),
	[31130] = Position(32858, 32296, 9),
	[31131] = Position(32861, 32301, 9),
	[31132] = Position(32855, 32321, 9),
	[31133] = Position(32855, 32320, 9),
	[31134] = Position(32855, 32318, 9),
	[31135] = Position(32855, 32319, 9)
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
	
	player:teleportTo(targetPosition)
	return true
end
