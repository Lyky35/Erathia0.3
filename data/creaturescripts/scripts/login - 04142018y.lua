local events = {
    'PlayerDeath',
    'LevelSave',
    'SvargrondArenaKill',
    'DropLoot'
}
 
local townIds = {1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12}
 
function onLogin(player)
    local loginStr = 'Welcome to ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
    if player:getLastLoginSaved() <= 0 then
        loginStr = loginStr .. ' Please choose your outfit.'
        player:sendOutfitWindow()
        for i = 1, #townIds do
           
        end
    else
        if loginStr ~= '' then
            player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
        end
 
        loginStr = string.format('Your last visit was on %s.', os.date('%a %b %d %X %Y', player:getLastLoginSaved()))
    end
    player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
 
    -- Stamina
    nextUseStaminaTime[player.uid] = 0
   
    -- Promotion
    local vocation = player:getVocation()
    local promotion = vocation:getPromotion()
    if player:isPremium() then
        local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
        if not promotion and value ~= 1 then
            player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
        elseif value == 1 then
            player:setVocation(promotion)
        end
    elseif not promotion then
        player:setVocation(vocation:getDemotion())
    end
 
    if player:getStorageValue(2038) == 1 then -- Task System register if still has task
        player:registerEvent("TaskKill")
    end
 
    for i = 1, #events do
        player:registerEvent(events[i])
	end
	player:registerEvent("KillingInTheNameOf")
    return true
end