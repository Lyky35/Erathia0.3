local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 15*1000)
condition:setFormula(0, -100, 0, -200)
combat:setCondition(condition)

function onCastSpell(cid, var)
	return combat:execute(creature, var)
end