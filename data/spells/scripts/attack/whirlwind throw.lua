local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(cid, skill, attack, factor)
	local skillTotal, levelTotal = skill * attack, Player(cid):getLevel() / 5
	return -(((skillTotal * 0.01) + 1) + (levelTotal)), -(((skillTotal * 0.03) + 6) + (levelTotal))
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end

