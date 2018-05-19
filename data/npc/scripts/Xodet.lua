local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm Xodet, the owner of this shop."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorcerer and trade with all kinds of magic items."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is a sorcerer guild in Thais. Just go in the east of the town, it is easly to find."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'items'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling life and mana fluids, runes and spellbooks."})

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
shopModule:addBuyableItemContainer({'bp blank', 'backpack of blanks'}, 1988, 2260, 200, 25, 'backpack of blank runes')
shopModule:addBuyableItemContainer({'bp uh', 'backpack of uhs', 'backpack of ultiamte healing runes', 'backpack of ultimate healing'}, 1988, 2273, 3500, 1, 'backpack of ultimate healing runes')
shopModule:addBuyableItemContainer({'bp sd', 'backpack of sudden death runes', 'backpack of sudden death'}, 1988, 2268, 6500, 1, 'backpack of sudden death runes')
shopModule:addBuyableItemContainer({'bp gfb', 'backpack of great fireball runes', 'backpack of great fireball'}, 1988, 2304, 3600, 2, 'backpack of great fireball runes')
shopModule:addBuyableItemContainer({'bp explo', 'backpack of explosion runes', 'backpack of explosion'}, 1988, 2304, 5000, 2, 'backpack of great fireball runes')
shopModule:addBuyableItemContainer({'bp hmm', 'backpack of heavy magic missile runes', 'backpack of heavy magic missile'}, 1998, 2304, 5000, 2, 'backpack of heavy magic missile runes')
shopModule:addBuyableItemContainer({'bp mana'}, 1988, 2006, 2000, 7, 'backpack of manafluids')

shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of plague', 'plague'}, 2188, 5000, 'wand of plague')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 2185, 5000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire'}, 2181, 10000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest'}, 2183, 15000, 'tempest rod')

shopModule:addBuyableItem({'instense healing', 'instense healing rune'}, 2265, 95, 'intense healing rune')
shopModule:addBuyableItem({'ultimate healing', 'ultimate healing rune'}, 2273, 175,'ultimate healing rune')
shopModule:addBuyableItem({'fire bomb', 'fire bomb rune'}, 2305, 235, 2, 'fire bomb rune')
shopModule:addBuyableItem({'wild growth', 'wild growth rune'}, 2269, 170, 1, 'wild growth')
shopModule:addBuyableItem({'destroy field', 'destroy field rune'}, 2261, 45, 2, 'destroy field rune')
shopModule:addBuyableItem({'heavy magic missile', 'heavy magic missile rune'}, 2311, 25, 5, 'heavy magic missile rune')
shopModule:addBuyableItem({'light magic missile', 'light magic missile rune'}, 2287, 7, 5, 'light magic missile rune')

shopModule:addBuyableItem({'great fireball', 'great fireball rune'}, 2304, 90, 2, 'great fireball rune')
shopModule:addBuyableItem({'explosion', 'explosion rune'}, 2313, 85, 3, 'explosion rune')
shopModule:addBuyableItem({'sudden death', 'sudden death rune'}, 2268, 325, 'sudden death rune')
shopModule:addBuyableItem({'animate dead', 'animate dead rune'}, 2316, 375, 'animate dead rune')

shopModule:addBuyableItem({'convince creature'}, 2290, 80, 'convince creature rune')
shopModule:addBuyableItem({'chameleon'}, 2291, 210, 'chameleon rune')
shopModule:addBuyableItem({'desintegrate'}, 2310, 80, 'desintegreate rune')
shopModule:addBuyableItem({'fire field'}, 2301, 28, 'fire field rune')
shopModule:addBuyableItem({'fire wall'}, 2303, 61, 'fire wall rune')
shopModule:addBuyableItem({'energy field'}, 2301, 38, 'energy field rune')
shopModule:addBuyableItem({'antidote rune'}, 2266, 65, 'antidote rune')
shopModule:addBuyableItem({'energy wall'}, 2279, 85, 'energy wall rune')
shopModule:addBuyableItem({'fire ball'}, 2302, 130, 'fire ball rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 350, 'magic wall rune')
shopModule:addBuyableItem({'paralyze'}, 2278, 700, 'paralyze rune')
shopModule:addBuyableItem({'poison field'}, 2285, 21, 'poison field rune')
shopModule:addBuyableItem({'poison wall'}, 2289, 52, 'poison wall rune')
shopModule:addBuyableItem({'blank'}, 2260, 10, 'blank rune')

shopModule:addBuyableItem({'life'}, 					2006, 60, 10, 'life fluid')
shopModule:addBuyableItem({'mana'}, 					2006, 100, 7, 'mana fluid')

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local items = {[1] = 2190, [2] = 2182}
	local itemId = items[player:getVocation():getBase():getId()]
	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		if player:isMage() then
			if player:getStorageValue(2004) ~= 1 then
				npcHandler:say('So you ask me for a ' .. ItemType(itemId):getName() .. ' to begin your adventure?', cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say('What? I have already gave you one ' .. ItemType(itemId):getName() .. '!', cid)
			end
		else
			npcHandler:say('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(itemId, 1)
			npcHandler:say('Here you are young adept, take care yourself.', cid)
			player:setStorageValue(2004, 1)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler:say('Ok then.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())