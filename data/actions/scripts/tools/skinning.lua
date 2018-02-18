local config = {
	[5908] = {
		-- Minotaurs
		[2830] = {value = 25000, newItem = 5878},
		[2871] = {value = 25000, newItem = 5878},
		[2866] = {value = 25000, newItem = 5878},
		[2876] = {value = 25000, newItem = 5878},
		[3090] = {value = 25000, newItem = 5878},

		-- Low Class Lizards
		[4259] = {value = 25000, newItem = 5876},
		[4262] = {value = 25000, newItem = 5876},
		[4256] = {value = 25000, newItem = 5876},

		-- Dragons
		[3104] = {value = 25000, newItem = 5877},
		[2844] = {value = 25000, newItem = 5877},

		-- Dragon Lords
		[2881] = {value = 25000, newItem = 5948},

		-- Behemoths
		[2931] = {value = 35000, newItem = 5893},

		-- Bone Beasts
		[3031] = {value = 25000, newItem = 5925},

		-- Ice Cube
		[7441] = {value = 25000, newItem = 7442},
		[7442] = {value = 25000, newItem = 7444},
		[7444] = {value = 25000, newItem = 7445},
		[7445] = {value = 25000, newItem = 7446},
	},
	[5942] = {
		-- Demon
		[2916] = {value = 25000, newItem = 5906},

		-- Vampires
		[2956] = {value = 25000, newItem = 5905}
	}
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local skin = config[item.itemid][target.itemid]
	if not skin then
		return false
	end

	local random, effect, transform = math.random(1, 100000), CONST_ME_MAGIC_GREEN, true
	if type(skin[1]) == 'table' then
		local _skin
		for i = 1, #skin do
			_skin = skin[i]
			if random <= _skin.value then
				if isInArray({7441, 7442, 7444, 7445}, target.itemid) then
					player:addItem(_skin.newItem, _skin.amount or 1)
					effect = CONST_ME_HITAREA
				else
					player:addItem(_skin.newItem, _skin.amount or 1)
				end
				break
			end
		end

	elseif random <= skin.value then
		if isInArray({7441, 7442, 7444, 7445}, target.itemid) then
			player:addItem(skin.newItem, skin.amount or 1)
			effect = CONST_ME_HITAREA
		else
			player:addItem(skin.newItem, skin.amount or 1)
		end
	else
		if isInArray({7441, 7442, 7444, 7445}, target.itemid) then
			player:say('The attempt of sculpting failed miserably.', TALKTYPE_MONSTER_SAY)
			effect = CONST_ME_HITAREA
		else
			effect = CONST_ME_POFF
		end
	end

	toPosition:sendMagicEffect(effect)
	if transform then
		target:transform(skin.after or target.itemid + 1)
	end

	return true
end