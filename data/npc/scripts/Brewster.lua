local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a priest. <hicks> The worldly representative of the gods so to speak. <hicks> Not that I would say such a thing of course. <hicks> This would be vanity after all."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am ... ah, yes, Brewster. That's me, my name I mean <hicks>."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uhm ... Uh ... No idea, sorry."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hehe! <hicks> Well if you call this hut a temple you are not a devoted churchgoer I guess. But never mind, I won't tell anyone and the gods know it anyway ... if they care."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah the king, how lucky he must be - being the ruler of this lovely little piece of dirt here. Hehe."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Venore, Venore, city of splendour. Hm, the best thing about that city is its brewery."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais!! My beloved hometown! Oh how I miss my good, old Thais."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ha! That's probably even worse than this dump of a jungle here that they call a colony."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They would never appoint a priest of such a low rank like me to Edron."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This jungle must be the way of the gods to give us mortals a taste of hell <hicks>."})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh come on, just leave me alone. <hicks> Read a book to find out more."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If Tibia is a fallen god, make your guess what bodypart you are on now. <hicks> I have my assumptions ... but I won't tell. Hehe."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves I met can't stop to praise the dwarven beer. That wakes the urge in me to ... uhm spread the word of our gods in that city of Kazordoon."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves I met can't stop to praise the dwarven beer. That wakes the urge in me to ... uhm spread the word of our gods in that city of Kazordoon."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves I met can't stop to praise the dwarven beer. That wakes the urge in me to ... uhm spread the word of our gods in that city of Kazordoon."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Was never there <hicks> For all what I have heard it's not that much different from this ugly little settlement."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "After being in that jungle for a while, I can't trust people that love trees anymore."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "After being in that jungle for a while, I can't trust people that love trees anymore."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The teachings of our temple counts little on this continent. I think it's a sign from the gods to abandon it. But why should anyone listen to poor old Brewster?"})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just to think about this cursed town and its inhabitants makes me shiver. I better take a quick drink to forget about it."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<hicks> Oh well, he is just that what I'd expect next in all my misery."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Who knows if it is real or just some myth? <hicks> And who cares at all?"})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They don't believe me but I have seen them. There are pink apes! They come when I am sleeping and try to steal my beer and wine <hicks>."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They usually stay away from here so who cares?"})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Heard enough of them to dislike them."})
keywordHandler:addKeyword({'cough syrup'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The only person who might have some cough syrup is this druid Ustan. You find him in the tavern. Hmmm the tavern ... <hicks>"})
keywordHandler:addKeyword({'blessing'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The vital force of this world is waning. There are no more blessings available on this world."})
keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The vital force of this world is waning. There are no more blessings available on this world."})

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
	elseif msgcontains(msg, 'wooden stake') then
		if player:getStorageValue(1081) == 10 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?', cid)
				npcHandler.topic[cid] = 1
			end
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		if player:getItemCount(5941) >= 1 then
			player:setStorageValue(1081, 11)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			npcHandler:say('So receive my prayer: \'Your hand shall be guided - your feet shall walk in <hicks> harmony\'. Now, bring your stake to Tyrias in <hicks> Liberty Bay for the next line of the prayer. I will inform him what to do.', cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
