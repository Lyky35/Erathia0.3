local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'rune'}, 					Cfblankrune, 10)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Job? JOB? Hey man - I am in prison! But you know - once upon a time - I was a powerful mage! A mage ... come to think of it .., what is that - a mage?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is - uhm - hang on? I knew it yesterday, didn't I? Doesn't matter!"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better save time than comitting a crime. I am a poet and I know it!"})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the mightiest sorcerer from here to there! Yeah!"})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Power. Hmmm. Once while we were crossing the mountains together a man named Aureus said to me that parcels are equal to power. Any idea what that meant?"})
keywordHandler:addKeyword({'books'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have many books in my home. But only powerful people can read them. I bet you will only see three dots after the headline! Hehehe! Hahaha! Excellent!"})
keywordHandler:addKeyword({'mad mage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey! That's me! You got it! Thanks mate - now I remember my name!"})
keywordHandler:addKeyword({'riddle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Great riddle, isn´t it? If you can tell me the correct answer, I will give you something. Hehehe!"})
keywordHandler:addKeyword({'something'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "No! I won´t tell you. Shame coz it would be useful for you - hehehe."})
keywordHandler:addKeyword({'escape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How could I escape? They only give me rotten food here. I can´t regain my powers because I have no mana!"})
keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sure I have the key! Hehehe! Perhaps I will give it to you. IF you can solve my riddle."})
keywordHandler:addKeyword({'mino'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are trying to capture me! Or hang on! Haven't they already captured me? Hmmm - I will have to think about this."})
keywordHandler:addKeyword({'markwin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the worst of them all! He is the king of the minos! May he burn in hell!"})
keywordHandler:addKeyword({'labyrinth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'way'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It´s easy to find your way through it! Just follow the pools of mud. Hehe - useful hint, isn´t it?"})
keywordHandler:addKeyword({'palkar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the leader of the outcasts. I hope he will never conquer the city of Mintwallin. That would be the end of me!"})
keywordHandler:addKeyword({'karl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tataah!"})
keywordHandler:addKeyword({'demon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only monster I cannot conjure. But soon I will be powerful enough!"})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'conjure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})
keywordHandler:addKeyword({'home'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! There are many monsters guarding my home. Only the bravest hero will be able to slay them!"})

local randTable = {
	[1] = "So know that everthing is based on the simple fact that 1 + 1 = 49!",
	[2] = "So know that everthing is based on the simple fact that 1 + 1 = 94!",
	[3] = "So know that everthing is based on the simple fact that 1 + 1 = 13!",
	[4] = "So know that everthing is based on the simple fact that 1 + 1 = 1!"
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "apple") then
		npc:say("Apples! Real apples! Man I love them! Can I have one? Oh please say yes!", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "number") then
		npc:say("My surreal numbers are based on astonishing facts. Are you interested in learning the secret of mathemagics?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'dp') or msgcontains(msg, 'pd') then
		npc:say("Hurray! For that I will give you my key for - hmm - let´s say ... some apples. Interested?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 5
	elseif msgcontains(msg, '') then
		if npcHandler.topic[cid] == 3 then
			npc:say("Very interesting. So are you ready to proceed in you lesson in mathemagics?", TALKTYPE_SAY)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(Cfapple, 1) then
				npc:say("Mnjam. Excellent! Thanks, man!", TALKTYPE_SAY)
			else
				npc:say("Do you want to trick me? You don´t have one lousy apple!", TALKTYPE_SAY)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npc:say("But first tell me your favourite colour please!", TALKTYPE_SAY)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 4 then
			npc:say(randTable[math.random(4)], TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then
			if player:removeItem(Cfapple, 7) then
				npc:say("Mnjam - excellent apples. Now - about that key. You are sure want it?", TALKTYPE_SAY)
				npcHandler.topic[cid] = 6
			else
				npc:say("Get some more apples first!", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 6 then
			npc:say("Really, really?", TALKTYPE_SAY)
			npcHandler.topic[cid] = 7
		elseif npcHandler.topic[cid] == 8 then
			npc:say("Really, really, really, really?", TALKTYPE_SAY)
			npcHandler.topic[cid] = 8
		elseif npcHandler.topic[cid] == 9 then
			npc:say("Then take it and get happy - or die, hehe.", TALKTYPE_SAY)
			local key = player:addItem(Cfsilverkey, 1)
			key:setActionId(3666)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())