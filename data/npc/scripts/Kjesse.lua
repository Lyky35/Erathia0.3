local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if msgcontains(msg, "heal") then
		local player = Player(cid)
		local npc = Npc()
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

keywordHandler:addKeyword({'pilgrimage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Whenever you receive a lethal wound, your vital force is damaged and there is a chance that you lose some of your equipment. With every single of the five {blessings} you have, this damage and chance of loss will be reduced.'})
keywordHandler:addKeyword({'spiritual'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You can ask for the blessing of spiritual shielding in the whiteflower temple south of Thais.'})
keywordHandler:addKeyword({'phoenix'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The spark of the phoenix is given by the dwarven priests of earth and fire in Kazordoon.'})
keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The druids north of Carlin will provide you with the embrace of Tibia.'})
keywordHandler:addKeyword({'suns'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You can ask for the blessing of the two suns in the suntower near Ab\'Dendriel.'})
keywordHandler:addKeyword({'solitude'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Talk to the hermit Eremo on the isle of Cormaya about this blessing.'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome, young |PLAYERNAME|! If you are heavily wounded, I can heal you for free.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Remember: If you are heavily wounded, I can heal you for free.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'May the gods bless you, |PLAYERNAME|!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())