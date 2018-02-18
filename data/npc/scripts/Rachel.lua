local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	if player:isSorcerer() then
		if player:getSex() == PLAYERSEX_MALE then
			npcHandler:setMessage(MESSAGE_GREET, "Welcome back, brother ".. player:getName() .."!")
		else
			npcHandler:setMessage(MESSAGE_GREET, "Welcome back, sister ".. player:getName() .."!")
		end
	else
		npcHandler:setMessage(MESSAGE_GREET, "Welcome ".. player:getName() .."! Whats your need?")
	end	
	return true
end	

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


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the head alchemist of Carlin. I keep the secret recipies of our ancestors. Besides, I am selling mana and life fluids, spellbooks and runes."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the illusterous Rachel, of course."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is of no meaning to us sorcerers."})
keywordHandler:addKeyword({'wisdom'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wisdom arises from patience."})
keywordHandler:addKeyword({'patience'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You have to free yourself from unpatience to learn the deeper secrets of magic."})
keywordHandler:addKeyword({'ancestor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are a guild of old traditions and even older secrets."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Spells are the minor parts that make a sorcerer. To be one is a state of mind, not of a full spellbook."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Power is important, but it is just the way, not the ultimate goal."})
keywordHandler:addKeyword({'goal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This secrect will be taught you by life, not by me."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in Tibia: Sorcerers, paladins, knights, and druids."})
keywordHandler:addKeyword({'spells'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am too busy to teach you, ask in your guild about that."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome |PLAYERNAME|! Whats your need?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())