local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the leader of the Paladins. I help our members."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Elane. I am the famous leader of the Paladins."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oops. I have forgotten my watch."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus is a wise ruler."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus is a wise ruler."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A humble monk and a wise man."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hm, a litte too nice for my taste."})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine warrior and a skilled general."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some paladins serve in the kings army."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Someday I will slay that bastard!"})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Harkath Bloodblade is the royal general."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Strong man. But a little shy."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He sells a lot of useful equipment."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The alcohol he sells shrouds the mind and the eye."})
keywordHandler:addKeyword({'galuna'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One of the most important members of our guild. She makes all the bows and arrows we need."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How spineless do you have to be to become a jester?"})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He has some potential."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If there wouldn't be higher powers to protect him..."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are simple farmers."})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are simple farmers."})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are simple farmers."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes?"})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just another arrogant sorcerer."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He and his guildfellows lack the grace of a true warrior."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A skilled healer, that's for sure."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A follower of evil that will get what he deserves one day."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A weapon of myth. I don't believe that this weapon exists."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a paladin, not a storyteller."})
keywordHandler:addKeyword({'member'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Every paladin profits from his vocation. It has many advantages to be a paladin."})
keywordHandler:addKeyword({'profit'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We will help you to improve your skills. Besides I offer spells for paladins."})
keywordHandler:addKeyword({'advantage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We will help you to improve your skills. Besides I offer spells for paladins."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your vocation is your profession. There are four vocations in Tibia: Paladins, knights, sorcerers, and druids."})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Paladins are great warriors and magicians. Besides that we are excellent missile fighters. Many people in Tibia want to join us."})
keywordHandler:addKeyword({'skill'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Paladins are great warriors and magicians. Besides that we are excellent missile fighters. Many people in Tibia want to join us."})
keywordHandler:addKeyword({'warrior'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Of course, we aren't as strong as knights, but no druid or sorcerer will ever defeat a paladin with a sword."})
keywordHandler:addKeyword({'magician'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are many magic spells and runes paladins can use."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In a spellbook your spells are listed. There you will find the pronunciation of each spell. If you want to buy one, visit Xodet in his magic shop."})

local function greetCallback(cid)
	if Player(cid):isPaladin() then
		npcHandler:setMessage(MESSAGE_GREET, "Hi, |PLAYERNAME|! What can I do for you?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Welcome to the paladins, |PLAYERNAME|! Can I help you?")
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "addon") or msgcontains(msg, "outfit") then
		if player:getStorageValue(1052) < 1 then
			npcHandler:say("Oh, my winged tiara? Those are traditionally awarded after having completed a difficult {task} for our guild, only to female aspirants though. Male warriors will receive a hooded cloak.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "task") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("So you are saying that you would like to prove that you deserve to wear such a hooded cloak?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "crossbow") then
		if player:getStorageValue(1052) == 1 then
			npcHandler:say("I'm so excited! Have you really found my crossbow?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "leather") then
		if player:getStorageValue(1052) == 2 then
			npcHandler:say("Did you bring me 100 pieces of lizard leather and 100 pieces of red dragon leather?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "chicken wing") then
		if player:getStorageValue(1052) == 3 then
			npcHandler:say("Were you able to get hold of 5 enchanted chicken wings?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "steel") then
		if player:getStorageValue(1052) == 4 then
			npcHandler:say("Ah, have you brought one piece of royal steel, draconian steel and hell steel each?", cid)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, "sniper gloves") then
		if player:getStorageValue(1051) < 1 then
			npcHandler:say("You found sniper gloves?! Incredible! Listen, if you give them to me, I will grant you the right to wear the sniper gloves accessory. How about it?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say({
				"Alright, I will give you a chance. Pay close attention to what I'm going to tell you now. ...",
				"Recently, one of our members moved to Liberty Bay out of nowhere, talking about some strange cult. That is not the problem, but he took my favourite crossbow with him. ...",
				"Please find my crossbow. It has my name engraved on it and is very special to me. ...",
				"Secondly, we need a lot of leather for new quivers. 100 pieces of lizard leather and 100 pieces of red dragon leather should suffice. ...",
				"Third, since we are giving out tiaras, we are always in need of enchanted chicken wings. Please bring me 5, that would help us tremendously. ...",
				"Lastly, for our arrow heads we need a lot of steel. Best would be one piece of royal steel, one piece of draconian steel and one piece of hell steel. ...",
				"Did you understand everything I told you and are willing to handle this task?"
			}, cid)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say("That's the spirit! I hope you will find my crossbow, " .. player:getName() .. "!", cid)
			player:setStorageValue(1052, 1)
			player:setStorageValue(1033, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if player:removeItem(5947, 1) then
				npcHandler:say("Yeah! I could kiss you right here and there! Besides, you're a handsome one. <giggles> Please bring me 100 pieces of lizard leather and 100 pieces of red dragon leather now!", cid)
				player:setStorageValue(1052, 2)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:removeItem(5876, 100) and player:removeItem(5948, 100) then
				npcHandler:say("Good work, " .. player:getName() .. "! That is enough leather for a lot of sturdy quivers. Now, please bring me 5 enchanted chicken wings.", cid)
				player:setStorageValue(1052, 3)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:removeItem(5891, 5) then
				npcHandler:say("Great! Now we can create a few more Tiaras. If only they weren't that expensive... Well anyway, please obtain one piece of royal steel, draconian steel and hell steel each.", cid)
				player:setStorageValue(1052, 4)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 7 then
			if player:removeItem(5887, 1) and player:removeItem(5888, 1) and player:removeItem(5889, 1) then
				npcHandler:say("Wow, I'm impressed, " .. player:getName() .. ". Your really are a valuable member of our paladin guild. I shall grant you your reward now. Wear it proudly!", cid)
				player:setStorageValue(1052, 5)
				player:addOutfitAddon(129, 1)
				player:addOutfitAddon(137, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 8 then
			if player:removeItem(5875, 1) then
				npcHandler:say("Great! I hereby grant you the right to wear the sniper gloves as accessory. Congratulations!", cid)
				player:setStorageValue(1051, 1)
				player:addOutfitAddon(129, 2)
				player:addOutfitAddon(137, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] > 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	return true
	end
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
