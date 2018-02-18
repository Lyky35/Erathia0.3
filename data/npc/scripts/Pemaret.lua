local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
shopModule:addBuyableItem({'fish'}, 					Cffish, 5)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Pemaret, the fisherman."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm a fisherman and I take along people to Edron. You can also buy some fresh fish."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I love to sail on the seas of Tibia."})
keywordHandler:addKeyword({'sea'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I love to sail on the seas of Tibia."})
keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a lovely and peaceful isle. Did you already visit the nice sandy beach?"})
keywordHandler:addKeyword({'isle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a lovely and peaceful isle. Did you already visit the nice sandy beach?"})
keywordHandler:addKeyword({'beach'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is a nice sandy beach in the west of Cormaya."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My boat is ready to bring you to Edron."})
keywordHandler:addKeyword({'boat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My boat is ready to bring you to Edron."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My boat is ready to bring you to Edron."})

local function greetCallback(cid)
	local player = Player(cid)
	if player:getSex() == PLAYERSEX_MALE then
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, young man. Looking for a passage or some fish, ".. player:getName() .."?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, young lady. Looking for a passage or some fish, ".. player:getName() .."?")
	end	
	return true
end	

-- Travel
local function addTravelKeyword(keyword, text, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Maybe later.', reset = true})
	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('edron', 'Do you want to get to Edron for |TRAVELCOST|?', 20, Position(33176, 31764, 6))
addTravelKeyword('eremo', 'Oh, you know the good old sage Eremo. I can bring you to his little island. Do you want me to do that?', 0, Position(33314, 31883, 7))

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(33293, 31957, 6), Position(33294, 31955, 6), Position(33294, 31958, 6)}})


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
