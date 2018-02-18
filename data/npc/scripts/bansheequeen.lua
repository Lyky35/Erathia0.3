local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Uhhhhhh....", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "seventh seal") and npcHandler.topic[cid] == 0 then
		npc:say("If you have passed the first six seals and entered the blue fires that lead to the chamber of the seal you might receive my kiss ... It will open the last seal. Do you think you are ready?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "kiss") and npcHandler.topic[cid] == 7 then
		if player:getStorageValue(1006) ~= 1 then
			npc:say("Are you prepared to receive my kiss, even though this will mean that your death as well as a part of your soul will forever belong to me, my dear?", TALKTYPE_SAY)
			npcHandler.topic[cid] = 8
		else
			npc:say("You have already received my kiss. You should know better then to ask for it.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end	
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getStorageValue(1003) == 1 then
				npc:say("Yessss, I can sense you have passed the seal of sacrifice. Have you passed any other seal yet?", TALKTYPE_SAY)
				npcHandler.topic[cid] = 2
			else
				npc:say("You have not passed the seal of sacrifice yet. Return to me when you are better prepared.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(1000) == 1 then
				npc:say("I sense you have passed the hidden seal as well. Have you passed any other seal yet?", TALKTYPE_SAY)
				npcHandler.topic[cid] = 3
			else
				npc:say("You have not found the hidden seal yet. Return when you are better prepared.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			if player:getStorageValue(1005) == 1 then
				npc:say("Oh yes, you have braved the plague seal. Have you passed any other seal yet?", TALKTYPE_SAY)
				npcHandler.topic[cid] = 4
			else
				npc:say("You have not faced the plagueseal yet. Return to me when you are better prepared.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getStorageValue(1004) == 1 then
				npc:say("Ah, I can sense the power of the seal of demonrage burning in your heart. Have you passed any other seal yet?", TALKTYPE_SAY)
				npcHandler.topic[cid] = 5
			else
				npc:say("You are not filled with the fury of the imprisoned demon. Return when you are better prepared.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:getStorageValue(1002) == 1 then
				npc:say("So, you have managed to pass the seal of the true path. Have you passed any other seal yet?", TALKTYPE_SAY)
				npcHandler.topic[cid] = 6
			else
				npc:say("You have not found your true path yet. Return when you are better prepared.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:getStorageValue(1001) == 1 then
				npc:say("I see! You have mastered the seal of logic. You have made the sacrifice, you have seen the unseen, you possess fortitude, you have filled yourself with power and found your path. You may ask me for my kiss now.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 7
			else
				npc:say("You have not found your true path yet. Return to meh when you are better prepared.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 8 then
			if not player:isPzLocked() then
				npc:say("So be it! Hmmmmmm...", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
				player:teleportTo(Position(32202, 31812, 8))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:setStorageValue(1006, 1)
			else
				npc:say("You have spilled too much blood recently and the dead are hungry for your soul. Perhaps return when you regained you inner balance.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 9 then
			npcHandler:say({
				"Listen... there are no blooming flowers down here and the only smell present is that of death and decay. ...",
				"I wish that I could breathe the lovely smell of beautiful flowers just one more time, especially those which elves cultivate. ...",
				"Could you please bring me 50 holy orchids?"
			}, cid)
			npcHandler.topic[cid] = 10
		elseif npcHandler.topic[cid] == 10 then
			npcHandler:say("Thank you. I will wait for your return.", cid)
			player:setStorageValue(1078, 6)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 11 then
			if player:removeItem(5922, 50) then
				npcHandler:say("Thank you! You have no idea what that means to me. As promised,here is your reward... as a follower of Zathroth, I hope that you will like this accessory.", cid)
				player:setStorageValue(1078, 7)
				player:addOutfitAddon(145, 1)
				player:addOutfitAddon(149, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You need 50 holy orchid.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "addon") then
		if player:getStorageValue(1078) == 5 then
			npcHandler:say("Say... I have been longing for something for an eternity now... if you help me retrieve it, I will reward you. Do you consent to this arrangement?", cid)
			npcHandler.topic[cid] = 9
		end
	elseif msgcontains(msg, "orchid") then
		if player:getStorageValue(1078) == 6 then
			npcHandler:say("Have you really brought me 50 holy orchids?", cid)
			npcHandler.topic[cid] = 11
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] >= 1 and npcHandler.topic[cid] <= 7 then
			npc:say("Then try to be better prepared next time we meet.", TALKTYPE_SAY)
		elseif npcHandler.topic[cid] == 8 then
			npc:say("Perhaps it is the better choice for you, my dear.", TALKTYPE_SAY)
		end		
	end
	return true
end

keywordHandler:addKeyword({'stay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's my curse to be the eternal {guardian} of this ancient {place}."})
keywordHandler:addKeyword({'guardian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm the {guardian} of the {SEVENTH} and final seal. The seal to open the last door before ... but perhaps it's better to see it with your own eyes."})
keywordHandler:addKeyword({'place'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It served as a temple, a source of power and ... as a sender for an ancient {race} which lived a long time ago and has long been forgotten."})
keywordHandler:addKeyword({'race'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The race that built this edifice came to this place from the stars. They ran from an enemy even more horrible than themselves. But they carried the {seed} of their own destruction in them."})
keywordHandler:addKeyword({'seed'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This ancient race was annihilated by its own doings, that's all I know. Aeons have passed since then, but the sheer presence of this {complex} is still defiling and desecrating this area."})
keywordHandler:addKeyword({'complex'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its constructors were too strange for you or even me to understand. We don't know what this ... thing they built was supposed to be good for. I feel a constant twisting and binding of souls, though, that is probably only a side-effect."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The place you know as the Ghostlands had a different name once ... and many names after. Too many to remember them all."})
keywordHandler:addKeyword({'banshee'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are my maidens. They give me comfort in my eternal watch over the last seal."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Be greeted, dear visitor. Come and stay ... a while.")
npcHandler:setMessage(MESSAGE_FAREWELL, "We will meet again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Yes, flee from death. But know it shall be always one step behind you.")
npcHandler:addModule(FocusModule:new())