local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am miss Penny, your secretary."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm your secretary. I'm organizing all those criminal records and your mail."})
keywordHandler:addKeyword({'criminal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'record'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<Sigh> It's an evil world, isn't it?"})
keywordHandler:addKeyword({'mail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can get a letter from me."})

local function greetCallback(cid)
	local player = Player(cid)
	if player:getSex() == PLAYERSEX_MALE then
		npcHandler:setMessage(MESSAGE_GREET, "Welcome home, Sir ".. player:getName() ..".")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Welcome home, Lady ".. player:getName() ..".")
	end	
	return true
end	

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if msgcontains(msg, 'letter') then
		Player(cid):addItem(Cfletter, TALKTYPE_SAY)
		Npc():say("Here you are.", TALKTYPE_SAY)
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
