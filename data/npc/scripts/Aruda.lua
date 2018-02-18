local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local Price = {}
local rnd_sounds = 0

function onThink()
	if rnd_sounds < os.time() then
		rnd_sounds = os.time() + 10
		if math.random(100) < 20 then
			Npc():say("Hey there, up for a chat?", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function greetCallback(cid)
	if Player(cid):getSex() == PLAYERSEX_FEMALE then
		npcHandler:setMessage(MESSAGE_GREET, "Oh, hello |PLAYERNAME|, your hair looks great! Who did it for you?")
		npcHandler.topic[cid] = 1
	else
		npcHandler:setMessage(MESSAGE_GREET, "Oh, hello, handsome! It's a pleasure to meet you, |PLAYERNAME|. Gladly I have the time to chat a bit.")
		npcHandler.topic[cid] = 0
	end
	Price[cid] = nil
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local npc = Npc()
	local player = Player(cid)
	local Sex = player:getSex()
	if npcHandler.topic[cid] == 1 then
		npc:say("I would never have guessed that.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 2 then
		if player:removeMoney(Price[cid]) then
			npc:say("Oh, sorry, I was distracted, what did you say?", TALKTYPE_SAY)
		else
			npc:say("Oh, I just remember I have some work to do, sorry. Bye!", TALKTYPE_SAY)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		end
		npcHandler.topic[cid] = 0
		Price[cid] = nil
	elseif npcHandler.topic[cid] == 3 and player:removeItem(2036, 1) then
		npc:say("Take some time to talk to me!", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 4 and (msgcontains(msg, "spouse") or msgcontains(msg, "girlfriend")) then
		npc:say("Well ... I have met him for a little while .. but this was nothing serious.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 5
	elseif npcHandler.topic[cid] == 5 and msgcontains(msg, "fruit") then
		npc:say("I remember that grapes were his favourites. He was almost addicted to them.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "how") and msgcontains(msg, "are") and msgcontains(msg, "you") then
		npc:say("Thank you very much. How kind of you to care about me. I am fine, thank you.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "sell") then
		npc:say("Sorry, I have nothing to sell.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "job") or msgcontains(msg, "chat") then
		npc:say("I do some work now and then. Nothing unusual, though. So I have plenty time to chat. If you are interested in any topic just ask me.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "name") then
		if Sex == PLAYERSEX_FEMALE then
			npc:say("I am Aruda.", TALKTYPE_SAY)
		else
			npc:say("I am a little sad, that you seem to have forgotten me, handsome. I am Aruda.", TALKTYPE_SAY)
		end
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "aruda") then
		if Sex == PLAYERSEX_FEMALE then
			npc:say("Yes, that's me!", TALKTYPE_SAY)
		else
			npc:say("Oh, I like it, how you say my name.", TALKTYPE_SAY)
		end
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "time") then
		npc:say("Please don't be so rude to look for the time if you are talking to me.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "help") then
		npc:say("I am deeply sorry, I can't help you.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "monster") or msgcontains(msg, "dungeon") then
		npc:say("UH! What a terrifying topic. Please let us speak about something more pleasant, I am a weak and small woman after all.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "sewer") then
		npc:say("What gives you the impression, I am the kind of women, you find in sewers?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "god") then
		npc:say("You should ask about that in one of the temples.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "king") then
		npc:say("The king, that lives in this fascinating castle? I think he does look kind of cute in his luxurious robes, doesn't he?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 10
	elseif msgcontains(msg, "sam") then
		if Sex == PLAYERSEX_FEMALE then
			npc:say("He is soooo strong! What muscles! What a body! Did you ask him for a date?", TALKTYPE_SAY)
		else
			npc:say("He is soooo strong! What muscles! What a body! On the other hand, compared to you he looks quite puny.", TALKTYPE_SAY)
		end
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "benjamin") then
		npc:say("He is a little simple minded but always nice and well dressed.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "gorn") then
		npc:say("He should really sell some stylish gowns or something like that. We Tibians never get some clothing of the latest fashion. It's a shame.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "quentin") then
		npc:say("I don't understand this lonely monks. I love company too much to become one. Hehehe!", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "bozo") then
		npc:say("Oh, isn't he funny? I could listen to him the whole day.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "oswald") then
		npc:say("As far as I know, he is working in the castle.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "rumour") or msgcontains(msg, "rumor") or msgcontains(msg, "gossip") then
		npc:say("I am a little shy and so don't hear many rumors.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "kiss") and Sex == PLAYERSEX_MALE then
		npc:say("Oh, you little devil, stop talking like that! <blush>", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 20
	elseif msgcontains(msg, "weapon") then
		npc:say("I know only little about weapons. Can you tell me something about them, please?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "magic") then
		npc:say("I believe that love is stronger than magic, don't you agree?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "thief") or msgcontains(msg, "theft") then
		npc:say("Oh, sorry, I have to hurry, bye!", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
		Price[cid] = nil
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif msgcontains(msg, "tibia") then
		npc:say("I would like to visit the beach more often, but I guess it's too dangerous.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "castle") then
		npc:say("I love this castle! It's so beautiful.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "muriel") then
		npc:say("Powerful sorcerers frighten me a little.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "elane") then
		npc:say("I personally think it's inappropriate for a woman to become a warrior, what do you think about that?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "marvik") then
		npc:say("Druids seldom visit a town, what do you know about druids?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "gregor") then
		npc:say("I like brave fighters like him.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "noodles") then
		npc:say("Oh, he is sooooo cute!", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "dog") or msgcontains(msg, "poodle") then
		npc:say("I like dogs, the little ones at least. Do you like dogs, too?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 5
	elseif msgcontains(msg, "excalibug") then
		npc:say("Oh, I am just a girl and know nothing about magic swords and such things.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
		Price[cid] = 10
	elseif msgcontains(msg, "partos") then
		npc:say("I ... don't know someone named like that.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 4
		Price[cid] = nil
	elseif msgcontains(msg, "yenny") then
		npc:say("Yenny? I know no Yenny, nor have I ever used that name! You have mistook me with someone else.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
		Price[cid] = nil
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "I hope to see you soon.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|. I really hope we'll talk again soon.")

npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())