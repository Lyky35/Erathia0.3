	local base = 170
	local variation = 45
	
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)

local conditionParalyze = Condition(CONDITION_PARALYZE)
conditionParalyze:setParameter(CONDITION_PARAM_TICKS, 20000)
conditionParalyze:setFormula(0, -60, 0, -100)


local conditionPoison = Condition(CONDITION_POISON)
conditionPoison:setParameter(CONDITION_PARAM_DELAYED, 1)
conditionPoison:addDamage(1, 4000, -120)
conditionPoison:addDamage(2, 4000, -80)
conditionPoison:addDamage(3, 4000, -60)
conditionPoison:addDamage(4, 4000, -30)
conditionPoison:addDamage(5, 5000, -20)
conditionPoison:addDamage(6, 5000, -10)
conditionPoison:addDamage(7, 5000, -8)
conditionPoison:addDamage(8, 5000, -4)
conditionPoison:addDamage(9, 5000, -2)
conditionPoison:addDamage(10, 5000, -1)

local area = createCombatArea(AREA_CROSS6X6)
combat:setArea(area)
combat:setCondition(conditionPoison)
combat:setCondition(conditionParalyze)


function onGetFormulaValues(cid, level, maglevel)
	local min = math.max((base - variation), ((3 * maglevel + 2 * level) * (base - variation) / 200))
	local max = math.max((base + variation), ((3 * maglevel + 2 * level) * (base + variation) / 150))
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end