dofile('data/lib/svargrondArenaQuest.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'rules'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'What do you want to know? Something about the three different {difficulties}, the {general} rules or the {prices}? Maybe you also want to know what happens when you die?'})
keywordHandler:addKeyword({'difficulties'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are three difficulties: Greenhorn, Scrapper and Warlord. On each challenge you will be confronted with ten monsters increasing in strength.'})
keywordHandler:addKeyword({'levels'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are three difficulties: Greenhorn, Scrapper and Warlord. On each challenge you will be confronted with ten monsters increasing in strength.'})
keywordHandler:addKeyword({'difficulty'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'There are three difficulties: Greenhorn, Scrapper and Warlord. On each challenge you will be confronted with ten monsters increasing in strength.'})
keywordHandler:addKeyword({'greenhorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'That is the easiest way in our arena. The fee is 1000 gold. We were setting this up for of our children to challenge some easy monsters and train them for the future.'})
keywordHandler:addKeyword({'scrapper'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The most common difficulty for us. The {fee} is 5000 gold. So if you are experienced in fighting middle class monsters this is your challenge!'})
keywordHandler:addKeyword({'warlord'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Only the strongest among us will take this challenge. The {fee} is 10000 gold. If you pass that I promise you the respect of all citizens here. You will be a hero!'})
keywordHandler:addKeyword({'fee'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The fee is either 1000, 5000 or 10000 gold for one try. Remember that if you {die}, it is YOUR problem and you won\'t be able to get back to your corpse and your backpack.'})
keywordHandler:addKeyword({'die'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'It would be better not to die! In every pit there is an emergency exit, the portal to the south. If you die in a pit... well... your corpse and backpack are gone, so you enter the arena at your own risk.'})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Basically you pay me a {fee}, and you are sent into an arena with 10 different stages. If you succeed you will be rewarded accordingly.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My job is to explain about the rules and to get the fee from the competitors.'})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Well I would rather call it an Ultimate Challenge than a mission.'})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local arenaId = player:getStorageValue(1008)
	if isInArray({'fight', 'pit', 'challenge', 'arena'}, msg) then
		if player:getStorageValue(1009) == 1 then
			npcHandler:say('You already paid the fee, go and fight!', cid)
			return true
		end

		if arenaId < 1 then
			arenaId = 1
			player:setStorageValue(1008, arenaId)
		end

		if ARENA[arenaId] then
			npcHandler:say('So you agree with the rules and want to participate in the challenge? The fee for one try in ' .. ARENA[arenaId].name .. ' is ' .. ARENA[arenaId].price .. ' gold pieces. Do you really want to participate and pay the fee?', cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('You\'ve already completed the arena in all difficulty levels.', cid)
			npcHandler.topic[cid] = 0
		end

	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if not ARENA[arenaId] then
				npcHandler.topic[cid] = 0
				return true
			end

			if player:removeMoney(ARENA[arenaId].price) then
				player:setStorageValue(1009, 1)
				npcHandler:say('As you wish! You can pass the door now and enter the teleporter to the pits.', cid)
				if player:getStorageValue(1050) ~= 1 then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It seems that you have have discovered an \'Ultimate Challenge\'')
					player:setStorageValue(1050, 1)
				end
				if player:getStorageValue(ARENA[arenaId].questLog) ~= 1 then
					player:setStorageValue(ARENA[arenaId].questLog, 1)
				end
			else
				npcHandler:say('You do not have enough money.', cid)
			end
		else
			npcHandler:say('Come back when you are ready then.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Hello competitor! Do you want to fight in the arena or shall I explain the rules first?')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())