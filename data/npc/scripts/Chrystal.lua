local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for this post office."})
keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mr. Postner is the leader of our guild and the most prominent postofficer in the whole land."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mr. Postner is the leader of our guild and the most prominent postofficer in the whole land."})
keywordHandler:addKeyword({'postmasters guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, our guild is the lifeblood of the tibia cominity so to say."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can apply to join only at our headquarter."})
keywordHandler:addKeyword({'headquarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can find it on the road from Thais to Kazordoon."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hail to the king!"})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hail to the king!"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The army ensures the safety of the traderoutes and of our mail system."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I bet he never gets any letters."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better ask knights about that."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our post system spans the entire known world."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We deliver letters and parcels even there."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our post system even delivers letters and parcels to and from this isle."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, that's postal secret."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, that's postal secret."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "measurements") then
		if player:getStorageValue(2011) >= 1 and player:getStorageValue(2018) ~= 1 then
			npcHandler:say("If its necessary ... <tells you her measurements>", cid)
			player:setStorageValue(2011, player:getStorageValue(2011) + 1)
			player:setStorageValue(2018, 1)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "At your service |PLAYERNAME| and welcome to the post office.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Who is next?")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Who is next?")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here. Don't forget that you need to buy a label too if you want to send a parcel. Always write the name of the receiver in the first line.")
npcHandler:addModule(FocusModule:new())