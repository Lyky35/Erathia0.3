local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'harp'}, 					Cfharp, 50)
shopModule:addBuyableItem({'piano'}, 					Cfpiano, 200)
shopModule:addBuyableItem({'lyre'}, 					Cflyre, 120)
shopModule:addBuyableItem({'lute'}, 					Cflute, 195)
shopModule:addBuyableItem({'drum'}, 					Cfdrum, 140)
shopModule:addBuyableItem({'simple fanfare'}, 					Cfsimplefanfare, 150)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I make instruments and sometimes I'm wandering through the lands of Tibia as a bard."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Julian."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't know what time it is."})
keywordHandler:addKeyword({'music'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Music is the food of love."})
keywordHandler:addKeyword({'bard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bards from all over the world come here to buy their instruments."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here you can buy lyres, lutes, drums, and simple fanfares. I also have a piano and a harp."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here you can buy lyres, lutes, drums, and simple fanfares. I also have a piano and a harp."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here you can buy lyres, lutes, drums, and simple fanfares. I also have a piano and a harp."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here you can buy lyres, lutes, drums, and simple fanfares. I also have a piano and a harp."})
keywordHandler:addKeyword({'instrument'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here you can buy lyres, lutes, drums, and simple fanfares. I also have a piano and a harp."})

npcHandler:addModule(FocusModule:new())