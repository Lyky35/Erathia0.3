local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
shopModule:addBuyableItem({'arrow'}, 					Cfarrow, 3)
shopModule:addBuyableItem({'power bolt'}, 					Cfpowerbolt, 7)
shopModule:addBuyableItem({'bow'}, 					Cfbow, 400)
shopModule:addSellableItem({'bow'}, 					Cfbow, 100)
shopModule:addBuyableItem({'bolt'}, 					Cfbolt, 4)
shopModule:addBuyableItem({'crossbow'}, 					Cfcrossbow, 500)
shopModule:addSellableItem({'crossbow'}, 					Cfcrossbow, 500)
shopModule:addBuyableItem({'spear'}, 					Cfspear, 9)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the fletcher of Carlin. I am selling bows, crossbows, and ammunition. Do you need anything?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Perac, fletcher and marksman extraordinaire."})
keywordHandler:addKeyword({'marksman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a paladin and the best marksman in the land."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't bother me. Go and buy a watch."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was there ... once. I got out before the illusions drove me mad. Better stay out of that area!"})

npcHandler:addModule(FocusModule:new())