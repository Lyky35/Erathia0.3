local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)

local area = createCombatArea(AREA_BEAM6, AREADIAGONAL_BEAM6)
combat:setArea( area)

function onGetFormulaValues(cid, level, maglevel)
	min = -((level / 5) + (maglevel * 3.6) + 22)
	max = -((level / 5) + (maglevel * 6) + 37)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end
