local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit Tibia's shopkeepers to buy their fine wares."})				
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit Tibia's shopkeepers to buy their fine wares."})				
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's my duty to protect the city."})				
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Behave while in the city or we get you! Do you want to know where to find a shop or a guild?"})

local guardCondition = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
guardCondition:setParameter(CONDITION_PARAM_DELAYED, 10)
guardCondition:addDamage(10, 3000, -10)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isInArray(swear, msg) then
		local player = Player(cid)
		local npc = Npc()
		npc:say("Take this!", TALKTYPE_SAY)
		npc:getPosition():sendDistanceEffect(player:getPosition(), CONST_ANI_FIRE)
		player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
		player:addCondition(guardCondition)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "MIND YOUR MANNERS COMMONER! To address the queen greet with her title!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "LONG LIVE THE QUEEN!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE QUEEN!")
npcHandler:addModule(FocusModule:new())