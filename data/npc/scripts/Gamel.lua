local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'staff'}, 					Cfstaff, 40)
shopModule:addBuyableItem({'dagger'}, 					Cfdagger, 5)
shopModule:addBuyableItem({'mace'}, 					Cfmace, 90)
shopModule:addBuyableItem({'brass helmet'}, 					Cfbrasshelmet, 120)
shopModule:addBuyableItem({'throwing knife'}, 					Cfthrowingknife, 25)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling some... things."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Names don't matter."})
keywordHandler:addKeyword({'gamel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, you know my name. Please don't tell it to the others."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell maces, staffs, daggers and brass helmets."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell maces, staffs, daggers and brass helmets."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell maces, staffs, daggers and brass helmets."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell maces, staffs, daggers and brass helmets."})
keywordHandler:addKeyword({'thing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell maces, staffs, daggers and brass helmets."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell maces, staffs, daggers and brass helmets."})

local poison = Condition(CONDITION_POISON)
poison:setParameter(CONDITION_PARAM_DELAYED, true)
poison:addDamage(2, 3000, -10)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, 'rebellion') then
		npc:say("Uhm... who sent you?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'berfasmur') then
		if npcHandler.topic[cid] == 1 then
			npc:say("So, you are a new recruit in the ranks of the rebellion! To proof your worthyness, go and get us a magic crystal.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 2
		else
			npc:say("Never heard that name!", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'magic') and msgcontains(msg, 'crystal') then
		npc:say("Did you bring me a magic crystal?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 3 then
			if player:getItemCount(Cflifecrystal) >= 1 then
				npc:say("Brilliant! Bring it to the priest Lugri so that he can cast a deathcurse on the king. The password is 'death to noodles'", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			else
				npc:say("Idiot! You don't have the crystal!", TALKTYPE_SAY)
				player:addCondition(poison)
				player:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
				Npc():getPosition():sendMagicEffect(CONST_ANI_POISON)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
