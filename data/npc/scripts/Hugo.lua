local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local message = {}

local config = {
	['pieces of brown cloth'] = {storageValue = 1, text = {'Ah! Have you brought 20 pieces of brown cloth?', 'Yes, yes, that\'s it! Very well, now I need 50 pieces of minotaur leather to continue.'}, itemId = 5913, count = 20},
	['minotaur leather'] = {storageValue = 2, text = {'Were you able to obtain 50 pieces of minotaur leather?', 'Great! This leather will suffice. Now, please, the 10 bat wings.'}, itemId = 5878, count = 50},
	['bat wing'] = {storageValue = 3, text = {'Did you get me the 10 bat wings?', 'Hooray! These bat wings are ugly enough. Now the last thing: Please bring me 30 heaven blossoms to neutralise the ghoulish stench.'}, itemId = 5894, count = 10},
	['heaven blossom'] = {storageValue = 4, text = {'Is this the lovely smell of 30 heaven blossoms?', 'This is it! I will immediately start to work on this outfit. Come back in a day or something... then my new creation will be born!'}, itemId = 5921, count = 30}
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'outfit') then
		if player:getStorageValue(1039) < 1 then
			npcHandler:say({"I think I'm having an innovative vision! I feel that people are getting tired of attempting to look wealthy and of displaying their treasures. ...",
					"A really new and innovative look would be - the 'poor man's look'! I can already see it in front of me... yes... a little ragged... but not too shabby! ...",
					"I need material right now! Argh - the vision starts to fade... please hurry, can you bring me some stuff?"
					}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(1039) == 5 then
			if player:getStorageValue(1047) < os.time() then
				npcHandler:say('Eureka! Alas, the poor man\'s outfit is finished, but... to be honest... it turned out much less appealing than I expected. However, you can have it if you want, okay?', cid)
				npcHandler.topic[cid] = 4
			else
				npcHandler:say('The outfit is not ready yet.')
			end
		end
	elseif config[msg] then
		if player:getStorageValue(1039) == config[msg].storageValue then
			npcHandler:say(config[msg].text[1], cid)
			npcHandler.topic[cid] = 3
			message[cid] = msg
		end
	elseif msgcontains(msg, "uniforms") then
		if player:getStorageValue(2010) == 1 then
			npcHandler:say("A new uniform for the post officers? I am sorry but my dog ate the last dress pattern we used. You need to supply us with a new dress pattern.", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "dress pattern") then
		if npcHandler.topic[cid] == 5 then
			npcHandler:say("It was ... wonderous beyond wildest imaginations! I have no clue where Kevin Postner got it from. Better ask him.", cid)
			player:setStorageValue(2010, 2)
		elseif player:getStorageValue(2010) == 11 then
			npcHandler:say("By the gods of fashion! Didn't it do that I fed the last dress pattern to my poor dog? Will this mocking of all which is taste and fashion never stop?? Ok, ok, you will get those ugly, stinking uniforms and now get lost, fashion terrorist.", cid)
			player:setStorageValue(2010, 12)
		end

		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({"Good! Listen, I need the following material - first, 20 pieces of brown cloth, like the worn and ragged ghoul clothing. ...",
					"Secondly, 50 pieces of minotaur leather. Third, I need bat wings, maybe 10. And 30 heaven blossoms, the flowers elves cultivate....",
					"Have you noted down everything and will help me gather the material?"
					}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('Terrific! What are you waiting for?! Start right away to gather 20 pieces of brown cloth and come back once you have them!', cid)
			player:setStorageValue(1039, 1)
		elseif npcHandler.topic[cid] == 3 then
			local targetMessage = config[message[cid]]
			if not player:removeItem(targetMessage.itemId, targetMessage.count) then
				npcHandler:say('You don\'t have the required items.', cid)
				npcHandler.topic[cid] = 0
				return false
			end

			player:setStorageValue(1039, player:getStorageValue(1039) + 1)
			npcHandler:say(targetMessage.text[2]:gsub('|PLAYERNAME|', player:getName()), cid)
			player:setStorageValue(1047, os.time() + 24 * 60 * 60) -- 24 hour
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say('Here you go. Maybe you enjoy if after all.', cid)
			player:setStorageValue(1039, 6)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addOutfit(153)
			player:addOutfit(157)
		end
	end
	return true
end

local function onReleaseFocus(cid)
	message[cid] = nil
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Take care, |PLAYERNAME|.") 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)
npcHandler:addModule(FocusModule:new())