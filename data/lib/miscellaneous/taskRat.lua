 
debug = true -- Debug mode for developers
reset = true -- Reset tasks by saying 'reset' to npc
 
 
taskRat = {
    storage = {
        ontaskRat         = 6522004,
        monstersLeft = 6522005,
        completed    = 6522006,
        getFinished  = 6522007,
    },
    taskRats = { -- You can add as many taskRats as you want
        [1] = {
            name = "Rat Burger", -- Name of taskRat
            description = "There's a shortage of ham in McDonalds. Please kill 35 rats for me.", -- What the NPC tells the player to do
            monsters = { -- You can add as many monsters as you want
                "Rat",
                "Cave Rat",
            },
            toKill = 35, -- How many monsters the player needs to kill
            rewards = {    -- You can add as many rewards as you want
                [1] = {
                    name = "platinum coins",
                    itemid = 2152,
                    count = 15,
                },
                [2] = {
                    name = "life ring",
                    itemid = 2168,
                    count = 1,
                },
            },
        },
        [2] = {
            name = "Rat Donalds", -- Name of taskRat
            description = "There's even a bigger shortage of ham in McDonalds. Please kill 100 rats for me.", -- What the NPC tells the player to do
            monsters = { -- You can add as many monsters as you want
                "Rat",
                "Cave Rat",
            },
            toKill = 100, -- How many monsters the player needs to kill
            rewards = {    -- You can add as many rewards as you want
                [1] = {
                    name = "platinum coins",
                    itemid = 2152,
                    count = 85,
                },
                [2] = {
                    name = "life ring",
                    itemid = 2168,
                    count = 1,
                },
            },
        },
        [3] = {
            name = "Rathilator", -- Name of taskRat
            description = "McDonalds just gave us a special order for superb quality of ham. Please kill 450 rats for me.", -- What the NPC tells the player to do
            monsters = { -- You can add as many monsters as you want
                "Rat",
                "Cave Rat",
            },
            toKill = 450, -- How many monsters the player needs to kill
            rewards = {    -- You can add as many rewards as you want
                [1] = {
                    name = "crystal coins",
                    itemid = 2160,
                    count = 1,
                },
                [2] = {
                    name = "ring of healing",
                    itemid = 2214,
                    count = 1,
                },
            },
        },		


        [4] = {
            name = "Dragon Quest",
            description = "Dragon Burgers from Burger King seems to kill my McRat Burgers, we need to improvise. Go, and kill their stock. That will make their business harder! Haha",
            monsters = {
                "Dragon",
                "Dragon Lord",
            },
            toKill = 15,
            rewards = {
                [1] = {
                    name = "crystal coin",
                    itemid = 2160,
                    count = 1,
                },
            },
        },
 [5] = {
            name = "Dragon Quest 2",
            description = "The dragon burgers needs to be stopped, bleed them dry!",
            monsters = {
                "Dragon",
                "Dragon Lord",
            },
            toKill = 120,
            rewards = {
                [1] = {
                    name = "crystal coin",
                    itemid = 2160,
                    count = 5,
                },
            },
        },
  [6] = {
            name = "Dragon Quest 3",
            description = "The dragon lord burgers! WTF is that, how does it even sell?!",
            monsters = {
                "Dragon Lord",
            },
            toKill = 200,
            rewards = {
                [1] = {
                    name = "crystal coin",
                    itemid = 2160,
                    count = 10,
                },
            },
        },
  [7] = {
            name = "Dragon Quest 4",
            description = "We need to put stop to the damn dragon burgers. Its ruining my McRats. Strike at the heart of dragons, kill Demodras!",
            monsters = {
                "Demodras",
            },
            toKill = 5,
            rewards = {
                [1] = {
                    name = "stuffed dragon",
                    itemid = 6566,
                    count = 1,
                },
            },
        },
    },
} 
taskRat.__index = taskRat
 
-- Finds out what the last taskRat the player did was, if any,
-- and gives the player a new taskRat
function taskRat:new(player, npcHandler)
    if taskRat:getCompleted(player) > 0 then
        taskRat:reward(player, npcHandler)
        taskRat:set(player, 0)
        return false
    end
 
    if taskRat:ontaskRat(player) > 0 then
        npcHandler:say("You already have a task.", player:getId())
        taskRat:debug(player:getName() .. " is already on a task " .. taskRat.taskRats[taskRat:ontaskRat(player)].name  .. ".")
        return false
    end
 
    local lastFinished = taskRat:getFinished(player)
    if lastFinished == #taskRat.taskRats then
        npcHandler:say("You have completed all the task!", player:getId())
        return false
    end
 
    local newtaskRat = lastFinished + 1
    taskRat:set(player, newtaskRat)
    npcHandler:say(taskRat.taskRats[newtaskRat].description, player:getId())
    return true
