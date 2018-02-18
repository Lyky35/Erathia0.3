function onSay(cid, words, param)
	local player = Player(cid)
	if player:getStorageValue(1085) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Your training time starts, once you enter the teleport.')
		return false
	end

	local timeLeft = player:getStorageValue(1086)
	if timeLeft < os.time() then
		local cooldownTime = (player:getStorageValue(1084) - os.time())
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You have no training time. Rest time left ('.. formatOsTime(cooldownTime) ..').')
		return false
	end

	local time = (timeLeft - os.time())
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Training Time Left ('.. formatOsTime(time) .. ').')
	return false
end
