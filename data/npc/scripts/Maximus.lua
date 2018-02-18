local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function trainingCost(cid)
	local player = Player(cid)
	local skill = player:getHighestSkillLevel()
	local cost = 0

	if skill < 40 then
		cost = 250
	elseif skill >= 40 and skill < 70 then
		cost = 500
	elseif skill >= 70 and skill < 100 then
		cost = 750
	else 
		cost = 1000
	end

	return cost
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'train') then
		npcHandler:say('Are you interested in training your skills, squire?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Alright, it will cost you '.. trainingCost(cid) ..' gold coins. Yes?', cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(1085) == 1 then
				npcHandler:say('You have already bought training time.', cid)	
				npcHandler.topic[cid] = 0
				return false
			elseif player:getStorageValue(1084) > os.time() then
				npcHandler:say('Sorry, but you have to rest until you can train again.', cid)
				npcHandler.topic[cid] = 0
				return false
			end	

			if not player:removeMoney(trainingCost(cid)) then
				npcHandler:say('You don\'t have enough money.', cid)
				npcHandler.topic[cid] = 0
				return false
			end
			
			player:setStorageValue(1084, os.time() + 24 * 60 * 60) -- 24 hour (Training Time Cooldown)
			player:setStorageValue(1085, 1) -- (Activate Training)
			if player:getPremiumDays() == 0 then
				npcHandler:say('Thanks. You can now enter the teleport and start your training. You have acquired 2 hours training time.', cid)
			else
				npcHandler:say('Thanks. You can now enter the teleport and start your training. You have acquired 3 hours training time.', cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] > 0 then
		npcHandler:say('No then.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Welcome to my training arena, adventurer |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye squire.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye squire.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())