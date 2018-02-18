local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kevin Postner was already leader of the guild as I joined. I can't imagine anyone better for that position."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kevin Postner was already leader of the guild as I joined. I can't imagine anyone better for that position."})
keywordHandler:addKeyword({'postmasters guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our guild relys heavily on the honor and trustworthyness of its members."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You might apply for a membership in our haedquarter."})
keywordHandler:addKeyword({'headquarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its just south oh Kazordoon. Follow the road and you will run right into it."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am working here at the post office. If you have questions about the Royal Carlin Mail System or the depots ask me."})
keywordHandler:addKeyword({'office'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I rarely leave my office. You are welcome at any time."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Liane."})
keywordHandler:addKeyword({'depot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The depots are very easily to use. Just step in front of them and you will find your items in them. They are free for all citizens. Hail our Queen!"})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our Queen's rule makes Carlin prosper."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our wonderful town is protected by the wise Queen Eloise."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A town ruled by men, a dangerous place. Anyway, we bring also letters and parcels there."})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the postman in Thais and somewhat stupid. But he never sents wrong letters or parcels."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We don't deliver letters or parcels there, sorry."})
keywordHandler:addKeyword({'wally'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wally and I became pen-pals in the course of years."})

local voices = {
	'Welcome to the post office!',
	'Hey, send a letter to your friend now and then. Keep in touch, you know.',
	'If you need help with letters or parcels, just ask me. I can explain everything.',
	'No, no, no, there IS no parcel bug, I\'m telling you!'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "measurements") then
		if player:getStorageValue(2011) >= 1 and player:getStorageValue(2019) ~= 1 then
			npcHandler:say("I have more urgent problem to attend then that. Those hawks are hunting my carrier pigeons. Bring me 12 arrows and I'll see if I have the time for this nonsense. Do you have 12 arrows with you? ", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(2544, 12) then
				npcHandler:say("Great! Now I'll teach them a lesson ... For those measurements ... <tells you her measurements> ", cid)
				player:setStorageValue(2011, player:getStorageValue(2011) + 1)
				player:setStorageValue(2019, 1)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hello. How may I help you |PLAYERNAME|? Ask me for a trade if you want to buy something. I can also explain the mail system.")
npcHandler:setMessage(MESSAGE_FAREWELL, "It was a pleasure to help you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "It was a pleasure to help you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Here. Don't forget that you need to buy a label too if you want to send a parcel. Always write the name of the receiver in the first line.")
npcHandler:addModule(FocusModule:new())