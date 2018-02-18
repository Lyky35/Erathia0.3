local specialQuests = {
	[30002] = 30002, --Annih
	[30009] = 1010, --Svargrond
	[30010] = 1011, --Svargrond
	[30011] = 1012, --Svargrond
	[30039] = 1022,
	[31248] = 1079 --Dreamer Challenge Quest
}

local quests = {
	[31286] = {storageKey = 2012, storageValue = 2}, -- Postman mission 8
	[31287] = {storageKey = 2013, storageValue = 2}, -- Postman mission 9
	[31289] = {storageKey = 2009, storageValue = 2} -- Postman mission 5
}
local questsExperience = {
   [1296] = 80000,
   [9170] = 20000,
   [9050] = 20000
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local storage = specialQuests[item.actionid]
    if not storage then
        storage = item.uid
        if storage > 65535 then
            return false
        end
    end
 
    if player:getStorageValue(storage) > 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
        return true
    end
 
    local items, reward = {}
    local size = item:isContainer() and item:getSize() or 0
    if size == 0 then
        reward = item:clone()
    else
        local container = Container(item.uid)
        for i = 0, container:getSize() - 1 do
            items[#items + 1] = container:getItem(i):clone()
        end
    end
 
    size = #items
    if size == 1 then
        reward = items[1]:clone()
    end
 
    local result = ''
    if reward then
        local ret = ItemType(reward.itemid)
        if ret:isRune() then
            result = ret:getArticle() .. ' ' ..  ret:getName() .. ' (' .. reward.type .. ' charges)'
        elseif ret:isStackable() and reward:getCount() > 1 then
            result = reward:getCount() .. ' ' .. ret:getPluralName()
        elseif ret:getArticle() ~= '' then
            result = ret:getArticle() .. ' ' .. ret:getName()
        else
            result = ret:getName()
        end
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
 
    if questsExperience[storage] then
        player:addExperience(questsExperience[storage], true)
    end
 
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found ' .. result .. '.')
    player:setStorageValue(storage, 1)
    return true
end