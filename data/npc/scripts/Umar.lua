local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Ubaid. Why do you want to know that, human? Hmm... suspicious."})
keywordHandler:addKeyword({'ubaid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is my name. I don't like it when a human pronounces it."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, what do you think? I keep watch around here to make sure people like you don't enter."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, Malor is not officially king of all djinn yet, but now our beloved leader is back that is a mere formality."})
keywordHandler:addKeyword({'malor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, Malor is not officially king of all djinn yet, but now our beloved leader is back that is a mere formality."})
keywordHandler:addKeyword({'djinn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are a race of rulers and dominators! Or at least we, the Efreet, are!"})
keywordHandler:addKeyword({'efreet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Efreet are the true djinn! Those namby-pamby milksops who call themselves the Marid and still follow Gabel, no longer deserve the honour to call themselves djinn."})
keywordHandler:addKeyword({'gabel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I used to serve under Gabel, but he is no longer my king. If that wacky wimp should ever come here to Mal'ouquah I will personally... you know... turn him away. Yes!"})
keywordHandler:addKeyword({"mal'ouquah"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This place is our home, and as long as I'm here no meddler will trespass!"})
keywordHandler:addKeyword({"ashta'daramai"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Marids' hideout, isn't it? I have never been there, but I am sure one day I will. That will be the day Ashta'daramai falls into our hands!"})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are an inferior race of feeble, scheming jerks. No offence."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Zathroth is our father! Of course, the son always has a right to hate his father, right?"})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This world is ours by right, and we will take it!"})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How dare you utter that name in my presence, human. Don't strain my patience, worm! You may know the secret word, but... who knows... it is always possible that your head is torn off in some terrible accident."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A human settlement to the west? I have not been there yet, but when I do I'm sure I will be remembered."})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They make good pets if you know how to keep them. Did you know they just adore human flesh?"})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't that the name of some petty human settlement?"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't that the name of some petty human settlement?"})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't that the name of some petty human settlement?"})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't that the name of some petty human settlement?"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't that the name of some petty human settlement?"})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Isn't that the name of some petty human settlement?"})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They say Ankrahmun is now ruled by a crazy pharaoh who wants to tell his whole people into drooling undead. That's humans. Sickos and weirdos the lot of them."})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we will sack that place and burn it to the ground."})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day we will sack that place and burn it to the ground."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think I've heard that term before. Has to do with that weirdo pharaoh, right?"})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you drunk?"})
keywordHandler:addKeyword({'uthun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you drunk?"})
keywordHandler:addKeyword({'akh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you drunk?"})
keywordHandler:addKeyword({"kha'zeel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This mountain range is our home. Too bad we have to share it with the Marid. That will change, though. And pretty soon, believe me."})
keywordHandler:addKeyword({"kha'labal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I like the desert. Just ruins and sand. And no human scum to be seen. The Kha'labal is a foretaste of what the djinn will do to the whole of Tibia!"})
keywordHandler:addKeyword({'war'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know why I am stuck here! I should be at the front, killing Marid and humans. Well, perhaps I will kill you..."})
keywordHandler:addKeyword({"baa'leal"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "General Baa'leal is our commander-in-chief of all his minions. He is as tough as an ancient scarab's buttocks and as sly a sand weasel."})
keywordHandler:addKeyword({'alesar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not used to the sight of blueskins here in Mal'ouquah, and it does not make me too happy to see one. I am keeping an eye on this guy, and if I should ever find that he is playing games with us I will personally break his neck!"})
keywordHandler:addKeyword({"fa'hradin"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The old wizard is dangerous, but he will get what he deserves sooner or later."})
keywordHandler:addKeyword({'lamp'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not taking a nap! I am on duty!"})

local function greetCallback(cid, message)
	local player = Player(cid)
	if not msgcontains(message, 'djanni\'hah') and player:getStorageValue(1088) ~= 1 then
		npcHandler:say('Whoa! A human! This is no place for you, |PLAYERNAME|. Go and play somewhere else.', cid)
		return false
	end

	if player:getStorageValue(1087) < 1 then
		npcHandler:say({
			'Hahahaha! ...',
			'|PLAYERNAME|, that almost sounded like the word of greeting. Humans - cute they are!'
		}, cid)
		return false
	end

	if player:getStorageValue(1088) ~= 1 then
		npcHandler:setMessage(MESSAGE_GREET, {
			'Whoa? You know the word! Amazing, |PLAYERNAME|! ...',
			'I should go and tell Fa\'hradin. ...',
			'Well. Why are you here anyway, |PLAYERNAME|?'
		})
	else
		npcHandler:setMessage(MESSAGE_GREET, '|PLAYERNAME|! How\'s it going these days? What brings you here?')
	end

	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'passage') then
		if player:getStorageValue(1088) ~= 1 then
			npcHandler:say({
				'If you want to enter our fortress you have to become one of us and fight the Efreet. ...',
				'So, are you willing to do so?'
			}, cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('You already have the permission to enter Ashta\'daramai.', cid)
		end

	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if player:getStorageValue(1089) ~= 1 then
				npcHandler:say('Are you sure? You pledge loyalty to king Gabel, who is... you know. And you are willing to never ever set foot on Efreets\' territory, unless you want to kill them? Yes?', cid)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say('I don\'t believe you! You better go now.', cid)
				npcHandler.topic[cid] = 0
			end

		elseif msgcontains(msg, 'no') then
			npcHandler:say('This isn\'t your war anyway, human.', cid)
			npcHandler.topic[cid] = 0
		end

	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			npcHandler:say({
				'Oh. Ok. Welcome then. You may pass. ...',
				'And don\'t forget to kill some Efreets, now and then.'
			}, cid)

			player:setStorageValue(1088, 1)
		elseif msgcontains(msg, 'no') then
			npcHandler:say('This isn\'t your war anyway, human.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, '<salutes>Aaaa -tention!')
npcHandler:setMessage(MESSAGE_WALKAWAY, '<salutes>Aaaa -tention!')

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hi')
focusModule:addGreetMessage('hello')
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)