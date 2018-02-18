local function savingServer()
    saveServer()
    Game.broadcastMessage('Server was sucessfully saved, next save in 20 minutes.', MESSAGE_STATUS_DEFAULT)
end
 
function onThink(interval)
    Game.broadcastMessage('Server will automatically save current state in 30 seconds, it may cause freeze.', MESSAGE_STATUS_DEFAULT)
    addEvent(savingServer, 30000)
    return true
end