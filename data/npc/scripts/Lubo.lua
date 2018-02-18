local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling equipment for adventurers. Do you need anything?"})
keywordHandler:addKeyword({'lubo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Lubo, the owner of this shop."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "No idea."})
keywordHandler:addKeyword({'mountain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is said that once there lived a great magician on the top of this mountain."})
keywordHandler:addKeyword({'magician'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't remember his name, but it's said that his banner was the black eye."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell the best apples in Tibia."})
keywordHandler:addKeyword({'map'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh! I'm sorry, I sold the last one just five minutes ago."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There's a lot of magic flowing in the mountain to the north."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you want to buy weapons, you'll have to go to a town or city."})
keywordHandler:addKeyword({'dog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is Ruffy my dog, please don't do him any harm."})
keywordHandler:addKeyword({'pet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are some strange stories about a magicians pet names. Ask Hoggle about it."})
keywordHandler:addKeyword({'finger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, you sure mean this old story about the mage Dago, who lost two fingers when he conjured a dragon."})
keywordHandler:addKeyword({'inn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Frodo runs a nice inn in the near town Thais."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah yes, I remember my grandfather talking about that name. This house used to be an inn a long time ago. My family bought it from some of these flower guys."})
keywordHandler:addKeyword({'flower'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I mean druids of course. They sold the cottage to my family after some of them died in an accident or something like that."})
keywordHandler:addKeyword({'accident'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As far as I can remember the story, a pet escaped its stable behind the inn. It got somehow involved with powerfull magic at a ritual and was transformed in some way."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'goods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell torches, fishing rods, sixpacks of worms, ropes, water hoses, backpacks, apples, and maps."})

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say('Stop by and rest a while, tired adventurer! Have a look at my wares!', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "addon") or msgcontains(msg, "outfit") then
		if player:getStorageValue(1043) < 1 then
			npcHandler:say("Sorry, the backpack I wear is not for sale. It's handmade from rare minotaur leather.", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(1043) == 2 then
			if player:getStorageValue(1044) < os.time() then
				npcHandler:say("Just in time! Your backpack is finished. Here you go, I hope you like it.", cid)
				player:setStorageValue(1043, 3)
				player:addOutfitAddon(136, 1)
				player:addOutfitAddon(128, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Uh... I didn't expect you to return that early. Sorry, but I'm not finished yet with your backpack. I'm doing the best I can, promised.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "minotaur leather") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Well, if you really like this backpack, I could make one for you, but minotaur leather is hard to come by these days. Are you willing to put some work into this?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "backpack") then
		if player:getStorageValue(1043) == 1 then
			npcHandler:say("Ah, right, almost forgot about the backpack! Have you brought me 100 pieces of minotaur leather as requested?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("Alright then, if you bring me 100 pieces of fine minotaur leather I will see what I can do for you. You probably have to kill really many minotaurs though... so good luck!", cid)
			npcHandler.topic[cid] = 0
			player:setStorageValue(1043, 1)
			player:setStorageValue(1033, 1) --this for default start of Outfit and Addon Quests
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(5878, 100) then
				npcHandler:say("Great! Alright, I need a while to finish this backpack for you. Come ask me later, okay?", cid)
				player:setStorageValue(1043, 2)
				player:setStorageValue(1044, os.time() + 2 * 60 * 60) -- 2 hour
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] > 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
shopModule:addSellableItem({'vial', 'potion', 'flask'}, 					Cfemptypotion, 5)

shopModule:addBuyableItem({'torch'}, 					Cftorch, 2)
shopModule:addBuyableItem({'candelabrum'}, 					Cfcandelabrum, 8)
shopModule:addBuyableItem({'candlestick'}, 					Cfcandlestick, 2)
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'vial of oil')
shopModule:addBuyableItem({'coal basin'}, 					Cfcoalbasin, 25)
shopModule:addBuyableItem({'bag'}, 					Cfredbag, 5)
shopModule:addBuyableItem({'backpack'}, 					Cfredbackpack, 20)
shopModule:addBuyableItem({'present'}, 					Cfpresent, 10)
shopModule:addBuyableItem({'scroll'}, 					Cfscroll, 5)
shopModule:addBuyableItem({'document'}, 					Cfdocument, 12)
shopModule:addBuyableItem({'parchment'}, 					Cfparchment, 8)
shopModule:addBuyableItem({'brown book'}, 					Cfbrownbook, 15)
shopModule:addBuyableItem({'black book'}, 					Cfblackbook, 15)
shopModule:addBuyableItem({'small book'}, 					Cfsmallbook, 15)
shopModule:addBuyableItem({'watch'}, 					Cfwatch, 20)
shopModule:addBuyableItem({'football'}, 					Cffootball, 111)

shopModule:addBuyableItem({'water pipe'}, 					Cfwaterpipe, 40)
shopModule:addBuyableItem({'birdcage'}, 					Cfbirdcage, 50)
shopModule:addBuyableItem({'globe'}, 					Cfglobe, 50)
shopModule:addBuyableItem({'pendulum clock'}, 					Cfpendulumclock, 75)
shopModule:addBuyableItem({'table lamp'}, 					Cftablelamp, 35)
shopModule:addBuyableItem({'cuckoo clock'}, 					Cfcuckooclock, 40)


npcHandler:setMessage(MESSAGE_GREET, "Welcome to my adventurer shop, |PLAYERNAME|! What do you need? Ask me for offer to look at my wares.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

