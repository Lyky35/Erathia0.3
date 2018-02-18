local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function onTargetCorpse(cid, pos)
	local position = pos
	local tile = position:getTile()
	if tile then
		local corpse = tile:getTopDownItem()
		if corpse then
			local itemType = corpse:getType()
			if itemType:isCorpse() and itemType:isMovable() then
				local monster = Game.createMonster("Skeleton", position)
				if monster then
					corpse:remove()
					monster:setMaster(cid)
					position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
				end
			end
		end
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetCorpse")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
