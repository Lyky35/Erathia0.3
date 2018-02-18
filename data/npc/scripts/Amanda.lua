local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a humble nun."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am sister Amanda."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created the world and all life on it."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king is a religious man. A shining example."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king is a religious man. A shining example."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's our world."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army lives to the ideals of Banor."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army lives to the ideals of Banor."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a pawn of evil."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Only a being loyal to Banor will wield this blade."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I rarely have time to chat."})
keywordHandler:addKeyword({'blessing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "he lifeforce of this world is waning. There are no more blessings avaliable on this world."})
keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "he lifeforce of this world is waning. There are no more blessings avaliable on this world."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "heal") then
		if player:getHealth() < 40 then
			npc:say("You are looking really bad. Let me heal your wounds.", TALKTYPE_SAY)
			player:addHealth(40)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
			npc:say("You aren't looking really bad. Sorry, I can't help you.", TALKTYPE_SAY)
		end
	elseif msgcontains(msg, 'wooden stake') then
		if player:getStorageValue(1081) == 7 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?', cid)
				npcHandler.topic[cid] = 1
			end
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		if player:getItemCount(5941) > 0  then
			player:setStorageValue(1081, 8)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			npcHandler:say('So receive my prayer: \'Wicked curses shall be broken\'. Now, bring your stake to Kasmir in Darashia for the next line of the prayer. I will inform him what to do. ', cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())