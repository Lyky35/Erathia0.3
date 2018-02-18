local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)


local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(2, 4000, -45)
condition:addDamage(2, 4000, -40)
condition:addDamage(2, 4000, -35)
condition:addDamage(2, 4000, -30)
condition:addDamage(3, 5000, -20)
condition:addDamage(3, 5000, -10)
condition:addDamage(3, 5000, -7)
condition:addDamage(3, 5000, -5)
condition:addDamage(4, 5000, -4)
condition:addDamage(6, 5000, -3)
condition:addDamage(9, 5000, -2)
condition:addDamage(12, 5000, -1)

local area = createCombatArea(AREA_CROSS6X6)
combat:setArea(area)
combat:setCondition(condition)


function onGetFormulaValues(cid, level, maglevel)
	min = -((level * 2) + (maglevel * 3)) * 0.9
	max = -((level * 2) + (maglevel * 3)) * 1.5
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end