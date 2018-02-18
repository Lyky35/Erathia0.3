	local base = 45
	local variation = 10

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

function onGetFormulaValues(cid, level, maglevel)
	local min = math.max((base - variation), ((3 * maglevel + 2 * level) * (base - variation) / 100))
	local max = math.max((base + variation), ((3 * maglevel + 2 * level) * (base + variation) / 100))
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
