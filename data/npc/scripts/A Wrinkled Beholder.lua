local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local random_texts = {
	'485611800364197.',
	'78572611857643646724.'
}

local rnd_sounds = 0
function onThink()
	if rnd_sounds < os.time() then
		rnd_sounds = (os.time() + 10)
		if math.random(1, 100) < 20 then
			Npc():say(random_texts[math.random(1, #random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

keywordHandler:addKeyword({'death'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, yes, I will kill you soon enough, now let me continue my investigation on you."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They will mourn the day they abandoned us."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the great librarian."})
keywordHandler:addKeyword({'library'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a fine library, isn't it?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am 486486 and NOT 'Blinky' as some people called me ... before they died."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's 1, not 'Tibia', silly."})
keywordHandler:addKeyword({'cyclops'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uglyness incarnate. One eye! Imagine that! Horrible!"})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These fools and their superstitious life cult don't understand anything of importance."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only inferior species need weapons."})
keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard that elves moved in upstairs."})
keywordHandler:addKeyword({'numbers'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Numbers are essential. They are the secret behind the scenes. If you are a master of mathematics you are a master over life and death."})
keywordHandler:addKeyword({'books'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our books are written in 469, of course you can't understand them."})
keywordHandler:addKeyword({'0'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Go and wash your eyes for using this obscene number!"})
keywordHandler:addKeyword({'469'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The language of my kind. Superior to any other language and only to be spoken by entities with enough eyes to blink it."})
keywordHandler:addKeyword({'orcs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Noisy pests."})
keywordHandler:addKeyword({'minotaurs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Their mages are so close to the truth. Closer then they know and closer then it's good for them."})
keywordHandler:addKeyword({'humans'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Good tools to work with ... After their death, that is."})
keywordHandler:addKeyword({'eyes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You pitiful two-eyed creatures. In our eyes, you look weird. It is pathetic how much you depend on hands and legs. Since we bonelords have more eyes than any creature in the world, it is obvious that you can determine the value of a species by the number of its eyes. "})
keywordHandler:addKeyword({'bonelord'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our race is very old. Over the time, we have been given many different names by other races. The term bonelord sticks to us for quite a while now. In our language the name of our race is not fix but a complex formula, and as such it always changes for the subjective viewer. "})
keywordHandler:addKeyword({'language'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our language is beyond comprehension by your lesser beings. It heavily relies on mathemagic. Your brain is not suited for the mathemagical processing necessary to understand our language.To decipher even our most basic texts, it would need a genius that can calculate numbers within seconds in his brain. "})

local condition = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_DELAYED, 10)
condition:addDamage(25, 3000, -10)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "blinky") then
		npc:say("How interesting you are that stupid. Let me apply this on you and see how long you last", TALKTYPE_SAY)
		npc:getPosition():sendDistanceEffect(player:getPosition(), CONST_ANI_FIRE)
		player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
		player:addCondition(condition)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())