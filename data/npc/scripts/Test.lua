local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local storeTarget = 0

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink() 
	local npc = Npc()
	local spectators = Game.getSpectators(npc:getPosition(), false, true, 100, 1000, 100, 1000)
	for i = 1, #spectators do
		local specs = spectators[i]
		storeTarget = specs:getId()
		local target = Player(storeTarget)		
		if target then
			npc:setTarget(target)
			npc:setFollowCreature(target, true)			
		end
	end
	npcHandler:onThink() 
end

local function creatureSayCallback(cid, type, msg)
	if msgcontains(msg, 'hi') or msgcontains(msg, 'hello') and not npcHandler:isFocused(cid) then
		npcHandler:say('Yo nigger', cid)
		npcHandler:addFocus(cid)
	end

	if not npcHandler:isFocused(cid) then
		return false
	end

	if isInArray({"fuck", "idiot", "asshole", "ass", "fag", "stupid", "tyrant", "shit", "lunatic"}, msg) then
		local npc = Npc()
		npc:say('Fuck off', TALKTYPE_SAY)
		storeTarget = cid
		local target = Player(storeTarget)	
		npc:setTarget(target)
		npc:setFollowCreature(target, true)
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		Npc():say("Farewell, " .. Player(cid):getName() .."!", TALKTYPE_SAY)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)