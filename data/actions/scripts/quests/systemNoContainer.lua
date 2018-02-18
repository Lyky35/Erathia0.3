local config = {
	[30019] = {
		items = {
			{itemId = 2088, itemCount = 1, actionId = 3610}
		}
	},
	[30047] = { -- crown shield ---> Black Knight Quest
		items = {
			{itemId = 2519, itemCount = 1}
		}
	},
	[30048] = { -- crown armor -----> Black Knight Quest
		items = {
			{itemId = 2487, itemCount = 1}
		}
	},
	[30049] = { -- blood herb -----> Blood Herb Quest
		items = {
			{itemId = 2798, itemCount = 1}
		}
	},
	[30050] = { -- Mummy Quest
		items = {
			{itemId = 2134, itemCount = 1}, {itemId = 2147, itemCount = 2}, {itemId = 2145, itemCount = 3}
		}
	},
	[30063] = { -- Black Knight Villa Key 5010 Quest
		items = {
			{itemId = 2088, itemCount = 1, actionId = 5010}
		}
	},
	[30073] = { -- Key 3002 Quest
		items = {
			{itemId = 2088, itemCount = 1, actionId = 3002}
		}
	},
	[31005] = { -- Ghost Ship Plate Armor Quest
		items = {
			{itemId = 2463, itemCount = 1}
		}
	},
	[31017] = { -- Six Small Rubies Quest
		items = {
			{itemId = 2147, itemCount = 6}
		}
	},
	[31027] = { -- Outlaw Key Quests
		items = {
			{itemId = 2089, itemCount = 1, actionId = 3301}
		}
	},
	[31028] = { -- Outlaw Key Quests
		items = {
			{itemId = 2088, itemCount = 1, actionId = 3302}
		}
	},
	[31029] = { -- Outlaw Key Quests
		items = {
			{itemId = 2089, itemCount = 1, actionId = 3303}
		}
	},
	[31043] = { -- Paradox Tower Key
		items = {
			{itemId = 2089, itemCount = 1, actionId = 3899}
		}
	},
	[31050] = { -- Hydra Egg Quest
		items = {
			{itemId = 4850, itemCount = 1}
		}
	},
	[31053] = { -- Ape City Quest Witches Cap Spot
		items = {
			{itemId = 4840, itemCount = 1}
		}
	},
	[31254] = { -- Tear Of Daraman
		items = {
			{itemId = 2346, itemCount = 1}
		}
	},
	[31256] = {
		items = {
			{itemId = 4843, itemCount = 1}
		}
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local useItem, storage = config[item.uid], item.uid
	if not useItem then
		useItem = config[item.actionid]
		storage = item.actionid
	end

	if player:getStorageValue(storage) == 1 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
		return true
	end

	local items, reward = useItem.items
	local size = #items
	if size == 1 then
		reward = Game.createItem(items[1].itemId, items[1].itemCount or 1)
	end

	local result = ''
	if reward then
		local ret = ItemType(reward.itemid)
		if ret:isRune() then
			result = ret:getArticle() .. ' ' ..  ret:getName() .. ' (' .. reward.type .. ' charges)'
		elseif reward:getCount() > 1 then
			result = reward:getCount() .. ' ' .. ret:getPluralName()
		elseif ret:getArticle() ~= '' then
			result = ret:getArticle() .. ' ' .. ret:getName()
		else
			result = ret:getName()
		end

		if items[1].actionId then
			reward:setActionId(items[1].actionId)
		end
	else
		if size > 8 then
			reward = Game.createItem(1988, 1)
		else
			reward = Game.createItem(1987, 1)
		end

		for i = 1, size do
			local tmp = Game.createItem(items[i].itemId, items[i].itemCount or 1)
			if reward:addItemEx(tmp) ~= RETURNVALUE_NOERROR then
				print('[Warning] QuestSystem:', 'Could not add quest reward to container')
			else
				if items[i].actionId then
					tmp:setActionId(items[i].actionId)
				end

			end
		end

		local ret = ItemType(reward.itemid)
		result = ret:getArticle() .. ' ' .. ret:getName()
	end

	if player:addItemEx(reward) ~= RETURNVALUE_NOERROR then
		local weight = reward:getWeight()
		if player:getFreeCapacity() < weight then
			player:sendCancelMessage(string.format('You have found %s weighing %.2f oz. You have no capacity.', result, (weight / 100)))
		else
			player:sendCancelMessage('You have found ' .. result .. ', but you have no room to take it.')
		end
		return true
	end

	player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. result .. '.')
	player:setStorageValue(storage, 1)
	return true
end