local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no job. I am a beggar."})
keywordHandler:addKeyword({'beggar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no gold and no job, so I am a beggar."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I need gold. I love gold. I need help."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Simon. I am a very poor man."})
keywordHandler:addKeyword({'simon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Simon. The poorest human all over the continent."})
keywordHandler:addKeyword({'dermot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The magistrate of the village. I heard he is selling something for the Fibula Dungeon."})
keywordHandler:addKeyword({'village'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To the north is the village Fibula. A very small village."})
keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Key? There are a lot of keys. Please change the topic."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard a lot about the Fibula Dungeon. But I never was there."})
keywordHandler:addKeyword({'fibula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hate Fibula. Too many wolves are here."})
keywordHandler:addKeyword({'timur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hate Timur. He is too expensive. But sometimes I find maces and hatchets. Timur is buying these items."})
keywordHandler:addKeyword({'wolf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Please kill them ... ALL."})
keywordHandler:addKeyword({'flute'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Har, har. The stupid Dermot lost his flute. I know that some minotaurs have it in their treasure room."})
keywordHandler:addKeyword({'mino'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Very rich monsters. But they are too strong for me. However, there are even stronger monsters."})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know there are two rooms. And I know you can pass only the first door. The second door can't be opened."})
keywordHandler:addKeyword({'giant spider'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know that terrible monster. It killed the fishers on the isle to the north"})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The strongest monster I know is the giant spider."})
keywordHandler:addKeyword({'jetty'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hate this jetty. I have never seen a ship here."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is a large sea-monster outside. I think there is no gritty captain to sail in this quarter."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hehe, do you have a shovel? I can sell you a shovel if you want to return to Tibia."})

local voices = {
	'Alms! Alms for the poor!',
	'Sir, Ma\'am, have a gold coin to spare?',
	'I need help! Please help me!'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'outfit') or msgcontains(msg, 'addon') then
		if player:getStorageValue(1039) == 6 then
			if player:getStorageValue(1040) < 1 then
				npcHandler:say('Haha, that beard is - well, not fake, but there\'s a trick behind it. I noticed people tend to be more generous towards a poor gramps. Want to know my trick?', cid)
				npcHandler.topic[cid] = 1
			end
		else
			npcHandler:say('You need the Beggar outfit, to recive addons.')
		end
	elseif msgcontains(msg, 'ape fur') then
		npcHandler:say('Have you brought me the 100 pieces of ape fur and 20000 gold pieces?', cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			if player:getSex() == PLAYERSEX_FEMALE then
				npcHandler:say({"I can mix a secret potion which increases facial hair growth enormeously. I call it 'Instabeard'. However, I fear it works only for men. ...",
						"Even if it worked on girls, I'd rather not be responsible for you ruining your pretty face. I have an idea though. If you help me brew one of these potions, I sell something nice to you. ...",
						"I still have a pretty gypsy dress and a pearl necklace somewhere, which you could wear instead of this ragged skirt. For the small fee of 20000 gold pieces, it'd be yours. ...",
						"You only have to bring me 100 pieces of ape fur, so I can brew the potion. Do we have a deal?"
						}, cid)
			else	
				npcHandler:say({"I can mix a secret potion which will increase your facial hair growth enormeously. I call it 'Instabeard'. However, it requires certain ingredients. ...",
						"For the small fee of 20000 gold pieces I will help you mix this potion. Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...",
						"Do we have a deal?"
						}, cid)
			end
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('Great! Come back to me once you have the 100 pieces of ape fur and I\'ll do my part of the deal.', cid)
			player:setStorageValue(1040, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(5883, 100) and player:removeMoney(20000) then
				if player:getSex() == PLAYERSEX_FEMALE then
					npcHandler:say('Ahh! Very good. I will start mixing the potion immediately and sell it to some poor foo- eh, man.', cid)
				else
					npcHandler:say('Ahh! Very good. I will start mixing the potion immediately. Come back later. Bye bye.', cid)
					npcHandler:resetNpc(cid)
					npcHandler:releaseFocus(cid)
				end
				player:setStorageValue(1040, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have the required items.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say({"When I was wandering around in Tibia, I lost my favourite staff somewhere in the northern ruins in Edron. ...",
					"Uh, don't ask me what I was doing there... sort of a pilgrimage. Well anyway, if you could bring that staff back to me, I promise I'll give you my current one. ...",
					"What do you say?"
					}, cid)
			npcHandler.topic[cid] = 5
		elseif npcHandler.topic[cid] == 6 then
			npcHandler:say('Good! Come back to me once you have retrieved my staff. Good luck.', cid)
			player:setStorageValue(1040, 6)
			player:setStorageValue(1042, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then
			if player:removeItem(6107, 1) then
				npcHandler:say('Yes!! That\'s it! I\'m so glad! Here, you can have my other one. Thanks!', cid)
				player:addOutfitAddon(153, 1)
				player:addOutfitAddon(157, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:setStorageValue(1040, 7)	
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('Come back when you brought me the staff.', cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, 'beard') then
		if player:getStorageValue(1040) == 2 then
			npcHandler:say('Hmm, I\'m not done yet with your potion. But here, let me sprinkle a few drops of my own potion on your face... there you go. Now you just have to wait.', cid)
			player:addOutfitAddon(153, 1)
			player:addOutfitAddon(157, 1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:setStorageValue(1040, 3)
			player:setStorageValue(1047, math.random(5, 14))
			player:setStorageValue(1046, os.time() + player:getStorageValue(1047) * 24 * 60 * 60) -- (5 - 14 days)
		elseif player:getStorageValue(1040) == 3 then
			if player:getStorageValue(1046) <= (os.time() - player:getStorageValue(1047) / 2) then
				npcHandler:say('Hmm, hmmm, I think you already have a little more hair than the last time I saw you. Just be patient and don\'t shave. I\'m gonna check the progress for you.', cid)
				player:setStorageValue(1040, 4)
			else
				npcHandler:say('The beard has not grown yet. Come back in '.. (player:getStorageValue(1047) / 2) ..' days.')
			end
		end
	elseif msgcontains(msg, 'addon') then
		if player:getStorageValue(1040) == 4 then
			if player:getStorageValue(1046) < os.time() then
				npcHandler:say('Aha! I can see it! Now that you\'ve waited patiently without shaving, your beard is perfect! All thanks to my, err, potion. Yes. Goodbye!', cid)
				player:setStorageValue(1040, 5)
			else
				npcHandler:say('Be patient, it\'s under progress.')
			end
		elseif player:getStorageValue(1040) == 5 then
			npcHandler:say('No, no. Our deal is finished, no complaining now, I don\'t have time all day. And no, you can\'t have my staff.', cid)
		end
	elseif msgcontains(msg, 'staff') then
		if player:getStorageValue(1040) == 5 then
			npcHandler:say('I said, no! Or well - I have a suggestion to make. Will you listen?', cid)
			npcHandler.topic[cid] = 4
		elseif player:getStorageValue(1040) == 6 then
			npcHandler:say('Did you bring my favourite staff??', cid)
			npcHandler.topic[cid] = 7
		end
	end
	return true
end


npcHandler:setMessage(MESSAGE_GREET, "Hello|PLAYERNAME|. I am a poor man. Please help me.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a nice day.") 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())