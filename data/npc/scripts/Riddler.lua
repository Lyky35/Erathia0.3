local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as the riddler. That is all you need to know."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the guardian of the paradox tower."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is the age of the talon."})
keywordHandler:addKeyword({'tower'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This tower, of course, silly one. It holds my master's treasure."})
keywordHandler:addKeyword({'paradox'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This tower, of course, silly one. It holds my master's treasure."})
keywordHandler:addKeyword({'master'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His name is none of your business."})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am guarding the treasures of the tower. Only those who pass the test of the three sigils may pass."})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am guarding the treasures of the tower. Only those who pass the test of the three sigils may pass."})
keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The key of this tower! You will never find it! A malicious plant spirit is guarding it!"})
keywordHandler:addKeyword({'door'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The key of this tower! You will never find it! A malicious plant spirit is guarding it!"})

npcHandler:addModule(FocusModule:new())