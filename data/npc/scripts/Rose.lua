local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'flower bowl'}, 					Cfflowerbowl, 6)
shopModule:addBuyableItem({'honey flower'}, 					Cfhoneyflower, 5)
shopModule:addBuyableItem({'potted flower'}, 					Cfpottedflower, 5)
shopModule:addBuyableItem({'indoor plant'}, 					Cfindoorplant, 8)

keywordHandler:addKeyword({'flower'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell flower bowls, honey flowers, potted flowers and indoor plants."})
keywordHandler:addKeyword({'rose'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's me. I am not for sale. <giggles>"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here you may buy some of the most beautiful flowers."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I have no watch on me."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You mean my specials, don't you?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling beautiful flowers here."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling beautiful flowers here."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling beautiful flowers here."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling beautiful flowers here."})
keywordHandler:addKeyword({'furniture'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling beautiful flowers here."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling beautiful flowers here."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Rose, nice to meet you, |PLAYERNAME|."})

npcHandler:addModule(FocusModule:new())