local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once I was the master of all mages, but now I only protect this crypt."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Skjaar the Mage, master of all spells."})
keywordHandler:addKeyword({'door'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This door seals a crypt."})
keywordHandler:addKeyword({'crypt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here lies my master. Only his closest followers may enter."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm not here to help anybody. I only protect my master's crypt."})
keywordHandler:addKeyword({'mountain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hundreds of years my master's castle stood on the top of this mountain. Now there is a volcano."})
keywordHandler:addKeyword({'volcano'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can still feel the magical energy in the volcano."})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The castle was destroyed when my master tried to summon a nameless creature. All that is left is this volcano."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To those who have lived for a thousand years time holds no more terror."})
keywordHandler:addKeyword({'master'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you are one of his followers, you need not ask about him, for you will know. And if you aren't, you are not worthy anyway!"})

npcHandler:addModule(FocusModule:new())