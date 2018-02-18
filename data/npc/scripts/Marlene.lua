local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Marlene."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm Bruno's wife. Besides: Have you already heard the latest news about the seamonster, Aneus, or the rumours in this area?"})
keywordHandler:addKeyword({'bruno'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bruno is a wonderful husband. But he is seldom at home. *looks a little bit sad*"})
keywordHandler:addKeyword({'graubart'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, old Graubart. A very nice person. But he is strange. He always is busy when I want to talk to him. *lost in thoughts*"})
keywordHandler:addKeyword({'maybe'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, maybe one day. *sigh*"})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My pleasure, I always enjoy sharing interesting stories."})

npcHandler:addModule(FocusModule:new())