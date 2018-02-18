local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known all over the world as Captain Sinbeard"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can transport everything you want."})
keywordHandler:addKeyword({'passanger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We would like to welcome you on board."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})

-- Travel
local function addTravelKeyword(keyword, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})

	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('edron', 160, Position(33175, 31764, 6))
addTravelKeyword('venore', 150, Position(32954, 32022, 6))
addTravelKeyword('port hope', 80, Position(32527, 32784, 6))
addTravelKeyword('liberty bay', 90, Position(32285, 32892, 6))
addTravelKeyword('darashia', 100, Position(33289, 32480, 6))

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(33082, 32879, 6), Position(33085, 32879, 6), Position(33085, 32881, 6)}})

npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Sir |PLAYERNAME|. Where can I sail you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Recommend us if you were satisfied with our service.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye then.")
npcHandler:addModule(FocusModule:new())
