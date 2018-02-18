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
	if msgcontains(msg, 'shard') or msgcontains(msg, 'frostheart shard') then
		npcHander:say('Do you bring frostheart shards for our spell?', cid)
		if player:getStorageValue(1072) < 1 then
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(1072) == 2 then
			npcHandler.topic[cid] = 2
		else
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(7290, 5) then
				npcHandler:say('Excellent, you collected 5 frostheart shards. Take this. It might suit your Nordic outfit fine.', cid)
				player:setStorageValue(1072, 1)
				player:addOutfitAddon(252, 1)
				player:addOutfitAddon(251, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 4
			else
				npcHandler:say('Come back when you have collected 5 frostheart shards.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:removeItem(7290, 10) then
				npcHandler:say('Take this. It might suit your Nordic outfit fine. From now on we only can give you 2000 gold pieces for each shard.', cid)
				player:setStorageValue(1072, 2)
				player:addOutfitAddon(252, 2)
				player:addOutfitAddon(251, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say('Come back when you have collected 10 frostheart shards.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			if player:getItemCount(7290) >= 1 then
				local shardCount = player:getItemCount(7290)
				player:addMoney(count * 2000)
				player:removeItem(7290, count)
				npcHandler:say('Here your are. ' .. count * 2000 .. ' gold coins for ' .. count .. ' shards.', cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, 'reward') and npcHandler.topic[cid] == 4 then
		npcHandler:say('We need a few shards more, then you might receive another reward.', cid)
		npcHandler.topic[cid] = 0	
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 0 then
			npcHandler:say('I see.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())