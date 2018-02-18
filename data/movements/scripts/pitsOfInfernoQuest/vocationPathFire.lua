local tiles = {
	[30024] = {voc = 1, damage = 300},
	[30025] = {voc = 1, damage = 600},
	[30026] = {voc = 1, damage = 1200},
	[30027] = {voc = 1, damage = 2400},
	[30028] = {voc = 1, damage = 3600},
	[30029] = {voc = 1, damage = 7200},
	
	[30018] = {voc = 2, damage = 300},
	[30019] = {voc = 2, damage = 600},
	[30020] = {voc = 2, damage = 1200},
	[30021] = {voc = 2, damage = 2400},
	[30022] = {voc = 2, damage = 3600},
	[30023] = {voc = 2, damage = 7200},
	
	[30030] = {voc = 3, damage = 300},
	[30031] = {voc = 3, damage = 600},
	[30032] = {voc = 3, damage = 1200},
	[30033] = {voc = 3, damage = 2400},
	[30034] = {voc = 3, damage = 3600},
	[30035] = {voc = 3, damage = 7200},
	
	[30012] = {voc = 4, damage = 300},
	[30013] = {voc = 4, damage = 600},
	[30014] = {voc = 4, damage = 1200},
	[30015] = {voc = 4, damage = 2400},
	[30016] = {voc = 4, damage = 3600},
	[30017] = {voc = 4, damage = 7200}
}


function onStepIn(creature, item, position, fromPosition)
	local targetTiles = tiles[item.actionid]
	if not targetTiles then
		return
	end

	if not isInArray({targetTiles.voc, targetTiles.voc + 4}, Player(cid):getVocation():getId()) then
		doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -targetTiles.damage, -targetTiles.damage, CONST_ME_HITBYFIRE)
	else
		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, CONST_ME_HITBYFIRE)
	end
	return true
end
