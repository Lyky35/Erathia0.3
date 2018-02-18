local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

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
		if player:getStorageValue(1081) == 11 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?', cid)
				npcHandler.topic[cid] = 2
			end
		end
	elseif msgcontains(msg, 'yes') then
		if player:removeItem(5941, 1) then
			player:setStorageValue(1081, 12)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			player:addItem(5942, 1)
			npcHandler:say('So receive my prayer: \'Your mind shall be a vessel for joy, light and wisdom\' - uh, wow, something happened. Well, I guess that\'s it, but next time if you need some mumbo jumbo rather go to Chondur.', cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())