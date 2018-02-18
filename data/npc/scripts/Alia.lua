local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm a nun, serving the gods of Tibia in this temple. I also heal wounded adventurers."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Alia."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's where we are. The world Tibia."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created Tibia and all life on it."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't mention this name here."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I can't help you with that."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uh, don't ask. Thats a place even the brave women of carlin don't dare to explore them!!!"})
keywordHandler:addKeyword({'blessing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lifeforce of this world is waning. There are no more blessings avaliable on this world."})
keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lifeforce of this world is waning. There are no more blessings avaliable on this world."})
keywordHandler:addKeyword({'pilgrimage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Whenever you receive a lethal wound your lifeforce is damaged. With every single of the five blessings you have this damage will be reduced."})
keywordHandler:addKeyword({'ashes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Whenever you receive a lethal wound your lifeforce is damaged. With every single of the five blessings you have this damage will be reduced."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "heal") then
		if player:getHealth() < 40 then
			npc:say("You are looking really bad. Let me heal your wounds.", TALKTYPE_SAY)
			player:addHealth(40)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
			npc:say("You aren't looking really bad. Sorry, I can't help you.", TALKTYPE_SAY)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())