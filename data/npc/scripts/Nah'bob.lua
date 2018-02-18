local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'wares'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My job around here is to buy and sell weapons, armors, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying spike swords, war hammers and obsidian lances. Furthermore I would buy fire swords, ice rapiers, dragon lances, fire axes and broadswords from you, if you have any."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm just selling beholder shields. But I'm buying guardian shields, dragon shields, beholder shields, crown shields, medusa shields and phoenix shields."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm selling and buying noble armors. Furthermore I'm buying dragon scale mails, crown armors and blue robes."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm not selling any helmets. I'm only buying crown helmets, crusader helmets and royal helmets."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At this time I'm only buying crown legs. Oh, and I'm also looking for boots of haste!"})

local function greetCallback(cid, message)
	if Player(cid):getStorageValue(1094) ~= 1 then
		npcHandler:say('I\'m sorry, pal. But you need Gabel\'s permission to trade with me.', cid)
		return false
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "<Sighs> Another customer! I've only just sat down! What is it, |PLAYERNAME|?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye now, Neutrala |PLAYERNAME|. Visit old Bob again one day!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye then.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())