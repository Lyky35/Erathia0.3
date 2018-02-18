local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'golden mug'}, 					Cfgoldenmug, 950)
shopModule:addSellableItem({'life crystal'}, 					Cflifecrystal, 450)
shopModule:addSellableItem({'ankh'}, 					Cfankh, 100)
shopModule:addSellableItem({'small oil lamp'}, 					Cfsmalloillamp, 270)
shopModule:addSellableItem({'frozen starlight'}, 					Cffrozenstarlight, 9500)
shopModule:addSellableItem({'mind stone'}, 					Cfmindstone, 200)
shopModule:addSellableItem({'gold ring'}, 					Cfgoldring, 8000)

keywordHandler:addKeyword({'silver guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are our elite forces."})
keywordHandler:addKeyword({'red guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Most of the red guards serve as cityguards, some work for the TBI though."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no news for the public."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "HAIL TO KING TIBIANUS!"})
keywordHandler:addKeyword({'leader'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "HAIL TO KING TIBIANUS!"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the sheriff of the Thaian territory."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am fine, thanks."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am in the safety business."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I usually work with the townguards only."})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I usually work with the townguards only."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Old Bloodblade does a fine job."})
keywordHandler:addKeyword({'enem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our enemies are numerous and not all are obvious."})
keywordHandler:addKeyword({'criminal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our enemies are numerous and not all are obvious."})
keywordHandler:addKeyword({'murderer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our enemies are numerous and not all are obvious."})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The castle should be relatively safe from criminal transgressions."})
keywordHandler:addKeyword({'subject'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are certain criminal objects in the population of our town."})
keywordHandler:addKeyword({'secret police'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All i can tell you is, that it's known as the TBI."})
keywordHandler:addKeyword({'tbi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Tibian Bureau of Investigation. If you want to know more, ask Chester Kahs about it, but I doubt you'll get any vital information."})
keywordHandler:addKeyword({'chester'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His bureau is at the northgate."})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city is not as bad as some people might claim, but we certainly have our problems here."})
keywordHandler:addKeyword({'problem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We will handle each problem with care."})
keywordHandler:addKeyword({'stutch'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine warrior, indeed. He is one of the king's bodyguards."})
keywordHandler:addKeyword({'harsky'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine warrior, indeed. He is one of the king's bodyguards."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He's so funny, I could listen to his jokes for hours."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sam, the Thaian smith, is a man of great diligence. Whenever in need of weapons or armor, just ask him."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sam, the Thaian smith, is a man of great diligence. Whenever in need of weapons or armor, just ask him."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sam, the Thaian smith, is a man of great diligence. Whenever in need of weapons or armor, just ask him."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A woman of great skill and courage. No one deserves the title of a Grandmaster of the Paladins more then her."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He was a rowdy in his youth, but now he's a fine citizen as far as I can tell."})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The poor fool lost his mind some years ago. It's a good thing they gave him a job in the post office."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He attacked our town at several occasions but was repelled each time."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Look up our 'Tibia's most wanted' lists."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Look up our 'Tibia's most wanted' lists."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am follower of Banor."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the patron of justice and bravery."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't mention this name!"})
keywordHandler:addKeyword({'brog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The more primitive races such as orcs often worship the raging one."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais should be relatively safe from direct assaults of monsters."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you have any news about the whereabouts of that blade, report it to me."})
keywordHandler:addKeyword({'rebellion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Luckily that's nothing I have to care about."})

local guardCondition = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
guardCondition:setParameter(CONDITION_PARAM_DELAYED, 10)
guardCondition:addDamage(10, 3000, -10)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if isInArray(swear, msg) then
		local player = Player(cid)
		local npc = Npc()
		npc:say("Take this!", TALKTYPE_SAY)
		npc:getPosition():sendDistanceEffect(player:getPosition(), CONST_ANI_FIRE)
		player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
		player:addCondition(guardCondition)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())