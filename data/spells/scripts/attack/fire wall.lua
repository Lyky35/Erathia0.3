local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_FIREFIELD_PVP_FULL)

local area = createCombatArea(AREA_WALLFIELD, AREADIAGONAL_WALLFIELD)
combat:setArea( area)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end