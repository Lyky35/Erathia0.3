local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
	local player = Player(cid)
	local npc = Npc()

    	if not player:getCondition(CONDITION_POISON) then
		npc:say("Begone! Hissssss! You bear not the mark of the cobra!", TALKTYPE_SAY)
		return false
	end

	npc:say("Venture the path of decay!", TALKTYPE_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(Position(33397, 32836, 14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())