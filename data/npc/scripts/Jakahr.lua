local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even in our lands the name of the guildmaster is held in great respect."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even in our lands the name of the guildmaster is held in great respect."})
keywordHandler:addKeyword({'postmasters'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The guild plays a vital role in the economy of the known world."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Please travel to our headquarters if you wish to join our guild."})
keywordHandler:addKeyword({'headquarters'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can find them to the south of the dwarven city of Kazordoon."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a member of the Postmasters Guild. If you have questions about the Royal Tibia Mail System or the depots, ask me."})
keywordHandler:addKeyword({'office'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am always here in my office. You are welcome to visit me anytime."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Jakahr."})
keywordHandler:addKeyword({'depot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The depots are easy to use. Just open a locker to find your items there."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A weapon of legend. We rarely hear stories about it around here, however."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It does not befit a member of my position to spread rumours and stories, pilgrim."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is the capital of a kingdom on a far-off continent."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin is a city far, far away from here. They say it is run by women and druids."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As far as I can tell he was some philosopher."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "On this continent, the only place of real importance is our city."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A minor settlement to the north."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This city is a safe haven that protects its citizens from the dangers of the desert."})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This city is a safe haven that protects its citizens from the dangers of the desert."})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The pharaoh keeps this city safe. He is both our political and our spiritual leader."})
keywordHandler:addKeyword({'arkhothep'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The pharaoh keeps this city safe. He is both our political and our spiritual leader."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, but you should discuss religous issues like these in the temple. I am not a priest, and there is little I can tell you about it."})
keywordHandler:addKeyword({"Akh'rah Uthun"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, but you should discuss religous issues like these in the temple. I am not a priest, and there is little I can tell you about it."})
keywordHandler:addKeyword({'Akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, but you should discuss religous issues like these in the temple. I am not a priest, and there is little I can tell you about it."})
keywordHandler:addKeyword({'Rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, but you should discuss religous issues like these in the temple. I am not a priest, and there is little I can tell you about it."})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, but you should discuss religous issues like these in the temple. I am not a priest, and there is little I can tell you about it."})
keywordHandler:addKeyword({'arena'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fights are frequently staged in the arena to entertain the people."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can't miss the palace. It is probably the biggest pyramid in the whole world."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The temple is to the east of the city."})

local costLetter = 5
local costParcel = 10

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "letter") then
		npc:say("Would you like to buy a letter for "..costLetter.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "parcel") then
		npc:say("Would you like to buy a parcel for "..costParcel.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "mail") then
		npc:say("Our mail system is perfectly unique, and everybody is free to use it. Would you like to know more about it?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npc:say("Here it is. Don't forget to write the name of the receiver in the first line and the address in the second one before you put the letter in a mailbox", TALKTYPE_SAY)
			player:addItem(Cfletter, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npc:say("Here you are. Don't forget to write the name and the address of the receiver on the label. The label has to be in the parcel before you put the parcel in a mailbox.", TALKTYPE_SAY)
			player:addItem(Cfparcel, 1)
			player:addItem(Cflabel, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			npc:say("The Tibia Mail System allows you to send and receive letters and parcels. You can buy them here if you want.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] >= 1 then
		npc:say("Ok.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
