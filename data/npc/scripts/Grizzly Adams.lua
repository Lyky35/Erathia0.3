local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- TaskTypes
-- 1 Easy
-- 2 Medium
-- 3 Hard

local taskList = {
	[1] = {
		{monsterName = "rotworm", reqLevel = 1, killCount = 50, storageValue = 2039},
		{monsterName = "carrion worm", reqLevel = 12, killCount = 50, storageValue = 2040},
		{monsterName = "dwarf", reqLevel = 1, killCount = 50, storageValue = 2041},
		{monsterName = "minotaur", reqLevel = 1, killCount = 50, storageValue = 2042},
		{monsterName = "ghoul", reqLevel = 1, killCount = 50, storageValue = 2043},
		{monsterName = "elf", reqLevel = 1, killCount = 50, storageValue = 2044},
		{monsterName = "beholder", reqLevel = 15, killCount = 50, storageValue = 2045},
		{monsterName = "cyclops", reqLevel = 10, killCount = 50, storageValue = 2046},
		{monsterName = "minotaur guard", reqLevel = 20, killCount = 50, storageValue = 2047},
		{monsterName = "orc berserker", reqLevel = 20, killCount = 50, storageValue = 2048},
		{monsterName = "dwarf guard", reqLevel = 18, killCount = 50, storageValue = 2049},
		{monsterName = "vampire", reqLevel = 30, killCount = 50, storageValue = 2050},
		{monsterName = "necromancer", reqLevel = 30, killCount = 50, storageValue = 2051},
		{monsterName = "wyvern", reqLevel = 30, killCount = 50, storageValue = 2052},
		{monsterName = "demon skeleton", reqLevel = 30, killCount = 50, storageValue = 2053},
		{monsterName = "frost giant", reqLevel = 20, killCount = 50, storageValue = 2054},
		{monsterName = "frost giantess", reqLevel = 20, killCount = 50, storageValue = 2055},
		{monsterName = "ice golem", reqLevel = 20, killCount = 50, storageValue = 2056},
		{monsterName = "barbarian bloodwalker", reqLevel = 15, killCount = 50, storageValue = 2057},
		{monsterName = "barbarian headsplitter", reqLevel = 15, killCount = 50, storageValue = 2058},
		{monsterName = "pirate cutthroat", reqLevel = 25, killCount = 50, storageValue = 2059},
		{monsterName = "pirate marauder", reqLevel = 25, killCount = 50, storageValue = 2060}
	},
	[2] = {
		{monsterName = "quara hydromancer", reqLevel = 8, killCount = 50, storageValue = 2061},
		{monsterName = "quara pincher", reqLevel = 8, killCount = 50, storageValue = 2062},
		{monsterName = "quara predator", reqLevel = 8, killCount = 50, storageValue = 2063},
		{monsterName = "crystal spider", reqLevel = 8, killCount = 50, storageValue = 2064},
		{monsterName = "elder beholder", reqLevel = 8, killCount = 50, storageValue = 2065},
		{monsterName = "giant spider", reqLevel = 8, killCount = 50, storageValue = 2066},
		{monsterName = "dragon", reqLevel = 8, killCount = 50, storageValue = 2067},
		{monsterName = "black knight", reqLevel = 8, killCount = 50, storageValue = 2068},
		{monsterName = "hero", reqLevel = 8, killCount = 50, storageValue = 2069},
		{monsterName = "dragon lord", reqLevel = 8, killCount = 50, storageValue = 2070},
		{monsterName = "frost dragon", reqLevel = 8, killCount = 50, storageValue = 2071},
		{monsterName = "betrayed wraith", reqLevel = 8, killCount = 50, storageValue = 2072},
		{monsterName = "fury", reqLevel = 8, killCount = 50, storageValue = 2073},
		{monsterName = "hellfire fighter", reqLevel = 8, killCount = 50, storageValue = 2074},
		{monsterName = "nightmare", reqLevel = 8, killCount = 50, storageValue = 2075}
	},
	[3] = {
		{monsterName = "warlock", reqLevel = 8, killCount = 50, storageValue = 2076},
		{monsterName = "behemoth", reqLevel = 8, killCount = 50, storageValue = 2077},
		{monsterName = "demon", reqLevel = 8, killCount = 50, storageValue = 2078},
		{monsterName = "blightwalker", reqLevel = 8, killCount = 50, storageValue = 2079},
		{monsterName = "dark torturer", reqLevel = 8, killCount = 50, storageValue = 2080},
		{monsterName = "hand of cursed fate", reqLevel = 8, killCount = 50, storageValue = 2081},
		{monsterName = "hellhound", reqLevel = 8, killCount = 50, storageValue = 2082},
		{monsterName = "juggernaut", reqLevel = 8, killCount = 50, storageValue = 2083}
	}
}

function Player.hasTask(self)
	local task = taskList[self:getStorageValue(2037)]
	if not task then
		return false
	end

	for i = 1, #task do
		if self:getStorageValue(task[i].storageValue) >= 0 then
			return true
		end
	end

	return false
