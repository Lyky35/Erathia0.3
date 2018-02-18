local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'white pearl'}, 					Cfwhitepearl, 160)
shopModule:addSellableItem({'black pearl'}, 					Cfblackpearl, 280)
shopModule:addSellableItem({'small diamond'}, 					Cfsmalldiamond, 300)
shopModule:addSellableItem({'small sapphire'}, 					Cfsmallsapphire, 250)
shopModule:addSellableItem({'small ruby'}, 					Cfsmallruby, 250)
shopModule:addSellableItem({'small emerald'}, 					Cfsmallemerald, 250)
shopModule:addSellableItem({'small amethyst'}, 					Cfsmallamethyst, 200)

shopModule:addBuyableItem({'wedding ring'}, 					Cfweddingring, 990)
shopModule:addBuyableItem({'golden amulet'}, 					Cfgoldenamulet, 6600)
shopModule:addBuyableItem({'ruby necklace'}, 					Cfrubynecklace, 3560)
shopModule:addBuyableItem({'white pearl'}, 					Cfwhitepearl, 320)
shopModule:addBuyableItem({'black pearl'}, 					Cfblackpearl, 560)
shopModule:addBuyableItem({'small diamond'}, 					Cfsmalldiamond, 600)
shopModule:addBuyableItem({'small sapphire'}, 					Cfsmallsapphire, 500)
shopModule:addBuyableItem({'small ruby'}, 					Cfsmallruby, 500)
shopModule:addBuyableItem({'small emerald'}, 					Cfsmallemerald, 500)
shopModule:addBuyableItem({'small amethyst'}, 					Cfsmallamethyst, 400)


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a jeweller. Maybe you want to have a look at my wonderful offers. I also exchange and deposit money."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Tezila Gemcutter, daughter of Fire, from the Savage Axes."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell you glittering gems, precious pearls or some ... uhm ... jolly jewels."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell you glittering gems, precious pearls or some ... uhm ... jolly jewels."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell you glittering gems, precious pearls or some ... uhm ... jolly jewels."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can sell you glittering gems, precious pearls or some ... uhm ... jolly jewels."})
keywordHandler:addKeyword({'gem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy and sell small diamonds, sapphires, rubies, emeralds, and amethysts."})
keywordHandler:addKeyword({'pearl'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have white and black pearls you can buy, but you can also sell me some."})
keywordHandler:addKeyword({'jewel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can purchase our fine dwarfish wares like wedding rings, golden amulets, and ruby necklaces."})
keywordHandler:addKeyword({'talon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am suspicious of these magic gems. Better you ask some mages about this."})

npcHandler:addModule(FocusModule:new())	