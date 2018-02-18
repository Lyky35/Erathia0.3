local config = {
	[1] = {
		--equipment spellbook, wand of vortex, scale armor, soldier helmet, brass legs, leather boots, scarf
		items = {{2175, 1}, {2190, 1}, {2483, 1}, {2481, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
		--container rope, shovel, fire mushroom
		container = {{2120, 1}, {2554, 1}, {2795, 10}}
	},
	[2] = {
		--equipment spellbook, snakebite rod, scale armor, soldier helmet, brass legs, leather boots, scarf
		items = {{2175, 1}, {2190, 1}, {2483, 1}, {2481, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
		--container rope, shovel, fire mushroom
		container = {{2120, 1}, {2554, 1}, {2795, 10}}
	},
	[3] = {
		--equipment copper shield, 5 spear, scale armor, soldier helmet, brass legs, leather boots, scarf
		items = {{2530, 1}, {2389, 5}, {2483, 1}, {2481, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
		--container rope, shovel, fire mushroom
		container = {{2120, 1}, {2554, 1}, {2795, 10}}
	},
	[4] = {
		--equipment copper shield, orcish axe, scale armor, soldier helmet, brass legs, leather boots, scarf
		items = {{2530, 1}, {2428, 1}, {2483, 1}, {2481, 1}, {2478, 1}, {2643, 1}, {2661, 1}},
		--container rope, shovel, fire mushroom, scimitar, battle hammer
		container = {{2120, 1}, {2554, 1}, {2795, 10}, {2419, 1}, {2417, 1}}
	}
}

function onLogin(player)
	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:addItem(1988)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	return true
end