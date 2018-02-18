local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the overseer of the mines."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am called Shirith Blooddancer."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think those humans are trespassing elven teritory far too often."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is far away as all humans should be."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If it comes to trade, I can respect those merchants. As long as they leave as soon as they finished buisness, that is."})
keywordHandler:addKeyword({'roderick'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We don't need him or any other ambassador here."})
keywordHandler:addKeyword({'olrik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As a post officer he has some use ... as a troll has some use for mining."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are a superior race, indeed."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They could be of ... some use."})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Humans are more annoying than our trolls"})
keywordHandler:addKeyword({'troll'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We give these useless creatures a reason to live by serving us."})
keywordHandler:addKeyword({'cenath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They think they are better then us."})
keywordHandler:addKeyword({'kuridai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We keep this society running. Without our tools and work our case would be a lost one."})
keywordHandler:addKeyword({'deraisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They could do more for us if they would try more hard."})
keywordHandler:addKeyword({'abdaisim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let them go, we don't need them."})
keywordHandler:addKeyword({'teshial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Who needs dreamers in these days?"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He should be destroyed."})
keywordHandler:addKeyword({'mines'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We hardly get the ore we need. The worthless trolls are lazy workers. I keep them locked up the whole time."})
keywordHandler:addKeyword({'locked'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I keep the keys to the mines."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nonsense."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Trolls are boring, I have no news to tell."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, 'key') then
		npc:say("I would sell you a key for 50 gold, ok?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1	
	elseif msgcontains(msg, 'yes') and  npcHandler.topic[cid] == 1 then
		if player:removeMoney(50) then
			local key = player:addItem(2088, 1)
			key:setActionId(3033)
			npc:say("Here it is.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		else
			npc:say("You do not have enough gold.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'no') and  npcHandler.topic[cid] == 1 then
		npc:say("Ok, then not.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())