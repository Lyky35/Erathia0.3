local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)

local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(10, 3000, -50)

local area = createCombatArea(AREA_CROSS6X6)
combat:setArea(area)
combat:setCondition(condition)

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end