local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't give much attention to rumours."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibianus is the shepherd of the lost souls of the so called Thaian empire."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibianus is the shepherd of the lost souls of the so called Thaian empire."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibianus is the shepherd of the lost souls of the so called Thaian empire."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Kazzan Ibn Gadral, caliph of Darama."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the caliph of the children of Daraman."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A caliph is a leader of his people, just like a king."})
keywordHandler:addKeyword({'hpw are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am fine, thank you."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our people are well prepared to fight for their land and their souls."})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our people are well prepared to fight for their land and their souls."})
keywordHandler:addKeyword({'enem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The necromancers of Drefia fell under the wrath of the djinns once. If they challenge us again they might lose more than a city."})
keywordHandler:addKeyword({'drefia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When the djinns destroyed the better part of the unholy town in their wrath, the brotherhood hid like worms in the sand."})
keywordHandler:addKeyword({'brotherhood'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "he Brotherhood of Bones came here fleeing some war on the continent. They corrupted the settlers of the Thaian colony with ease."})
keywordHandler:addKeyword({'minotaur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The minotaurs are another test we have to endure. They inhabit the pyramid which is taboo for our people, as Daraman taught us."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Daraman led our ancestors to the continent Darashia to live a life of simplicity and meditation."})
keywordHandler:addKeyword({'taboo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Daraman knew our souls might get corupted by the things hidden there."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I will not entrust foreigners with any quest. Live amongst us for some years and listen to Daraman's teachings and we will see."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I will not entrust foreigners with any quest. Live amongst us for some years and listen to Daraman's teachings and we will see."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods are powerful but it's ultimately up to us to work on our souls' ascension."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once a djinn claimed to have seen it in a dream. I guess it's just that, some dream of a supernatural creature."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have lost contact with the dwarf people of Kazordoon."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have lost contact with the dwarf people of Kazordoon."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We keep in touch with the queen but did not take sides in the conflict of Carlin and Thais ... yet."})

local guardCondition = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
guardCondition:setParameter(CONDITION_PARAM_DELAYED, 10)
guardCondition:addDamage(10, 3000, -10)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local npc = Npc()
	if isInArray(swear, msg) then
		npc:say("Take this!", TALKTYPE_SAY)
		npc:getPosition():sendDistanceEffect(player:getPosition(), CONST_ANI_FIRE)
		player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
		player:addCondition(guardCondition)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
