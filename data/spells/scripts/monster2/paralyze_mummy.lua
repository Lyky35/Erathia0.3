local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 10*1000)
condition:setFormula(0, -80, 0, -240)
combat:setCondition(condition)

function onCastSpell(cid, var)
	return combat:execute(creature, var)
end