end
 
-- Sets the taskRat provided 't' to the player provided
function taskRat:set(player, t)
    if player:setStorageValue(taskRat.storage.ontaskRat, t) then      
        if t == 0 then
            taskRat:debug(player:getName() .. " is no longer on task.")
            return false
        end
        taskRat:debug(player:getName() .. " started task " .. taskRat.taskRats[t].name .. ".")
       
        if player:setStorageValue(taskRat.storage.monstersLeft, taskRat.taskRats[t].toKill) then
            return true
        end
    end  
    return false
end
 
function taskRat:setCompleted(player, t)
    if player:setStorageValue(taskRat.storage.completed, t) then
        if t == 0 then
            return true
        end
        return true
    end
    return false
end
 
function taskRat:getCompleted(player)
    return player:getStorageValue(taskRat.storage.completed)
end
 
function taskRat:getMonstersLeft(player)
    return player:getStorageValue(taskRat.storage.monstersLeft)
end
 
-- Checks if the player is currently doing a taskRat
-- And returns the taskRat the player is doing
function taskRat:ontaskRat(player)
    for i = 1, #taskRat.taskRats do
        if player:getStorageValue(taskRat.storage.ontaskRat) == i then
            return i
        end
    end
    return 0
end
 
function taskRat:setFinished(player, t)
    if player:setStorageValue(taskRat.storage.getFinished, t) then
        taskRat:debug(player:getName() .. " finished taskRat " .. taskRat.taskRats[t].name)
        return true
    end
    return false
end
 
-- Checks if the player has finished a taskRat
-- And returns the taskRat that is finished
function taskRat:getFinished(player)
    for i = 1, #taskRat.taskRats do
        if player:getStorageValue(taskRat.storage.getFinished) == i then
            return i
        end
    end
    return 0
end
 
-- Checks if the monster killed was a taskRat monster
function taskRat:onKill(player, target)
    currenttaskRat = taskRat:ontaskRat(player)
    for i = 1, #taskRat.taskRats[currenttaskRat].monsters do
        if string.lower(target:getName()) == string.lower(taskRat.taskRats[currenttaskRat].monsters[i]) then
           
            if taskRat:getMonstersLeft(player) < 1 then
                return false
            end
 
            player:setStorageValue(taskRat.storage.monstersLeft, taskRat:getMonstersLeft(player) - 1)
            if taskRat:getMonstersLeft(player) == 0 then
                if taskRat:setCompleted(player, currenttaskRat) then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have completed your task.")
                    taskRat:debug(string.format("%s has completed %s.", player:getName(), taskRat.taskRats[currenttaskRat].name))
                    return true
                end
            end
 
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "You killed a " .. string.lower(target:getName()) .. ". Only " .. taskRat:getMonstersLeft(player) .. " left to kill!")
            taskRat:debug(player:getName() .. " killed a " .. string.lower(target:getName()) .. ". " .. taskRat:getMonstersLeft(player) .. " monsters left.")
            return true
        end
    end
    return false
end
 
function taskRat:reward(player, npcHandler)
    local t = taskRat:ontaskRat(player)
    for i = 1, #taskRat.taskRats[t].rewards do
        player:addItem(taskRat.taskRats[t].rewards[i].itemid, taskRat.taskRats[t].rewards[i].count)
        player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("You received %dx %s(s).", taskRat.taskRats[t].rewards[i].count, taskRat.taskRats[t].rewards[i].name))
        taskRat:debug(string.format(player:getName() .. " received %dx %s(s).", taskRat.taskRats[t].rewards[i].count, taskRat.taskRats[t].rewards[i].name))
    end
 
    npcHandler:say("Here you go!", player:getId())
 
    taskRat:ontaskRat(player, 0)
    taskRat:setCompleted(player, 0)
    taskRat:setFinished(player, t)
    return true
end
 
-- Toggle true/false at the top of this lua file
-- Resets the taskRats for the provided player
function taskRat:reset(player, npcHandler)
    if reset then
        player:setStorageValue(taskRat.storage.ontaskRat, 0)
        player:setStorageValue(taskRat.storage.monstersLeft, 0)
        player:setStorageValue(taskRat.storage.completed, 0)
        player:setStorageValue(taskRat.storage.getFinished, 0)
        npcHandler:say("You have reseted all the task.", player:getId())
        taskRat:debug(player:getName() .. " reseted his task.")
    end
end
 
-- Toggle true/false at the top of this lua file
function taskRat:debug(string)
    if debug then
        string = "[taskRat] " .. string
        print(string)
    end
end