end

function Player.getCurrentTask(self)
	local task = taskList[self:getStorageValue(2037)]
	if not task then
		return 0
	end

	for i = 1, #task do
		if self:getStorageValue(task[i].storageValue) >= 0 then
			return task[i].storageValue
		end
	end

	return 0
end

function Player.hasCompletedTask(self)
	local task = taskList[self:getStorageValue(2037)]
	if not task then
		return false
	end

	for i = 1, #task do
		local storage = self:getStorageValue(task[i].storageValue)
		if storage >= 0 then
			if storage == self:getStorageValue(2036) then
				return true
			end
		end
	end

	return false
end

local tasks = {}
local function generateTasks(cid, taskType)
	local player = Player(cid)
	local task = taskList[taskType]
	for i = 1, #task do
		if player:getLevel() >= task[i].reqLevel then
			tasks[#tasks + 1] = task[i].monsterName
		end
	end

	while #tasks > 6 - taskType do
		table.remove(tasks, math.random(#tasks))
	end
end

local taskSelected = nil
local taskLengthSelected = nil
local taskTypeSelected = nil

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then 
		return false 
	end

	local player = Player(cid)
	if npcHandler.topic[cid] == 0 then
		if isInArray({"tasks", "task", "mission", "challenge"}, msg:lower()) then
			if player:hasTask() then
				npcHandler:say("You already have a challenge! Did you complete it or do you want to cancel it? Only cowards are fleeing from their challenges, but as long as you pay me 100 gold, I will let you do it.", cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say("I love adventures that want to spice up their adventure even more. Tell me, do you want a challenge to: kill or collect?", cid)
				npcHandler.topic[cid] = 2
			end
		end
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "complete") then
			if player:hasCompletedTask() then
				npcHandler:say("How do you wish to be rewarded? You can have: experience, gold, or if you want, some training.", cid)
				npcHandler.topic[cid] = 3
				local task = taskList[player:getStorageValue(2037)]
				for i = 1, #task do
					local storage = player:getStorageValue(task[i].storageValue)
					if storage >= 0 then
						taskSelected = task[i].monsterName
						break
					end
				end
			else
				local task = taskList[player:getStorageValue(2037)]
				for i = 1, #task do
					local storage = player:getStorageValue(task[i].storageValue)
					if storage >= 0 then
						npcHandler:say(string.format("You are still not finished with your task, you still have %i %ss left.", player:getStorageValue(2036) - storage, task[i].monsterName:titleCase()), cid)
						break
					end
				end

				npcHandler.topic[cid] = 0
			end
		elseif msgcontains(msg, "cancel") then
			npcHandler:say("Are you sure? Really that much of a coward? Shame on you, but whatever, so be it. Hand over the money if you agree.", cid)
			npcHandler.topic[cid] = 4
		end
	elseif npcHandler.topic[cid] == 3 then
		local monsterType = MonsterType(taskSelected)
		if not monsterType then
			print("[Grizzly Adams]: This monster does not exsist ".. taskSelected)
			return true
		end

		if isInArray({"experience", "exp"}, msg:lower()) then
			npcHandler:say("Exp Reward.", cid)
			player:addExperienceStage((monsterType:getExperience() * player:getCurrentTask()) / player:getStorageValue(2037), true, true)
		elseif isInArray({"gold", "money"}, msg:lower()) then
			npcHandler:say("Gold Reward.", cid)
			local taskType = player:getStorageValue(2037)
			player:addMoney(((monsterType:getExperience() * player:getCurrentTask()) / taskType) / (2 + taskType))
		elseif isInArray({"training", "train", "skills"}, msg:lower()) then
			if player:isMage() then
				npcHandler:say("Sorry, but i can only reward mages with experience points or gold.", cid)
				npcHandler.topic[cid] = 0
				return true
			end

			local cooldownTime = player:getStorageValue(2084)
			if cooldownTime > os.time() then
				npcHandler:say("Sorry, you must wait ".. formatOsTime(cooldownTime) .." before you are able to train again.", cid)
				npcHandler.topic[cid] = 0
				return true
			end

			if player:isKnight() then
				npcHandler:say("Alright, which type of weaponary do you want gain skills on: sword, axe or club?.", cid)
				npcHandler.topic[cid] = 8
				return true
			else
				local skillTries = ((monsterType:getExperience() * player:getCurrentTask()) / player:getStorageValue(2037)) / 13
				player:addSkillTries(SKILL_DISTANCE, skillTries)
				player:addSkillTries(SKILL_SHIELD, skillTries)
				npcHandler:say("Train Reward.", cid)
			end
		end

		player:setStorageValue(player:getCurrentTask(), -1)
		player:setStorageValue(2037, 0)
		player:setStorageValue(2038, 0)
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 4 then
		if msgcontains(msg, "agree") then
			if player:getLevel() >= 30 then
				if not player:removeMoney(100) then
					npcHandler:say("You don't have enough of money to cancel the task.", cid)
					return true
				end
			end

			npcHandler:say("Alright, coward, hereby the challenge is canceled. If you have stopped being a coward and are up for a new one, come back later and let me know.", cid)
			player:setStorageValue(player:getCurrentTask(), -1)
			player:setStorageValue(2038, 0)
			npcHandler:resetNpc(cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, "kill") then
			npcHandler:say("I see, you prefer the hard way. Great! Do you want my challenge to be: easy, medium or hard?", cid)
			npcHandler.topic[cid] = 5
		elseif msgcontains(msg, "collect") then
			npcHandler:say("Sorry, there is no collect tasks implemented into my system yet. Complain on GM Printer.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 5 then
		if msgcontains(msg, "easy") then
			npcHandler:say("Easy? Deal! Should the challenge be: short, medium or long?", cid)
			taskTypeSelected = 1
			player:setStorageValue(2037, 1)
		elseif msgcontains(msg, "medium") then
			npcHandler:say("Medium? Deal! Should the challenge be: short, medium or long?", cid)
			taskTypeSelected = 2
			player:setStorageValue(2037, 2)
		elseif msgcontains(msg, "hard") then
			npcHandler:say("Hard? Deal! Should the challenge be: short, medium or long?", cid)
			taskTypeSelected = 3
			player:setStorageValue(2037, 3)
		end

		npcHandler.topic[cid] = 6
	elseif npcHandler.topic[cid] == 6 then
		if msgcontains(msg, "short") then
			npcHandler:say("A short one, fine!", cid)
			taskLengthSelected = 1
		elseif msgcontains(msg, "medium") then
			npcHandler:say("A medium one, fine!", cid)
			taskLengthSelected = 2
		elseif msgcontains(msg, "long") then
			npcHandler:say("A long one, fine!", cid)
			taskLengthSelected = 3
		end
		
		generateTasks(cid, taskTypeSelected)
		if #tasks == 0 then
			npcHandler:say("There is no tasks available for you.", cid)
			return true
		end

		local message = "You can select one of these tasks: "
		if #tasks > 1 then
			for i = 1, #tasks do
				if i < #tasks - 1 then
					message = message .. tasks[i]:titleCase() .. ", "
				elseif i == #tasks - 1 then
					message = message .. tasks[i]:titleCase() .. " "
				else
					message = message .. "and ".. tasks[i]:titleCase() .."."
				end
			end
		else
			message = message .. tasks[1]:titleCase() .. "."
		end

		npcHandler:say(message .."", cid)
		npcHandler.topic[cid] = 7
	elseif npcHandler.topic[cid] == 7 then
		local taskExsist = false
		for i = 1, #tasks do
			if tasks[i] == msg:lower() then
				taskExsist = true
			end
		end

		if taskExsist then
			for i = 1, #taskList[taskTypeSelected] do
				if taskList[taskTypeSelected][i].monsterName == msg:lower() then
					if taskLengthSelected ~= nil then
						if taskLengthSelected == 1 then
							player:setStorageValue(2036, taskList[taskTypeSelected][i].killCount + math.random(30, 70))
						elseif taskLengthSelected == 2 then
							player:setStorageValue(2036, taskList[taskTypeSelected][i].killCount + math.random(100, 150))
						elseif taskLengthSelected == 3 then
							player:setStorageValue(2036, taskList[taskTypeSelected][i].killCount + math.random(200, 300))
						end
					end

					npcHandler:say(string.format("You wanted a challenge to kill, so kill %i %ss for me. Come back when you have slayed them all!", player:getStorageValue(2036), msg:titleCase()), cid)
					player:setStorageValue(taskList[taskTypeSelected][i].storageValue, 0)
					break
				end
			end

			player:setStorageValue(2038, 1)
			player:registerEvent("TaskKill")
			npcHandler:resetNpc(cid)
			npcHandler:releaseFocus(cid)
		end
	elseif npcHandler.topic[cid] == 8 then
		local skillTries = ((MonsterType(taskSelected):getExperience() * player:getCurrentTask()) / player:getStorageValue(2037)) / 10
		if msgcontains(msg, "sword") then
			player:addSkillTries(SKILL_SWORD, skillTries)
		elseif msgcontains(msg, "axe") then
			player:addSkillTries(SKILL_AXE, skillTries)
		elseif msgcontains(msg, "club") then
			player:addSkillTries(SKILL_CLUB, skillTries)
		end

		npcHandler:say("Train Reward.", cid)
		player:addSkillTries(SKILL_SHIELD, skillTries)
		player:setStorageValue(2084, os.time() + (4 * player:getStorageValue(2037)) * 60 * 60)
		player:setStorageValue(player:getCurrentTask(), -1)
		player:setStorageValue(2037, 0)
		player:setStorageValue(2038, 0)
	end

	return true
end

local function onAddFocus(cid)
	for i = 1, #tasks do
		tasks[i] = nil
	end

	taskSelected = nil
	taskLengthSelected = nil
	taskTypeSelected = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)

npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! Are you up for a challenge?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Happy hunting, old chap!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())