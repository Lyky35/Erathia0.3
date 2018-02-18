local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'brass shield'}, 					Cfbrassshield, 16)
shopModule:addSellableItem({'plate shield'}, 					Cfplateshield, 31)
shopModule:addSellableItem({'battle shield'}, 					Cfbattleshield, 95)
shopModule:addSellableItem({'guardian shield'}, 					Cfguardianshield, 180)
shopModule:addSellableItem({'dragon shield'}, 					Cfdragonshield, 360)
shopModule:addSellableItem({'coat'}, 					Cfcoat, 1)
shopModule:addSellableItem({'jacket'}, 					Cfjacket, 1)
shopModule:addSellableItem({'brass armor'}, 					Cfbrassarmor, 112)
shopModule:addSellableItem({'knight armor'}, 					Cfknightarmor, 875)
shopModule:addSellableItem({'golden armor'}, 					Cfgoldenarmor, 1500)
shopModule:addSellableItem({'brass helmet'}, 					Cfbrasshelmet, 30)
shopModule:addSellableItem({'viking helmet'}, 					Cfvikinghelmet, 66)
shopModule:addSellableItem({'iron helmet'}, 					Cfironhelmet, 145)
shopModule:addSellableItem({'devil helmet'}, 					Cfdevilhelmet, 450)
shopModule:addSellableItem({'warrior helmet'}, 					Cfwarriorhelmet, 696)
shopModule:addSellableItem({'leather legs'}, 					Cfleatherlegs, 1)
shopModule:addSellableItem({'chain legs'}, 					Cfchainlegs, 20)
shopModule:addSellableItem({'brass legs'}, 					Cfbrasslegs, 49)
shopModule:addSellableItem({'plate legs'}, 					Cfplatelegs, 115)
shopModule:addSellableItem({'knight legs'}, 					Cfknightlegs, 375)
shopModule:addSellableItem({'dagger'}, 					Cfdagger, 1)
shopModule:addSellableItem({'longsword'}, 					Cflongsword, 51)
shopModule:addSellableItem({'spike sword'}, 					Cfspikesword, 225)
shopModule:addSellableItem({'fire sword'}, 					Cffiresword, 1000)
shopModule:addSellableItem({'mace'}, 					Cfmace, 23)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am buying some weapons and armors."})
keywordHandler:addKeyword({'forestaller'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am buying some weapons and armors."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Hardek, the forestaller."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I buy stuff. If you want to sell something, offer it to me, and we'll see if it catches my interest."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})

npcHandler:addModule(FocusModule:new())