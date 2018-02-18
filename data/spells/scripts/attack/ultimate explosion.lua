	local base = 250
	local variation = 50
local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)

local area = createCombatArea(AREA_CROSS5X5)
combat:setArea( area)

function onGetFormulaValues(cid, level, maglevel)
	local min = math.max((base - variation), ((3 * maglevel + 2 * level) * (base - variation) / 100))
	local max = math.max((base + variation), ((3 * maglevel + 2 * level) * (base + variation) / 100))
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
