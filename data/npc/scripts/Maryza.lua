local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm the cook of the Jolly Axeman."})
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm the cook of the Jolly Axeman."})
keywordHandler:addKeyword({'jimbin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am so proud of him. In drinking, he's second only to our mighty general."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Maryza Firehand, daughter of Earth, from the Molten Rock."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To busy, ask my husband."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't like these upper cave guys."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We could better feed some dragons instead of these fools."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heard that's what the humans call one of their boggiemen."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine drinker and strategist. Wastes his skill with these idiots of the army. What a shame."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Would slice a dragon or two for steaks if i'd get it."})
keywordHandler:addKeyword({'tark'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He loved my dragonsteaks. Heard he died by a cave in while fighting drags in the Plains of Havoc."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Puny town for puny guys."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We don't care much about outsiders anymore."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't like it, has an elfish touch, ye know?"})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The boys of the Savage Axe at the bridge are running wild in these days."})
keywordHandler:addKeyword({'rumor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The boys of the Savage Axe at the bridge are running wild in these days."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you some food if ye like."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you some food if ye like."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you some food if ye like."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell normal and brown bread, meat, ham, cookies, rolls, and cheese made of mushrooms."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'cookbook') then
		if player:getStorageValue(2002) ~= 1 then
			npcHandler:say('The cookbook of the famous dwarven kitchen. You\'re lucky. I have a few copies on sale. Do you like one for 150 gold?', cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('I\'m sorry but I sell only one copy to each customer. Otherwise they would have been sold out a long time ago.', cid)
		end

	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if not player:removeMoney(150) then
				npcHandler:say('No gold, no sale, that\'s it.', cid)
				return true
			end

			npcHandler:say('Here you are. Happy cooking!', cid)
			player:setStorageValue(2002, 1)
			player:addItem(2347, 1)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('I have but a few copies, anyway.', cid)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Welcome to the Jolly Axeman, |PLAYERNAME|. Have a good time and eat some food!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())