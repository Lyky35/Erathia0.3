local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a priest of Zathroth, the bringer of dark secrets."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Lugri."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You will soon see the 'news' with your own eyes. <chuckle>"})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world of Tibia is to be taken by the strongest."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I feel the power of evil rising and enjoy that."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am in the death business. You wouldn't like what I have to offer."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life is war. It's about survival of the fittest."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The people of Tibia are sheep, so be smart and strong enough to become their wolf."})
keywordHandler:addKeyword({'people'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The people of Tibia are sheep, so be smart and strong enough to become their wolf."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This puny king is no threat for our master's plans."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are a challenge to sift the chaff from the wheat."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Aren't we all on a quest for survival and supremacy?"})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Aren't we all on a quest for survival and supremacy?"})
keywordHandler:addKeyword({'survival'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Aren't we all on a quest for survival and supremacy?"})
keywordHandler:addKeyword({'supermacy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Aren't we all on a quest for survival and supremacy?"})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life is an eternal fight!"})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The weak have to be slain by the strong!"})
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your wounds are your problem, not mine."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you cant help yourself you are not worth of my assistance."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is one of Zathroth's strongest followers and wields special powers, given to him by the dark one."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Who cares?"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's existence is just a lie to inspire hope and bravery in the hearts of the followers of good."})
keywordHandler:addKeyword({'fardos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fardos is the creator. He is a helpless watcher whose 'creation' is far more then he bargained for."})
keywordHandler:addKeyword({'uman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uman is a jealous keeper of magic. He gives only little knowledge to the mortals."})
keywordHandler:addKeyword({'suon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Suon is one of the suns of our world. He gives his light mindlessly to the weak and the strong alike."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Crunor is a plantgod ... and plants exist to be stomped over."})
keywordHandler:addKeyword({'nornur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nornur fancies himself as god of fate without even understanding the ways of fate at all."})
keywordHandler:addKeyword({'bastesh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bastesh is so afraid that she hides in the depth of the seas."})
keywordHandler:addKeyword({'kirok'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kirok, the mad one, is the patron of scientists and jesters, more a nuisance than a god."})
keywordHandler:addKeyword({'toth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Toth is just the undertaker for the other 'gods of good'."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Banor isn't a god at all, but one of their tools. It is stupidity to worship a tool, isn't it?"})
keywordHandler:addKeyword({'tibiasula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Zathroth took her life, recoginzig it was necessary for the process of creation."})
keywordHandler:addKeyword({'sula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sula is just the mindless elemental power of water."})
keywordHandler:addKeyword({'air'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Air is is just a mindless elemental force."})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fire is is just a mindless elemental force."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Zathroth represents the true and unbound power of magic. He is the keeper of great secrets."})
keywordHandler:addKeyword({'fafnar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fafnar is the power of the sun. She burns the weak to ashes."})
keywordHandler:addKeyword({'brog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Brog, the raging one, the great destroyer, the berserk of darkness ... call him how you like, but fear his awesome power."})
keywordHandler:addKeyword({'urgith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Urgith is the master of the undead. The bonemaster also takes care of the damned souls."})
keywordHandler:addKeyword({'archdemons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The demons are powerful followers of Zathroth. Their leaders are known as the ruthless seven."})
keywordHandler:addKeyword({'ruthless seven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Infernatil, Pumin, Verminor, Tafariel, Apocalypse, Bazir and Ashfalor."})
keywordHandler:addKeyword({'tafariel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is the mistress of the damned! Rewarding or torturing, it is the same for her victims!"})
keywordHandler:addKeyword({'apocalypse'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is said even speaking its TRUE name will bring total destruction to you!"})
keywordHandler:addKeyword({'pumin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the lord of despair."})
keywordHandler:addKeyword({'infernatil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The incendiary of hell."})
keywordHandler:addKeyword({'bazir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the great deciver, the lord of lies."})
keywordHandler:addKeyword({'Verminor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, the plaguelord."})
keywordHandler:addKeyword({'ashfalor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The right hand of Urgith. The general of the undead hordes."})
keywordHandler:addKeyword({'pits of inferno'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "After the ruthless seven conquered it, it's again a holy place for the followers of the dark path."})
keywordHandler:addKeyword({'nightmare'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That name is a disgrace. The pityful nightmare knights couldn't defend them and even lost the treasure of their order there."})
keywordHandler:addKeyword({'goshnar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The necromant king was only defeated by the nightmare knights due to a bad twist of fate."})
keywordHandler:addKeyword({'necromant nectar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's none of your business!"})


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "outfit") or msgcontains(msg, "addon") then
		if player:getStorageValue(1078) < 1 then
			npcHandler:say("This skull shows that you are a true follower of Zathroth and the glorious gods of darkness. Are you willing to prove your loyalty?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "shield") or msgcontains(msg, "medusa shield") then
		if player:getStorageValue(1078) == 1 then
			npcHandler:say("Is it your true wish to sacrifice a medusa shield to Zathroth?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "mail") or msgcontains(msg, "dragon scale mail") then
		if player:getStorageValue(1078) == 2 then
			npcHandler:say("Is it your true wish to sacrifice a dragon scale mail to Zathroth?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "legs") or msgcontains(msg, "crown legs") then
		if player:getStorageValue(1078) == 3 then
			npcHandler:say("Is it your true wish to sacrifice crown legs to Zathroth?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "ring") or msgcontains(msg, "ring of the sky") then
		if player:getStorageValue(1078) == 4 then
			npcHandler:say("Is it your true wish to sacrifice a ring of the sky to Zathroth?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("It will be a hard task which requires many sacrifices. Do you still want to proceed?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Good decision, " .. player:getName() .. ". Your first sacrifice will be a medusa shield. Bring it to me and do give it happily.", cid)
			player:setStorageValue(1078, 1)
			player:setStorageValue(1033, 1) --this for default start of Outfit and Addon Quests
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(2536, 1) then
				npcHandler:say("Good. I accept your sacrifice. The second sacrifice I require from you is a dragon scale mail. Bring it to me and do give it happily.", cid)
				player:setStorageValue(1078, 2)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:removeItem(2492, 1) then
				npcHandler:say("Good. I accept your sacrifice. The third sacrifice I require from you are crown legs. Bring them to me and do give them happily.", cid)
				player:setStorageValue(1078, 3)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:removeItem(2488, 1) then
				npcHandler:say("Good. I accept your sacrifice. The last sacrifice I require from you is a ring of the sky. Bring it to me and do give it happily.", cid)
				player:setStorageValue(1078, 4)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:removeItem(2123, 1) then
				npcHandler:say("Good. I accept your sacrifice. You have proven that you are a true follower of Zathroth and do not hesitate to sacrifice worldly goods. Thus, I will reward you with this headgear. ", cid)
				player:setStorageValue(1078, 5)
				player:addOutfitAddon(145, 2)
				player:addOutfitAddon(149, 2)
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
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())