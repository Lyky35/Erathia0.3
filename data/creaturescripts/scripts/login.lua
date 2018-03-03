local events = {
    'PlayerDeath',
    'LevelSave',
    'SvargrondArenaKill',
    'DropLoot'
}
 
local townIds = {1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12}
local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end
 
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
 
local playerId = player:getId()
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
	-- EXP Stamina
	nextUseXpStamina[playerId] = 1

	-- Rewards notice
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have %d %s in your reward chest.", rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("BossParticipation")

	if player:getStorageValue(Storage.combatProtectionStorage) <= os.time() then
		player:setStorageValue(Storage.combatProtectionStorage, os.time() + 10)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end
	db.query('INSERT INTO `players_online` (`player_id`) VALUES (' .. playerId .. ')')
    return true
end