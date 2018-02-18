local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local voices = {
	'Great spirit potions as well as health and mana potions in different sizes!',
	'If you need alchemical fluids like slime and blood, get them here.'
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
	if isInArray({"vial", "ticket", "bonus", "deposit"}, msg) then
		if player:getStorageValue(1060) < 1 then
			npcHandler:say("We have a special offer right now for depositing vials. Are you interested in hearing it?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(1060) >= 1 then
			npcHandler:say("Would you like to get a lottery ticket instead of the deposit for your vials?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "prize") then
		npcHandler:say("Are you here to claim a prize?", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"The Edron academy has introduced a bonus system. Each time you deposit 100 vials without claiming the money for it, you will receive a lottery ticket. ...",
				"Some of these lottery tickets will grant you a special potion belt accessory, if you bring the ticket to me. ...",
				"If you join the bonus system now, I will ask you each time you are bringing back 100 or more vials to me whether you claim your deposit or rather want a lottery ticket. ...",
				"Of course, you can leave or join the bonus system at any time by just asking me for the 'bonus'. ...",
				"Would you like to join the bonus system now?"
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Great! I've signed you up for our bonus system. From now on, you will have the chance to win the potion belt addon!", cid)
			player:setStorageValue(1060, 1)
			player:setStorageValue(1033, 1) --this for default start of Outfit and Addon Quests
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(2006, 0, 100) then
				npcHandler:say("Ok here take this lottery ticket!", cid)
				player:addItem(5957, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have 100 empty vials.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getStorageValue(1060) == 1 and player:removeItem(5958, 1) then
				npcHandler:say("Congratulations! Here, from now on you can wear our lovely potion belt as accessory.", cid)
				player:setStorageValue(1060, 2)
				player:addOutfitAddon(138, 1)
				player:addOutfitAddon(133, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				npcHandler:say("You don't have any prize to claim!", cid)
			end
			npcHandler.topic[cid] = 0
		end
		return true
	end
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'life'}, 					2006, 60, 10, 'life fluid')
shopModule:addBuyableItem({'mana'}, 					2006, 100, 7, 'mana fluid')
shopModule:addBuyableItem({'spellbook'}, 					Cfspellbook, 150)

shopModule:addBuyableItem({'blank rune'}, 					Cfblankrune, 10)
shopModule:addBuyableItem({'slime'}, 					2006, 12, 4, 'potion of slime')
shopModule:addBuyableItem({'blood'}, 					2006, 15, 2, 'potion of blood')
shopModule:addBuyableItem({'urine'}, 					2006, 10, 13, 'potion of urine')
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'potion of oil')
shopModule:addBuyableItem({'water'}, 					2006, 8, 1, 'potion of distilled water')

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am lady Sandra Astralian."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell potions and magic fluids."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Buy a watch."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was guest at his castle on my visits to Thais."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was guest at his castle on my visits to Thais."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do I look as if I'd fraternize with such people?"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A disgusting person indeed."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not interested in tales only kids belive in."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A city full of disgusting people with ill manners."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world is a place of barbarianism."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I plan to visit this city one day."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't it a wonderful town?"})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nothing I would talk to you about."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nothing I would talk to you about."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'items'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'fluid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids and several potions."})
keywordHandler:addKeyword({'potion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling potions of slime, blood, urine, oil, and distilled water."})

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|, welcome to the fluid and potion shop of Edron.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|, please come back soon.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|, please come back soon.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. By the way, if you'd like to join our bonus system for depositing flasks and vial, you have to tell me about that {deposit}.")