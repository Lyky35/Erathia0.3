local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bread'}, 					Cfbread, 4)
shopModule:addBuyableItem({'cheese'}, 					Cfcheese, 6)
shopModule:addBuyableItem({'meat'}, 					Cfmeat, 5)
shopModule:addBuyableItem({'ham'}, 					Cfham, 8)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm the keeper of the inn. You can buy food here."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Scott."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I'm happy to live in this world full of thrilling things."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's the capital in the southwest of Tibia."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sometimes I travel to Carlin and visit the market."})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is a strong and wise leader. We owe protection from evil monsters to her."})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a peaceful island. Cold and lonesome but I like it."})
keywordHandler:addKeyword({'mage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is said that there are some secrets to discover around the mage's castle."})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is said that there are some secrets to discover around the mage's castle."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can get bread, cheese, ham, or meat."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can get bread, cheese, ham, or meat."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can get bread, cheese, ham, or meat."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you looking for food? I have bread, cheese, ham, and meat."})

npcHandler:addModule(FocusModule:new())