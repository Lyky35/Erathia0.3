local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'shovel'}, 					Cfshovel, 20)
shopModule:addBuyableItem({'scythe'}, 					Cfscythe, 25)
shopModule:addBuyableItem({'pick'}, 					Cfpick, 50)
shopModule:addBuyableItem({'rope'}, 					Cfrope, 50)
shopModule:addBuyableItem({'rod'}, 					Cffishingrod, 150, 0, 'fishing rod')
shopModule:addBuyableItem({'crowbar'}, 					Cfcrowbar, 260)
shopModule:addBuyableItem({'machete'}, 					Cfmachete, 35)
shopModule:addBuyableItem({'pitchfork'}, 					Cfpitchfork, 25)
shopModule:addBuyableItem({'rake'}, 					Cfrake, 20)
shopModule:addBuyableItem({'hoe'}, 					Cfhoe, 15)
shopModule:addBuyableItem({'broom'}, 					Cfbroom, 12)
shopModule:addBuyableItem({'worm'}, 					Cfworm, 1)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To keep my thumbs green and to sell our garden equipment, as you can see on that shelves."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "May he bless all plants."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Nelliem."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a good time to sow some seeds."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, machetes, ropes, pitchforks, rakes, hoes, brooms, fishing rods, worms and brandnew crowbars from Kazordoon."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, machetes, ropes, pitchforks, rakes, hoes, brooms, fishing rods, worms and brandnew crowbars from Kazordoon."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, machetes, ropes, pitchforks, rakes, hoes, brooms, fishing rods, worms and brandnew crowbars from Kazordoon."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, machetes, ropes, pitchforks, rakes, hoes, brooms, fishing rods, worms and brandnew crowbars from Kazordoon."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell shovels, picks, scythes, machetes, ropes, pitchforks, rakes, hoes, brooms, fishing rods, worms and brandnew crowbars from Kazordoon."})

npcHandler:addModule(FocusModule:new())