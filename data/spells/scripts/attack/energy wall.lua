local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_ENERGYFIELD_PVP)

local area = createCombatArea(AREA_WALLFIELD, AREADIAGONAL_WALLFIELD)
combat:setArea( area)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end