local config = {
	["rotworm"] = 2039,
	["carrion worm"] = 2040,
	["dwarf"] = 2041,
	["minotaur"] = 2042,
	["ghoul"] = 2043,
	["elf"] = 2044,
	["beholder"] = 2045,
	["cyclops"] = 2046,
	["minotaur guard"] = 2047,
	["orc berserker"] = 2048,
	["dwarf guard"] = 2049,
	["vampire"] = 2050,
	["necromancer"] = 2051,
	["wyvern"] = 2052,
	["demon skeleton"] = 2053,
	["frost giant"] = 2054,
	["frost giantess"] = 2055,
	["ice golem"] = 2056,
	["barbarian bloodwalker"] = 2057,
	["barbarian headsplitter"] = 2058,
	["pirate cutthroat"] = 2059,
	["pirate marauder"] = 2060,
	["quara hydromancer"] = 2061,
	["quara pincher"] = 2062,
	["quara predator"] = 2063,
	["crystal spider"] = 2064,
	["elder beholder"] = 2065,
	["giant spider"] = 2066,
	["dragon"] = 2067,
	["black knight"] = 2068,
	["hero"] = 2069,
	["dragon lord"] = 2070,
	["frost dragon"] = 2071,
	["betrayed wraith"] = 2072,
	["fury"] = 2073,
	["hellfire fighter"] = 2074,
	["nightmare"] = 2075,
	["warlock"] = 2076,
	["behemoth"] = 2077,
	["demon"] = 2078,
	["blightwalker"] = 2079,
	["dark torturer"] = 2080,
	["hand of cursed fate"] = 2081,
	["hellhound"] = 2082,
	["juggernaut"] = 2083
}

function onKill(player, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local task = config[targetMonster:getName():lower()]
	if not task then
		return true
	end

	local storage = player:getStorageValue(task)
	if storage == -1 then
		return true
	end

	local taskLength = player:getStorageValue(2036)
	if storage == taskLength - 1 then
		player:unregisterEvent("TaskKill")
		player:setStorageValue(task, storage + 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your task is done, go report to Grizzly Adams.")
		return true
	end
	
	player:setStorageValue(task, storage + 1)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, string.format("Task: You have slain [%i/%i] %ss.", player:getStorageValue(task), taskLength, targetMonster:getName()))
	return true
end