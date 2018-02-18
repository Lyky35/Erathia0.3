function onThink(interval, lastExecution)
    doBroadcastMessage("Server is being saved, next save in 15 minutes.")
    saveServer()
    return TRUE
end