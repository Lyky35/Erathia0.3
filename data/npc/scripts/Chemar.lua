local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Chemar Ibn Kalith."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a licensed carpetpilot and responsible for the Darashian airmail. I can bring you to the Femor Hills, Edron, or you can buy letters and parcels."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph depends heavily on his carpetfleet for commerce and for war alike."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph depends heavily on his carpetfleet for commerce and for war alike."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The prophet of our people; praised be his name."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This scourge of the west may have connections to the evil soils in Drefia."})
keywordHandler:addKeyword({'derfia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the west a big city existed. Its people were corrupted and drew the wrath of the djinn upon them and Drefia was destroyed."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have been almost everywhere in the world and think it's only a myth."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think it's a rolemodel for what befalls people if they forget the teachings of Daraman."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That city is getting noisier and more crowded each month."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our carpetpilots bring in too many news to recall them all."})
keywordHandler:addKeyword({'rumour'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our carpetpilots bring in too many news to recall them all."})
keywordHandler:addKeyword({'rumor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our carpetpilots bring in too many news to recall them all."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'femur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you sure that you are not talking about the FEMOR Hills?"})
keywordHandler:addKeyword({'fly'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Edron if you like. Where do you want to go?"})

local travelNodes = {
	["edron"] = {cost = 40, pos = Boatedron, text = "Edron"},
	["femor hills"] = {cost = 60, pos = Carpethills, text = "Femor Hills"}
}

local bringNodes = {
	["bring me to edron"] = {cost = 40, pos = Boatedron},
	["bring me to fermor hills"] = {cost = 60, pos = Carpethills}
}

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	local npc = Npc()
		if bringTable then
		if player:getPremiumDays() > 0 then
			if not player:isPzLocked() then
				if player:removeMoney(bringTable["cost"]) then
					npc:say("Set the sails!", TALKTYPE_SAY)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(bringTable["pos"], false)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				else
					npc:say("You don't have enough money.", TALKTYPE_SAY)
				end
			else
				npc:say("First get rid of those blood stains! You are not going to ruin my vehicle!", TALKTYPE_SAY)
			end
		else
			npc:say("I'm sorry, but you need a premium account in order to travel onboard our ships.", TALKTYPE_SAY)
		end
	end
	if not npcHandler:isFocused(cid) then
		return false
	end
	local table = travelNodes[msg]
	if table then
		npc:say("Do you want to sail to ".. table["text"] .." for ".. table["cost"] .." gold?", TALKTYPE_SAY)
		storeTravel = msg
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:getPremiumDays() > 0 then
			if not player:isPzLocked() then
				if player:removeMoney(storeTravel["cost"]) then
					npc:say("Set the sails!", TALKTYPE_SAY)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(storeTravel["pos"], false)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					npcHandler.topic[cid] = 0
				else
					npc:say("You don't have enough money.", TALKTYPE_SAY)
					npcHandler.topic[cid] = 0
				end
			else
				npc:say("First get rid of those blood stains! You are not going to ruin my vehicle!", TALKTYPE_SAY)
				npcHandler.topic[cid] = 0
			end
		else
			npc:say("I'm sorry, but you need a premium account in order to travel onboard our ships.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end	
	elseif msgcontains(msg, "letter") then
		npc:say("Would you like to buy a letter for "..costLetter.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "parcel") then
		npc:say("Would you like to buy a parcel for "..costParcel.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "mail") then
		npc:say("Our mail system is perfectly unique, and everybody is free to use it. Would you like to know more about it?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") then
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