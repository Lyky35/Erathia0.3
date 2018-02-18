local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a priest of the great pantheon."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus is our benevolent sovereign."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life is a gift of the gods, honor life and don't destroy it."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to spread knowledge about the gods."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is my mission to spread knowledge about the gods."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Lynda. And the spirits tell me that you are |PLAYERNAME|."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world of Tibia is the creation of the gods."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Now, it is "..getWorldTime()..""})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are creatures of the gods of evil!"})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fire is one of the primal elemental forces, sometimes worshipped by tribal shamans."})
keywordHandler:addKeyword({'air'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Air is one of the primal elemental forces, sometimes worshipped by tribal shamans."})

local items = {2181, 2182, 2183, 2184, 2185, 2186, 2187, 2188, 2189, 2190, 2191}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "angelina") then
		if player:getStorageValue(1062) == 1 then
			npcHandler:say({
				"Angelina had been imprisoned? My, these are horrible news, but I am so glad to hear that she is safe now. ...",
				"I will happily carry out her wish and reward you, but I fear I need some important ingredients for my blessing spell first. ...",
				"Will you gather them for me?"
			}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "wand") or msgcontains(msg, "rod") then
		if player:getStorageValue(1062) == 2 then
			npcHandler:say("Did you bring a sample of each wand and each rod with you?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "sulphur") then
		if player:getStorageValue(1062) == 3 then
			npcHandler:say("Did you obtain 10 ounces of magic sulphur?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "soul stone") then
		if player:getStorageValue(1062) == 4 then
			npcHandler:say("Were you actually able to retrieve the Necromancer's soul stone?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "ankh") then
		if player:getStorageValue(1062) == 5 then
			npcHandler:say("Am I sensing enough holy energy from ankhs here?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"Thank you, I promise that your efforts won't be in vain! Listen closely now: First, I need a sample of five druid rods and five sorcerer wands. ...",
				"I need a snakebite rod, a moonlight rod, a necrotic rod, a terra rod and a hailstorm rod. Then, I need a wand of vortex, a wand of dragonbreath ...",
				"... a wand of decay, a wand of cosmic energy and a wand of inferno. Please bring them all at once so that their energy will be balanced. ...",
				"Secondly, I need 10 ounces of magic sulphur. It can absorb the elemental energy of all the wands and rods and bind it to something else. ...",
				"Next, I will need a soul stone. These can be used as a vessel for energy, evil as well as good. They are rarely used nowaday though. ...",
				"Lastly, I need a lot of holy energy. I can extract it from ankhs, but only a small amount each time. I will need about 20 ankhs. ...",
				"Did you understand everything I told you and will help me with my blessing?"
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Alright then. Come back to with a sample of all five wands and five rods, please.", cid)
			player:setStorageValue(1062, 2)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			for i = 1, #items do
				if not player:removeItem(items[i], 1) then
					npcHandler:say('You don\'t have the items with you.', cid)
					npcHandler.topic[cid] = 0
					return false
				end
			end
			npcHandler:say("Thank you, that must have been a lot to carry. Now, please bring me 10 ounces of magic sulphur.", cid)
			player:setStorageValue(1062, 3)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if player:removeItem(5904, 10) then
				npcHandler:say("Very good. I will immediately start to prepare the ritual and extract the elemental energy from the wands and rods. Please bring me the Necromancer's soul stone now.", cid)
				player:setStorageValue(1062, 4)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:removeItem(5809, 1) then
				npcHandler:say("You have found a rarity there, " .. player:getName() .. ". This will become the tip of your blessed wand. Please bring me 20 ankhs now to complete the ritual.", cid)
				player:setStorageValue(1062, 5)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:removeItem(2193, 20) then
				npcHandler:say("The ingredients for the ritual are complete! I will start to prepare your blessed wand,... I'm glad to tell you that I have finished the ritual, " .. player:getName() .. ". Here is your new wand. I hope you carry it proudly for everyone to see.", cid)
				player:setStorageValue(1062, 6)
				player:setStorageValue(1063, os.time() + 3 * 60 * 60) -- 2 hour
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, 'ritual') then
		if player:getStorageValue(1062) == 6 then
			if player:getStorageValue(1059) < os.time() then
				player:addOutfitAddon(141, 1)
				player:addOutfitAddon(130, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				player:getStorageValue(1062, 7)
				npcHandler:say('I\'m glad to tell you that I have finished the ritual, '.. player:getName() ..'. Here is your new wand. I hope you carry it proudly for everyone to see.', cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('Please let me focus for a while, '.. player:getName() ..'.', cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome in the name of the gods, pilgrim |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Be careful on your journeys.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Be careful on your journeys.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())