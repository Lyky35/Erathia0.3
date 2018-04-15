 
debug = true -- Debug mode for developers
reset = true -- Reset tasks by saying 'reset' to npc
 
 
task = {
    storage = {
        onTask         = 6522000,
        monstersLeft = 6522001,
        completed    = 6522002,
        getFinished  = 6522003,
    },
    tasks = { -- You can add as many tasks as you want
        [1] = {
            name = "Rat Burger", -- Name of Task
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
            name = "Rat Donalds", -- Name of Task
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
            name = "Rathilator", -- Name of Task
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
            name = "Gaint Killer",
            description = "Cyclops have killed my friend near Thais, take revange for me, kill them.",
            monsters = {
                "Cyclops",
            },
            toKill = 25,
            rewards = {
                [1] = {
                    name = "life ring",
                    itemid = 2214,
                    count = 1,
                },
            },
        },
		
        [5] = {
            name = "Gaint Killer 2",
            description = "You know what? My friend died 2nd time on cyclops. Kill them all!",
            monsters = {
                "Cyclops",
            },
            toKill = 125,
            rewards = {
                [1] = {
                    name = "crystal coin",
                    itemid = 2160,
                    count = 1,
                },
                [2] = {
                    name = "elven amulet",
                    itemid = 2198,
                    count = 1,
                },
            },
        },
		
		        [6] = {
            name = "Gaint Killer 3",
            description = "You know what to do, find Cyclops, kill them all. You won't regret the reward.",
            monsters = {
                "Cyclops",
            },
            toKill = 375,
            rewards = {
                [1] = {
                    name = "crystal coin",
                    itemid = 2160,
                    count = 15,
                },
                [2] = {
                    name = "elven amulet",
                    itemid = 2198,
                    count = 1,
                },
            },
        },
		        [7] = {
            name = "Gaint Exterminator",
            description = "You know I hate those big ass stupid imbred Giants. Kill them!",
            monsters = {
                "Cyclops",
				"Behemot",
            },
            toKill = 750,
            rewards = {
                [1] = {
                    name = "crystal coin",
                    itemid = 2160,
                    count = 35,
                },
                [2] = {
                    name = "ultimate healing rune",
                    itemid = 2273,
                    count = 100,
                },
            },
        },		
        [8] = {
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
 [9] = {
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
  [10] = {
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
  [11] = {
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
 [12] = {
            name = "Spider Exterminator",
            description = "Eh, this time I got normal task for you. The city paid me to get rid of some spiders, do this for me; And I'll give you, your 15% cut",
            monsters = {
                "Spider",
                "Poison Spider",
                "Tarantula",
                "Giant Spider",
            },
            toKill = 35,
            rewards = {
                [1] = {
                    name = "platinum coin",
                    itemid = 2152,
                    count = 10,
                },
            },
        },
 
  [13] = {
            name = "Spider Exterminator 2",
            description = "Great business, telling you. Go, and kill some bigger spiders for me, as always you'll get your 15% cut!",
            monsters = {
                "Tarantula",
                "Giant Spider",
            },
            toKill = 25,
            rewards = {
                [1] = {
                    name = "platinum coin",
                    itemid = 2152,
                    count = 25,
                },
            },
        },
   [14] = {
            name = "Spider Exterminator 3",
            description = "Hey partner, the town is angry with me. They are telling me you didn't kill enough Giant Spiders. I need you to kill 25 for me.",
            monsters = {
                "Giant Spider",
            },
            toKill = 25,
            rewards = {
                [1] = {
                    name = "platinum coin",
                    itemid = 2152,
                    count = 40,
                },
            },
        },
   [14] = {
            name = "Widow killer",
            description = "I figured out what is happening, its that Old Widow... that venomus bitch is to blame, kill her!",
            monsters = {
                "The Old Widow",
            },
            toKill = 5,
            rewards = {
                [1] = {
                    name = "bright sword",
                    itemid = 2407,
                    count = 1,
                },
            },
        },
    },
} 

task.__index = task
 
-- Finds out what the last task the player did was, if any,
-- and gives the player a new task
function task:new(player, npcHandler)
    if task:getCompleted(player) > 0 then
        task:reward(player, npcHandler)
        task:set(player, 0)
        return false
    end
 
    if task:onTask(player) > 0 then
        npcHandler:say("You already have a task.", player:getId())
        task:debug(player:getName() .. " is already on a task " .. task.tasks[task:onTask(player)].name  .. ".")
        return false
    end
 
    local lastFinished = task:getFinished(player)
    if lastFinished == #task.tasks then
        npcHandler:say("You have completed all the tasks!", player:getId())
        return false
    end
 
    local newTask = lastFinished + 1
    task:set(player, newTask)
    npcHandler:say(task.tasks[newTask].description, player:getId())
    return true
end
 
-- Sets the task provided 't' to the player provided
function task:set(player, t)
    if player:setStorageValue(task.storage.onTask, t) then      
        if t == 0 then
            task:debug(player:getName() .. " is no longer on task.")
            return false
        end
        task:debug(player:getName() .. " started task " .. task.tasks[t].name .. ".")
       
        if player:setStorageValue(task.storage.monstersLeft, task.tasks[t].toKill) then
            return true
        end
    end  
    return false
end
 
function task:setCompleted(player, t)
    if player:setStorageValue(task.storage.completed, t) then
        if t == 0 then
            return true
        end
        return true
    end
    return false
end
 
function task:getCompleted(player)
    return player:getStorageValue(task.storage.completed)
end
 
function task:getMonstersLeft(player)
    return player:getStorageValue(task.storage.monstersLeft)
end
 
-- Checks if the player is currently doing a task
-- And returns the task the player is doing
function task:onTask(player)
    for i = 1, #task.tasks do
        if player:getStorageValue(task.storage.onTask) == i then
            return i
        end
    end
    return 0
end
 
function task:setFinished(player, t)
    if player:setStorageValue(task.storage.getFinished, t) then
        task:debug(player:getName() .. " finished task " .. task.tasks[t].name)
        return true
    end
    return false
end
 
-- Checks if the player has finished a task
-- And returns the task that is finished
function task:getFinished(player)
    for i = 1, #task.tasks do
        if player:getStorageValue(task.storage.getFinished) == i then
            return i
        end
    end
    return 0
end
 
-- Checks if the monster killed was a task monster
function task:onKill(player, target)
    currentTask = task:onTask(player)
    for i = 1, #task.tasks[currentTask].monsters do
        if string.lower(target:getName()) == string.lower(task.tasks[currentTask].monsters[i]) then
           
            if task:getMonstersLeft(player) < 1 then
                return false
            end
 
            player:setStorageValue(task.storage.monstersLeft, task:getMonstersLeft(player) - 1)
            if task:getMonstersLeft(player) == 0 then
                if task:setCompleted(player, currentTask) then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "You have completed your task.")
                    task:debug(string.format("%s has completed %s.", player:getName(), task.tasks[currentTask].name))
                    return true
                end
            end
 
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "You killed a " .. string.lower(target:getName()) .. ". Only " .. task:getMonstersLeft(player) .. " left to kill!")
            task:debug(player:getName() .. " killed a " .. string.lower(target:getName()) .. ". " .. task:getMonstersLeft(player) .. " monsters left.")
            return true
        end
    end
    return false
end
 
function task:reward(player, npcHandler)
    local t = task:onTask(player)
    for i = 1, #task.tasks[t].rewards do
        player:addItem(task.tasks[t].rewards[i].itemid, task.tasks[t].rewards[i].count)
        player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("You received %dx %s(s).", task.tasks[t].rewards[i].count, task.tasks[t].rewards[i].name))
        task:debug(string.format(player:getName() .. " received %dx %s(s).", task.tasks[t].rewards[i].count, task.tasks[t].rewards[i].name))
    end
 
    npcHandler:say("Here you go!", player:getId())
 
    task:onTask(player, 0)
    task:setCompleted(player, 0)
    task:setFinished(player, t)
    return true
end
 
-- Toggle true/false at the top of this lua file
-- Resets the tasks for the provided player
function task:reset(player, npcHandler)
    if reset then
        player:setStorageValue(task.storage.onTask, 0)
        player:setStorageValue(task.storage.monstersLeft, 0)
        player:setStorageValue(task.storage.completed, 0)
        player:setStorageValue(task.storage.getFinished, 0)
        npcHandler:say("You have reseted all the tasks.", player:getId())
        task:debug(player:getName() .. " reseted his tasks.")
    end
end
 
-- Toggle true/false at the top of this lua file
function task:debug(string)
    if debug then
        string = "[TASK] " .. string
        print(string)
    end
end