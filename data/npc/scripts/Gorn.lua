

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'basket'},Cfbasket,6)
shopModule:addBuyableItem({'black book'},Cfblackbook,15)
shopModule:addBuyableItem({'bottle'},Cfbottle,3)
shopModule:addBuyableItem({'brown book'},Cfbrownbook,15)
shopModule:addBuyableItem({'bucket'},Cfbucket,4)
shopModule:addBuyableItem({'candelabrum'},Cfcandelabrum,8)
shopModule:addBuyableItem({'candlestick'},Cfcandlestick,2)
shopModule:addBuyableItem({'closed trap'},Cfclosedtrap,280)
shopModule:addBuyableItem({'crowbar'},Cfcrowbar,260)
shopModule:addBuyableItem({'cup'},Cfcup,2)
shopModule:addBuyableItem({'document'},Cfdocument,12)
shopModule:addBuyableItem({'fishing rod'},Cffishingrod,150)
shopModule:addBuyableItem({'football'},Cffootball,111)
shopModule:addBuyableItem({'greeting card'},Cfgreetingcard,30)
shopModule:addBuyableItem({'grey small book'},Cfgreysmallbook,15)
shopModule:addBuyableItem({'inkwell'},Cfinkwell,10)
shopModule:addBuyableItem({'jug'},Cfjug,10)
shopModule:addBuyableItem({'machete'},Cfmachete,35)
shopModule:addBuyableItem({'mug'},Cfmug,1)
shopModule:addBuyableItem({'backpack'},1988,20)
shopModule:addBuyableItem({'bag'},1987,5)
shopModule:addBuyableItem({'parchment'},Cfparchment,8)
shopModule:addBuyableItem({'pick'},Cfpick,50)
shopModule:addBuyableItem({'plate'},Cfplate,6)
shopModule:addBuyableItem({'present'},Cfpresent,10)
shopModule:addBuyableItem({'rope'},Cfrope,50)
shopModule:addBuyableItem({'scroll'},Cfscroll,5)
shopModule:addBuyableItem({'scythe'},Cfscythe,50)
shopModule:addBuyableItem({'shovel'},Cfshovel,50)
shopModule:addBuyableItem({'torch'},Cftorch,2)
shopModule:addBuyableItem({'watch'},Cfwatch,20)
shopModule:addBuyableItem({'worm'},Cfworm,1)


shopModule:addSellableItem({'blue book'},Cfbluebook,20)
shopModule:addSellableItem({'backpack'},Cfbackpack,20)
shopModule:addSellableItem({'closed trap'},Cfclosedtrap,75)
shopModule:addSellableItem({'crowbar'},Cfcrowbar,50)
shopModule:addSellableItem({'fishing rod'},Cffishingrod,40)
shopModule:addSellableItem({'gemmed book'},Cfgemmedbook,100)
shopModule:addSellableItem({'green book'},Cfgreenbook,15)
shopModule:addSellableItem({'inkwell'},Cfinkwell,8)
shopModule:addSellableItem({'machete'},Cfmachete,6)
shopModule:addSellableItem({'orange book'},Cforangebook,30)
shopModule:addSellableItem({'parchment '},Cfparchment,5)
shopModule:addSellableItem({'pick'},Cfpick,15)
shopModule:addSellableItem({'rope'},Cfrope,15)
shopModule:addSellableItem({'scythe'},Cfscythe,10)
shopModule:addSellableItem({'shovel'},Cfshovel,8)
shopModule:addSellableItem({'watch'},Cfwatch,6)
shopModule:addSellableItem({'wooden hammer'},Cfwoodenhammer,15)


keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling equipment of all kinds. Do you need anything?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Gorn. My goods are known all over Tibia."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you are looking for food, go to Frodo's Hut."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He advices newcomers to buy at my store. I love that guy!"})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's a pretty one."})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hardly know him."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Armies are too hierarchical for my taste."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We had a clash or two in the old days."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like titles."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Strong as an ox, could armwrestle a minotaur, I bet."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Frodo is a jolly fellow."})
keywordHandler:addKeyword({'elaine'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elane is the leader of the paladin guild."})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elane is the leader of the paladin guild."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can find Muriel in the sorcerer guild."})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can find Muriel in the sorcerer guild."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even the strong knights need my equipment on their travels though Tibia."})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even the strong knights need my equipment on their travels though Tibia."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These druids are nice people, you will find them in the east of the town."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These druids are nice people, you will find them in the east of the town."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah! Go away with this bozoguy."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Old Baxter was a rowdy, once. In our youth we shared some adventures and women."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This Oswald has not enough to work and too much time to spread rumours."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hardly know the McRonalds."})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hardly know the McRonalds."})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hardly know the McRonalds."})
keywordHandler:addKeyword({'lurgi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Never heared that name."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would pay thousands of gold coins for this weapon."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Taxes will increase soon, so buy as much as you can right now."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My inventory is large, just have a look at the blackboards."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My inventory is large, just have a look at the blackboards."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My inventory is large, just have a look at the blackboards."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My inventory is large, just have a look at the blackboards."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My inventory is large, just have a look at the blackboards."})
keywordHandler:addKeyword({'ammunition'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Galuna sells them now in her own shop. Go and ask her about that."})
keywordHandler:addKeyword({'crossbow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Galuna sells them now in her own shop. Go and ask her about that."})
keywordHandler:addKeyword({'bow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Galuna sells them now in her own shop. Go and ask her about that."})
keywordHandler:addKeyword({'arrow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Galuna sells them now in her own shop. Go and ask her about that."})
keywordHandler:addKeyword({'bolt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Galuna sells them now in her own shop. Go and ask her about that."})
keywordHandler:addKeyword({'galuna'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the past she delivered me with all the bows and arrows. She has now her own shop at the paladin guild."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Magic? Ask a sorcerer or druid about that."})
keywordHandler:addKeyword({'fluid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Find the magic shop."})
keywordHandler:addKeyword({'xodet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He owns the magic shop here. But be aware: The prices are enormous."})
keywordHandler:addKeyword({'book'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I offer different kind of books: brown, black and small books. Which book do you want?"})

npcHandler:addModule(FocusModule:new())

