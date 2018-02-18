local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'sell crossbow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't buy used crossbows."})
keywordHandler:addKeyword({'sell bow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't buy used bows."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the local fletcher. I am selling bows, crossbows, and ammunition. Do you need anything?"})
keywordHandler:addKeyword({'fletcher'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the local fletcher. I am selling bows, crossbows, and ammunition. Do you need anything?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Galuna, paladin and fletcher."})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are feared warriors and good marksmen. Ask Elane if want to know more about the guild."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is the leader of all paladins."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I supplied him with my goods in the past, now I sell them myself."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't bother me. Go and buy a watch."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia, a green island. Here it is wunderful to walk into the forests and to hunt with a bow."})
keywordHandler:addKeyword({'forest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia, a green island. Here it is wunderful to walk into the forests and to hunt with a bow."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have visitors of all kind in Thais, only elves show up seldom."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is rumored that they live in the northeast of Tibia. They are the best in archery."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is rumored that they live in the northeast of Tibia. They are the best in archery."})

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'arrow'},		Cfarrow,	2)
shopModule:addBuyableItem({'power bolt'},	Cfpowerbolt,	7)
shopModule:addBuyableItem({'crossbow'},		Cfcrossbow,	500)
shopModule:addBuyableItem({'bow'}, 		Cfbow,		400)
shopModule:addBuyableItem({'bolt'}, 		Cfbolt,		3)
shopModule:addBuyableItem({'spear'}, 		Cfspear,	9)
shopModule:addSellableItem({'spear'}, 		Cfspear,	3)

npcHandler:addModule(FocusModule:new())