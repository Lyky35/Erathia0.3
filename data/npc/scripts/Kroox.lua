local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell best armor in land. My armor save you life. Better buy much."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell best armor in land. My armor save you life. Better buy much."})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Kroox Shieldbearer, son of Earth, from the Molten Rock."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy all kinds of armor. Dwarfish are the best, jawoll!"})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are proud fellows."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You not be afraid, here you be save."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Much fun you can have in dungeons. Much battle and much gold, jawoll!"})
keywordHandler:addKeyword({'mines'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Foreigners not welcome in mines. An evil basilisk rob our deeper mines."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I you thank, too."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? I sell armor, helmets, shields, and legs."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? I sell armor, helmets, shields, and legs."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? I sell armor, helmets, shields, and legs."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I offer armor, helmets, legs, and shields."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask in the shop next tunnel about that."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell chain helmets, brass helmets, iron helmets, and steel helmets. What you want?"})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell chain armor, brass armor, and plate armor. What you need?"})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell steel shields, dwarven shields, brass shields, and plate shields. What you want?"})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am selling chain legs, and brass legs. What you need?"})
keywordHandler:addKeyword({'you buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You want sell any armor?"})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "measurements") then
		if player:getStorageValue(2011) >= 1 and player:getStorageValue(2020) ~= 1 then
			npcHandler:say("Hm, well I guess its ok to tell you ... <tells you about Lokurs measurements> ", cid)
			player:setStorageValue(2011, player:getStorageValue(2011) + 1)
			player:setStorageValue(2020, 1)
		else
			npcHandler:say("UH? No clue what you are talking about, jawoll.", cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())