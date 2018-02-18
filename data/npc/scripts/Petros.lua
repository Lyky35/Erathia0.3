local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Petros"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I take along people to Venore, Port Hope and Ankrahmun."})
keywordHandler:addKeyword({'ghost'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I don't believe in ghosts."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My boat is ready to bring you to Venore, Port Hope or Ankrahmun."})
keywordHandler:addKeyword({'boat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My boat is ready to bring you to Venore, Port Hope or Ankrahmun."})

-- Travel
local function addTravelKeyword(keyword, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('venore', 60, Position(32954, 32022, 6))
addTravelKeyword('port hope', 180, Position(32527, 32784, 6))
addTravelKeyword('liberty bay', 200, Position(32285, 32892, 6))
addTravelKeyword('ankrahmun', 100, Position(33092, 32883, 6))

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = {Position(33288, 32474, 6), Position(33291, 32474, 6), Position(33293, 32471, 6)}})


npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, |PLAYERNAME|. Where can I sail you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye")
npcHandler:addModule(FocusModule:new())
