local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sail between Mistrock and Carlin."})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sail between Mistrock and Carlin."})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sail between Mistrock and Carlin."})
keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sail between Mistrock and Carlin."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sail between Mistrock and Carlin."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like jobs and works very much, but I lvoe the sea.. so being a captain is the best ever!"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "it's abou.. eum... I have no idea.. where did my watch go?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you a nice trip between Mistrock and Carlin, no problems.."})
keywordHandler:addKeyword({'trade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't have anything to trade.."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "do I look like a smith?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "my name is Eric.. as it always have been.. I think.."})
keywordHandler:addKeyword({'eric'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yup, that's me alright."})

local travelNodes = {
	["mistrock"] = TravelserviceMistrock,
	["carlin"] = TravelserviceCarlin
}

local bringNodes = {
	["bring me to mistrock"] = {pos = TravelserviceMistrock},
	["bring me to carlin"] = {pos = TravelserviceCarlin}
}

local storeTravel = ""

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	local npc = Npc()
	local bringTable = bringNodes[msg]
	if bringTable then
		if msgcontains(msg, "bring me to carlin") and npc:getPosition().x == 32360 then
			npc:say("what if.. I told you... that we're already in Carlin?..", TALKTYPE_SAY)
			return false
		elseif msgcontains(msg, "bring me to mistrock") and npc:getPosition().x == 32002 then
			npc:say("what if.. I told you... that we're already in Mistrock?..", TALKTYPE_SAY)
			return false
		end
		if player:getPosition():getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
			if player:removeMoney(100) then
				npc:say("Set the sails!", TALKTYPE_SAY)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:teleportTo(bringTable["pos"], false)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				npc:say("You don't have enough money.", TALKTYPE_SAY)
			end
		else
			npc:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", TALKTYPE_SAY)
		end
	end
	if not npcHandler:isFocused(cid) then
		return false
	end
	if msgcontains(msg, "carlin") then
		if npc:getPosition().x == 32360 then
			npc:say("what if.. I told you... that we're already in Carlin?..", TALKTYPE_SAY)
		else
			npc:say("Do you seek a passage to Carlin for 100 gold?", TALKTYPE_SAY)
			storeTravel = msg
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "mistrock") then
		if npc:getPosition().x == 32002 then
			npc:say("what if.. I told you... that we're already in Mistrock?..", TALKTYPE_SAY)
		else
			npc:say("Do you seek a passage to Mistrock for 100 gold?", TALKTYPE_SAY)
			storeTravel = msg
			npcHandler.topic[cid] = 1
		end		
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:getPosition():getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
			if player:removeMoney(100) then
				npc:say("Set the sails!", TALKTYPE_SAY)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:teleportTo(storeTravel, false)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				npc:say("You don't have enough money.", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		else
			npc:say("If you want to travel with the boat you have to stand in it! else you'll just fall off!", TALKTYPE_SAY)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())