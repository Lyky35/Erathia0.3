local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Whoah. That was a large shadow passing by.'} }
npcHandler:addModule(VoiceModule:new(voices))

local travelNode = keywordHandler:addKeyword({'calassa'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'That is quite a long unprofitable travel. I\'ll bring you to Calassa though. Do you want me to do it?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 200, destination = Position(31911, 32710, 6) })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe another time, then.'})

keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Welcome on board, noble |PLAYERNAME|. I can bring you to Calassa.'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Welcome on board, noble |PLAYERNAME|. I can bring you to Calassa.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})

npcHandler:setMessage(MESSAGE_GREET, "Ahoy, |PLAYERNAME|. On a mission for the explorer society, eh?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:addModule(FocusModule:new())
