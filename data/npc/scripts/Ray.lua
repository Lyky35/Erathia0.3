local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, yes we stay in touch via mail of course."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, yes we stay in touch via mail of course."})
keywordHandler:addKeyword({'postmasters'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The guild is far away, but the mail keeps us close to each other somehow."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The guild is always looking for competent recruits. You can submit your application to our headquarters."})
keywordHandler:addKeyword({'headquarters'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It can be found easily. It's on the road from Thais to Kazordoon and Ab'Dendriel."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for this post office. If you have questions about the mail system or the depots, just ask me."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Ray."})
keywordHandler:addKeyword({'ray'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, that's me."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king lives far away in the lovely city of Thais, but even he can be reached by our mailing system."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king lives far away in the lovely city of Thais, but even he can be reached by our mailing system."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We got not the best men of the Thaian army to guard this colony. Given the number of difficulties this colony faces, this is quite a problem."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope this colony is too remote and meaningless to him to care for a visit."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are rumours about some hidden stone tablets mentioning that weapon. Adventurers claim to have seen those tablets in the ancient lizard city."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are so many news that I cannot retell them all. Talk to the colonists and keep your ears open."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All cities are covered by our mailing system."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All cities are covered by our mailing system."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are a pest. A quite dangerous pest as far as I can tell."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lizards give me shivers. They are so alien, even more than the minotaurs or orcs we know from the surroundings of Thais."})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Those bloodthirsty headhunters live in the south. I heard only horrible stories about them and I believe they are not exaggerated."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The jungle is a dangerous place. Many got lost there and never returned."})

function creatureSayCallback(cid, type, msg) msg = string.lower(msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local npc = Npc()
	if msgcontains(msg, "letter") then
		npc:say("Would you like to buy a letter for "..costLetter.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "parcel") then
		npc:say("Would you like to buy a parcel for "..costParcel.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "mail") then
		npc:say("Our mail system is perfectly unique, and everybody is free to use it. Would you like to know more about it?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") then
		local player = Player(cid)
		if npcHandler.topic[cid] == 2 then
			npc:say("Here it is. Don't forget to write the name of the receiver in the first line and the address in the second one before you put the letter in a mailbox", TALKTYPE_SAY)
			player:addItem(Cfletter, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			npc:say("Here you are. Don't forget to write the name and the address of the receiver on the label. The label has to be in the parcel before you put the parcel in a mailbox.", TALKTYPE_SAY)
			player:addItem(Cfparcel, 1)
			player:addItem(Cflabel, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			npc:say("The Tibia Mail System allows you to send and receive letters and parcels. You can buy them here if you want.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] >= 1 then
		npc:say("Not then.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())