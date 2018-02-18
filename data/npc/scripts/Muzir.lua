local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am honoured to be the grandwezir of the caliph."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Muzir."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am caretaker for the fortune of our beloved and wise caliph."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am caretaker for the fortune of our beloved and wise caliph."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I take it upon me to involve myself with worldly issues for the prosperity of our community. I hope the taint of wealth does not harm my soul too much."})
keywordHandler:addKeyword({'wezir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for the wealth of our beloved and wise caliph. I can also change and deposit money for you."})
keywordHandler:addKeyword({'wealth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for the wealth of our beloved and wise caliph. I can also change and deposit money for you."})

npcHandler:addModule(FocusModule:new())
