local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say('Hello there, adventurer! Need a deal in weapons or armor? I\'m your man!', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({'adorn', 'helmet', 'outfit', 'addon'}, msg) then
		if player:getStorageValue(1058) == 5 then
			npcHandler:say('Oh, Gregor sent you? I see. It will be my pleasure to adorn your helmet. Please give me some time to finish it.', cid)
			player:setStorageValue(1058, 6)
			player:setStorageValue(1059, os.time() + 2 * 60 * 60) -- 2 hour
		elseif player:getStorageValue(1058) == 6 then
			if player:getStorageValue(1059) < os.time() then
				npcHandler:say('Just in time, '.. player:getName() ..'. Your helmet is finished, I hope you like it.', cid)
				player:addOutfitAddon(139, 2)
				player:addOutfitAddon(131, 2)
				player:setStorageValue(1058, 7)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				npcHandler:say('It\'s not finished yet.', cid)
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the blacksmith. If you need weapons or armor - just ask me.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Samuel, but you can call me Sam."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'tibanus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a monk of some kind!"})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uhm! ---blush---"})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A warrior who is a joy for Banor."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A warrior who is a joy for Banor."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I supply the army with weapons and armor."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A threat for mankind! Buy weapons to be ready to face him."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was named after my grandfather."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He can tell a tale or two about his adventures with baxter in their younger days."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like crowded places like his bar."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I hardly know her."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcerers seldom need my skills."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His guild relies heavily on my wares."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I never visited his ... cave or whatever it's called."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is funny now and then."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine warrior."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oswald isn't one of the most liked people in this city."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'lurgi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I just know some rumours that he is a follower of evil."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is rumoured to be a weapon beyond mortal craftsmanship."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know nothing of interest."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armor, helmets, and shields. So you are able to slash the monsters."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah, these awful beasts. They live in the forests near the city and in the sewers and dungeons."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Below our city are the sewers and I heard about a passage to the deeper dungeons."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Below our city are the sewers and I heard about a passage to the deeper dungeons."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't ask me. I have never been there."})
keywordHandler:addKeyword({'thanks'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my shop, adventurer |PLAYERNAME|! I trade with weapons and armor.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")
npcHandler:addModule(FocusModule:new())