function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local storage = item.uid
	if storage > 65535 then
		return false
	end

	if player:getStorageValue(storage) > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
		return true
	end

	local targetItem = item
	local items = {}
	local reward = nil

	local size = targetItem:isContainer() and Container(item.uid):getSize() or 0
	if size == 0 then
		reward = targetItem:clone()
	else
		local container = Container(item.uid)
		for i = 0, container:getSize() - 1 do
			table.insert(items, container:getItem(i):clone())
		end
	end

	size = #items
	if size == 1 then
		reward = items[1]:clone()
	end

	local result = ''
	local weight = 0
	if reward then
		local ret = ItemType(reward:getId())
		if ret:isRune() then
			result = ret:getArticle() .. ' ' ..  ret:getName() .. ' (' .. reward:getSubType() .. ' charges)'
		elseif ret:isStackable() and reward:getCount() > 1 then
			result = reward:getCount() .. ' ' .. ret:getPluralName()
		else
			result = ret:getArticle() .. ' ' .. ret:getName()
		end
		weight = weight + ret:getWeight(reward:getCount())
	else
		if size > 20 then
			reward = Game.createItem(item.itemid, 1)
		elseif size > 8 then
			reward = Game.createItem(1988, 1)
		else
			reward = Game.createItem(1987, 1)
		end

		for i = 1, size do
			local tmp = items[i]
			if reward:addItemEx(tmp) ~= RETURNVALUE_NOERROR then
				print('[Warning] QuestSystem:', 'Could not add quest reward to container')
			else
				local ret = ', '
				if i == size then
					ret = ' and '
				elseif i == 1 then
					ret = ''
				end
				result = result .. ret

				local ret = ItemType(tmp:getId())
				if ret:isRune() then
					result = result .. ret:getArticle() .. ' ' .. ret:getName() .. ' (' .. tmp:getSubType() .. ' charges)'
				elseif ret:isStackable() and tmp:getCount() > 1 then
					result = result .. tmp:getCount() .. ' ' .. ret:getPluralName()
				else
					result = result .. ret:getArticle() .. ' ' .. ret:getName()
				end
				weight = weight + ret:getWeight(tmp:getCount())
			end
		end
		weight = weight + ItemType(reward:getId()):getWeight()
	end

	if player:addItemEx(reward) ~= RETURNVALUE_NOERROR then
		if player:getFreeCapacity() < weight then
			player:sendCancelMessage('You have found ' .. result .. ' weighing ' .. string.format('%.2f', weight) .. ' oz. You have no capacity.')
		else
			player:sendCancelMessage('You have found ' .. result .. ', but you have no room to take it.')
		end
		return true
	end

	if player:getStorageValue(1032) ~= 1 then
		player:setStorageValue(1032, 1) -- questLog Start Storage
	end			 

	player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. result .. '.')
	player:setStorageValue(storage, 1)
	return true
end