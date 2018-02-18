local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I am just sitting around here and gamble now and then."})
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a fine place to be around, isn't it?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Zebron."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, our beloved king! Bless him for the gambling licence of Venore."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, our beloved king! Bless him for the gambling licence of Venore."})
keywordHandler:addKeyword({'licence'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care much for that law stuff, but as far as I know those Venore merchants got a royal gambling licence for the city."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Aaaah, Venore, Venore, what a wonderful town. Especially for someone with love for gambling like me."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hehe, they spent a good part of their salary here in the tavern."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would not bet that anyone will ever find it."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is a bit too conservative for me."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What would I need more than that what I can get right here?"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin, the beerless ... what a shame."})
keywordHandler:addKeyword({'hugo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I had a cousin named hugo, why do you ask?"})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, always the same chitchat. Swampelves this and amazons that ... blah blah."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, always the same chitchat. Swampelves this and amazons that ... blah blah."})
keywordHandler:addKeyword({'swamp'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, always the same chitchat. Swampelves this and amazons that ... blah blah."})
keywordHandler:addKeyword({'amazon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, always the same chitchat. Swampelves this and amazons that ... blah blah."})

npcHandler:addModule(FocusModule:new())