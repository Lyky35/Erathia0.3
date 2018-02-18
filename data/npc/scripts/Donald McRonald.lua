local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'wheat'}, 					Cfwheat, 1)
shopModule:addBuyableItem({'cheese'}, 					Cfcheese, 5)
shopModule:addBuyableItem({'carrot'}, 					Cfcarrot, 3)
shopModule:addBuyableItem({'corncob'}, 					Cfcorncob, 3)

keywordHandler:addKeyword({'weather'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Weather is good enough to work on the fields."})
keywordHandler:addKeyword({'crops'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I take care of our crops"})
keywordHandler:addKeyword({'crop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is hard to grow but worth the effort."})
keywordHandler:addKeyword({'field'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My fields are enchanted by the druids and the wheat grows very quickly."})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city is to the north."})
keywordHandler:addKeyword({'mill'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I somtimes have to bring the wheat there."})
keywordHandler:addKeyword({'spooked'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I dont know."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus is our king."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Frodo? He is a friend of mine."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He ignores us and we ignore him."})
keywordHandler:addKeyword({'bloodblade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A general in the army."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Too noble to care about us."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hardly know him."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A blacksmith, eh?"})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A generous person."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She has a good soul."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you wheat, cheese, carrots, and corncobs."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you wheat, cheese, carrots, and corncobs."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can offer you wheat, cheese, carrots, and corncobs."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you looking for food? I have wheat, cheese, carrots, and corn to sell. If you want to sell bread, talk to my wife, Sherry."})
keywordHandler:addKeyword({'bread'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you want to sell bread, talk to my wife, Sherry."})

local function greetCallback(cid)
	if Player(cid):isDruid() then
		npcHandler:setMessage(MESSAGE_GREET, "Hello, Druid |PLAYERNAME|!")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hmmm, well, hello |PLAYERNAME|!")
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())