local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local config = {
	["bat wings"] = {
		value = 1,
		message = {"Oh, did you bring the 70 bat wings for me?", "Thank you! I really needed them for my anti-wrinkle lotion. Now, please bring me 20 pieces of {red cloth}."},
		items = {5894, 70}
	},
	["red cloth"] = {
		value = 2,
		message = {"Have you found 20 pieces of red cloth?", "Great! This should be enough for my new dress. Don't forget to bring me 40 pieces of {ape fur} next!"},
		items = {5911, 20}
	},
	["ape fur"] = {
		value = 3,
		message = {"Were you able to retrieve 40 pieces of ape fur?", "Nice job, player. You see, I'm testing a new depilation cream. I guess if it works on ape fur it's good quality. Next, please bring me 35 {holy orchids}."},
		items = {5883, 40}
	},
	["holy orchids"] = {
		value = 4,
		message = {"Did you convince the elves to give you 35 holy orchids?", "Thank god! The scent of holy orchids is simply the only possible solution against the horrible stench from the tavern latrine. Now, please bring me 10 rolls of {spider silk yarn}!"},
		items = {5922, 35}
	},
	["spider silk yarn"] = {
		value = 5,
		message = {"Oh, did you bring 10 spools of spider silk yarn for me?", "I appreciate it. My pet doggie manages to bite through all sorts of leashes, which is why he is always gone. I'm sure this strong yarn will keep him. Now, go for the 60 {lizard scales}!"},
		items = {5886, 10}
	},
	["lizard scales"] = {
		value = 6,
		message = {"Have you found 60 lizard scales?", "Good job. They will look almost like sequins on my new dress. Please go for the 40 {red dragon scales} now."},
		items = {5881, 60}
	},
	["red dragon scales"] = {
		value = 7,
		message = {"Were you able to get all 40 red dragon scales?", "Thanks! They make a pretty decoration, don't you think? Please bring me 15 ounces of {magic sulphur} now!"},
		items = {5882, 40}
	},
	["magic sulphur"] = {
		value = 8,
		message = {"Have you collected 15 ounces of magic sulphur?", "Ah, that's enough magic sulphur for my new peeling. You should try it once, your skin gets incredibly smooth. Now, the only thing I need is {vampire dust}. 30 ounces will suffice."},
		items = {5904, 15}
	},
	["vampire dust"] = {
		value = 9,
		message = {"Have you gathered 30 ounces of vampire dust?", "Ah, great. Now I can finally finish the potion which the academy of Edron asked me to. I guess, now you want your reward, don't you?"},
		items = {5905, 30}
	}
}

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	local storage = 1061

	if not npcHandler:isFocused(cid) then
		return false
	elseif isInArray({"outfit", "addon"}, msg) then
		npcHandler:say("This {Tiara} is an award by the academy of Edron in recognition of my service here.", cid)
	elseif msgcontains(msg, "tiara") then
		if player:getStorageValue(storage) < 1 then
			npcHandler:say("Well... maybe, if you help me a little, I could convince the academy of Edron that you are a valuable help here and deserve an award too. How about it?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(storage) >= 1 and player:getStorageValue(storage) < 10 then
			npcHandler:say("Before I can nominate you for an award, please complete your task.", cid)
		elseif player:getStorageValue(storage) == 10 then
			npcHandler:say("Go to the academy in Edron and tell Zoltan that I sent you, " .. player:getName() .. ".", cid)
		end
	elseif config[msg:lower()] then
		if player:getStorageValue(storage) == config[msg:lower()].value then
			npcHandler:say(config[msg:lower()].message[1], cid)
			npcHandler.topic[cid] = 3
			message, itemId, amount = config[msg:lower()].message[2], config[msg:lower()].items[1], config[msg:lower()].items[2]
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"Okay, great! You see, I need a few magical ingredients which I've run out of. First of all, please bring me 70 bat wings. ...",
				"Then, I urgently need a lot of red cloth. I think 20 pieces should suffice. ...",
				"Oh, and also, I could use a whole load of ape fur. Please bring me 40 pieces. ...",
				"After that, um, let me think... I'd like to have some holy orchids. Or no, many holy orchids, to be safe. Like 35. ...",
				"Then, 10 spools of spider silk yarn, 60 lizard scales and 40 red dragon scales. ...",
				"I know I'm forgetting something.. wait... ah yes, 15 ounces of magic sulphur and 30 ounces of vampire dust. ...",
				"That's it already! Easy task, isn't it? I'm sure you could get all of that within a short time. ...",
				"Did you understand everything I told you and are willing to handle this task?"
			}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			player:setStorageValue(storage, 1)
			player:setStorageValue(1033, 1) --this for default start of Outfit and Addon Quests
			npcHandler:say("Fine! Let's start with the 70 {bat wings}. I really feel uncomfortable out there in the jungle.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(itemId, amount) then
				player:setStorageValue(storage, math.max(0, (player:getStorageValue(storage) or 0)) + 1)
				npcHandler:say(message, cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] >= 1 then
			npcHandler:say("That's a pity.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a sorcerer. I was sent here by the academy of Edron to function as an adviser in magical matters and as a teacher for sorcerers in need of training."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Myra is my name."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are here on the behalf of the king and try our best to make this colony prosper."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I find the Venoran activity here disturbing, but, after all, that's not my business."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais lacks the lovely peace of Edron, but as the capital of the Thaian kingdom it offers more chances to study or entertain yourself than this fledgling city."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The druids of Carlin could do a lot with all the freedom they have, but they waste their resources in some strange cult and lack any scientific approach to magic."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I loved my time at the academy. I had my differences with some superiors though, and when it came to select somebody to come here, my name was mentioned once too often I think."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am working on a spell aiming specifically on destroying plant life. I am sure it would be of enormous help and would earn me a positon in the academy once more."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have already seen more of the world as I had ever planned."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would have even preferred an appointment to the dark halls of Kazordoon than to this colony."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves are good miners, I can't say much more about them."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarves are good miners, I can't say much more about them."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves would probably be more suitable to this environment."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves would probably be more suitable to this environment."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves would probably be more suitable to this environment."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think all this talk about the conquest of a new continent is simply exaggerated."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Living in the desert must be even worse than living here."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Although I'd love to study the undeath more closely, I'd not want to study it first hand."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He wastes all his power to spread terror and destruction. Doesn't this become boring after a while?"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The magic used to create that weapon would be more interesting than the weapon itself."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are annoying but easily driven away."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lizards are somewhat mysterious, but who would care to travel through the whole cursed jungle to learn the boring secrets of some fly-eaters?"})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sooner or later we will have to face this threat in the south."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in Tibia: Sorcerers, paladins, knights, and druids."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())