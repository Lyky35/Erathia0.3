local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My task is to buy and sell supplies. We are dealing with magical equipment like rings, amulets and some special items."})
keywordHandler:addKeyword({'amulet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying strange talismans, silver amulets, protection amulets and dragon necklaces."})
keywordHandler:addKeyword({'ring'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying might rings, energy rings, life rings, time rings, dwarven rings and rings of healing."})
keywordHandler:addKeyword({'special'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm currently looking for some special items. Do you have any ankhs or a mysterious fetish?"})

local function greetCallback(cid, message)
	if Player(cid):getStorageValue(1088) ~= 3 then
		npcHandler:say('I\'m sorry, but you don\'t have Malor\'s permission to trade with me.', cid)
		return false
	end

	return true
end

local trade = {
	{ NeedItem = 2195, Ncount = 1, GiveItem = 5891, Gcount = 1}, -- Enchanted Chicken Wing
	{ NeedItem = 2475, Ncount = 4, GiveItem = 5885, Gcount = 1}, -- Flask of Warrior's Sweat
	{ NeedItem = 2498, Ncount = 2, GiveItem = 5884, Gcount = 1}, -- Spirit Container
	{ NeedItem = 2392, Ncount = 3, GiveItem = 5904, Gcount = 1}  -- Magic Sulphur
}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if isInArray({"enchanted chicken wing", "boots of haste"}, msg) then
		npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wing?', cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"warrior Sweat", "warrior helmet"}, msg) then
		npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', cid)
		npcHandler.topic[cid] = 2
	elseif isInArray({"fighting Spirit", "royal helmet"}, msg) then
		npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', cid)
		npcHandler.topic[cid] = 3
	elseif isInArray({"magic sulphur", "fire sword"}, msg) then
		npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', cid)
		npcHandler.topic[cid] = 4
	elseif isInArray({"job", "items"}, msg) then
		npcHandler:say('I trade Enchanted Chicken Wing for Boots of Haste, Warrior Sweat for 4 Warrior Helmets, Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg,'yes') then
		if npcHandler.topic[cid] >= 1 then
			if player:getItemCount(trade[npcHandler.topic[cid]].NeedItem) >= trade[npcHandler.topic[cid]].Ncount then
				player:removeItem(trade[npcHandler.topic[cid]].NeedItem, trade[npcHandler.topic[cid]].Ncount)
				player:addItem(trade[npcHandler.topic[cid]].GiveItem, trade[npcHandler.topic[cid]].Gcount)
				return npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry but you don\'t have the item.', cid)
			end
		end
	elseif msgcontains(msg,'no') then
		if npcHandler.topic[cid] >= 1 then
			npcHandler:say('Ok then.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, human |PLAYERNAME|. How can a humble djinn be of service?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, human.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, human.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hi')
focusModule:addGreetMessage('hello')
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)