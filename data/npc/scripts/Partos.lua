local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hardly hear any news down here."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Partos, but you can call me Party."})
keywordHandler:addKeyword({'party'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah! Come in and let's have a party."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I love the city. I just wish I could see some other part of it now and then."})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I love the city. I just wish I could see some other part of it now and then."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I love this world. I just wish I could see some other part of it now and then."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am great! Free food, free room, and now and then someone coming down here to ask me silly questions. Wouldn't you love that, too?"})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would like to sell you a secret, but I'm out of business for too long."})
keywordHandler:addKeyword({'jail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You mean that's a JAIL? They told me it's the finest hotel in town! THAT explains the lousy roomservice!"})
keywordHandler:addKeyword({'prison'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You mean that's a JAIL? They told me it's the finest hotel in town! THAT explains the lousy roomservice!"})
keywordHandler:addKeyword({'crim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, I did nothing serious. I just had a little fun. In Ankrahmun nobody would have cared about these kind of things..."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods seldom show up down here, so don't ask me."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rich enough to spare a little, don't you agree? Well, they didn't agree."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah, a king is a man that can rob people by law, and not by night like me."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "At least I am safe from them down here."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "gold got me in here."})
keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "gold got me in here."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, most people I killed were even worse than me."})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, most people I killed were even worse than me."})
keywordHandler:addKeyword({'noodles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I bet one could get some fine ransom, if he dognappes this furball."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "By the gods, he visits us 'criminals' now and then to 'save' us. Who is going to save me from this boredom on two legs?"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah, the king's pawns. I spit on them."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Geee, someone stole my watch. Bad company down here."})
keywordHandler:addKeyword({'waterpipe'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My waterpipe? I lost it. But it doesn't matter. I quit smoking anyway."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Excalibug? No way that I tell you something about it!"})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'supplies') then
		if player:getStorageValue(1097) == 1 then
			npcHandler:say({
				'What!? I bet, Baa\'leal sent you! ...',
				'I won\'t tell you anything! Shove off!'
			}, cid)
			player:setStorageValue(1097, 2)
		else
			npcHandler:say('I won\'t talk about that.', cid)
		end

	elseif msgcontains(msg, 'ankrahmun') then
		npcHandler:say({
			'Yes, I\'ve lived in Ankrahmun for quite some time. Ahh, good old times! ...',
			'Unfortunately I had to relocate. <sigh> ...',
			'Business reasons - you know.'
		}, cid)
	end
	return true
end

keywordHandler:addKeyword({'prison'}, StdModule.say, {npcHandler = npcHandler, text = 'You mean that\'s a JAIL? They told me it\'s the finest hotel in town! THAT explains the lousy roomservice!'})
keywordHandler:addKeyword({'jail'}, StdModule.say, {npcHandler = npcHandler, text = 'You mean that\'s a JAIL? They told me it\'s the finest hotel in town! THAT explains the lousy roomservice!'})
keywordHandler:addKeyword({'cell'}, StdModule.say, {npcHandler = npcHandler, text = 'You mean that\'s a JAIL? They told me it\'s the finest hotel in town! THAT explains the lousy roomservice!'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome to my little kingdom, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, visit me again. I will be here, promised.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye, visit me again. I will be here, promised.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())