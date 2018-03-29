local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
 
local condition = Condition(CONDITION_ATTRIBUTES)
   condition:setParameter(CONDITION_PARAM_TICKS, 20000)
   condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 80)
   condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 80)
   condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 80)
   condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, 80)
   combat:setCondition(condition)
 
function onCastSpell(cid, var)
   return combat:execute(creature, var)
end
 