local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25  then
			Npc():say('Have a drink in Meriana\'s only tavern!', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local items = {6099, 6100, 6101, 6102}

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'addon') then
		npcHandler:say('You mean my hat? Well, I might have another one just like that, but I won\'t simply give it away, even if you earned our trust. You\'d have to fulfil a task first.', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'task') then
		npcHandler:say('Your task is to bring me the shirt of the Lethal Lissy, the sabre of Ron the Ripper, the hat of Brutus Bloodbeard and the eye patch of Deadeye Devious. Did you succeed?', cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2 then
		if player:getStorageValue(1074) == 1 then
			npcHandler:say('It seems you already have this addon, don\'t you try to mock me son!', cid)
			npcHandler.topic[cid] = 0
			return false
		end

		for i = 1, #items do
			if not player:removeItem(items[i], 1) then
				npcHandler:say("You do not have all the required items.", cid)
				npcHandler.topic[cid] = 0
				return false
			end
		end

		npcHandler:say("Ah, right! The pirate hat! Here you go.", cid)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		player:setStorageValue(1074, 1)
		player:addOutfitAddon(155, 2)
		player:addOutfitAddon(151, 2)
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('I see.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('Alright then. Come back when you got all neccessary items.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())