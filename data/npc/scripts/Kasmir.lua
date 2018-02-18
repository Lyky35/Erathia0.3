local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a chosen of Daraman."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't look for news when you don't know the past."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "asmir Ibn Darasir."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world is only a portal the gods created to allow our ascension to heaven."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Daraman had a vision that all mortals are able to ascend to heaven, becoming celestial beings."})
keywordHandler:addKeyword({'heaven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Daraman had a vision that all mortals are able to ascend to heaven, becoming celestial beings."})
keywordHandler:addKeyword({'celestial'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "By enhancing one's soul a mortal can ascend to heaven. If you are not prepared to ascend, you are bound to this world by reincarnation."})
keywordHandler:addKeyword({'reincarnation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If your soul is not strong and purified, you will not ascend but return to life on death, even losing strength in the process."})
keywordHandler:addKeyword({'necromancer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Undeath is even worse than reincarnation. Those souls are nothing but a rotting mockery of a soul on the path of ascension."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Daraman travelled the world and learned the secrets of the ancients. At last he learned the secret of ascension and founded his philosophy."})
keywordHandler:addKeyword({'soul'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The soul was made by the gods and therefore is divine. So by enhancing its divinity it can become more like the image of its creators."})
keywordHandler:addKeyword({'philosophy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Daraman led his followers to this promised land to follow his teachings. It was named Darama after him later."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This land is harsh and challenging. It's far away from temptations and delusions. Here Daraman's people can concentrate on themselves."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thank you, I'm fine and my soul is strong."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Go to the bazaar if you are interested in worldly wealth."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gods are in heaven and far away. You are here. So concentrate on your soul and take care for it on your own."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Life is divine though not without flaws."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The people are too concerned about the illusions of the moment and care less and less about Daraman's philosophy."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph is heavily involved in the affairs in the world, but one has to make this sacrifice for the welfare of all."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They misuse their god given souls for evil and must be destroyed."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your quest should be to prepare your soul for ascension."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your quest should be to prepare your soul for ascension."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fight is unavoidable sometimes. Make sure only your body is hurt but not your soul."})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fight is unavoidable sometimes. Make sure only your body is hurt but not your soul."})
keywordHandler:addKeyword({'bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, there's no blessings available in this world."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His soul is corrupted beyond any hope for ascension."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Your greed for such items can easily corrupt your soul."})
keywordHandler:addKeyword({'fardos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fardos is the creator. It was his work that we possess divine souls."})
keywordHandler:addKeyword({'uman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uman is the positive aspect of magic. His powers flow through each Tibian, making us his children."})
keywordHandler:addKeyword({'suon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Suon is the sun. He watches our ascension."})
keywordHandler:addKeyword({'crunor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Crunor is the force of life and part of our all being."})
keywordHandler:addKeyword({'nornur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Nornur is the mysterious god of fate. Daraman taught us that he is the judge who allows ascension."})
keywordHandler:addKeyword({'bastesh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bastesh is the goddess of the seas, and deep as the see is our soul, indeed."})
keywordHandler:addKeyword({'kirok'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Kirok is called the mad one. He gifted us with the creativity to achive our ascension."})
keywordHandler:addKeyword({'toth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Toth is the final judge. The unworthy are condemened to reincarnation."})
keywordHandler:addKeyword({'banor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Banor is the very proof that ascension is possible."})
keywordHandler:addKeyword({'tibiasula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Though this entity is dead, Tibiasula's energy is present in all of us."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia is the raw force of earth."})
keywordHandler:addKeyword({'sula'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sula is the raw force of water."})
keywordHandler:addKeyword({'air'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Air is without true mind and meaning."})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fire is without true mind and meaning."})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Zathroth is the corruptor of souls who does not want mortals to ascend and become more like him."})
keywordHandler:addKeyword({'fafnar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Fafnar is a test for our endurance and dilligence."})
keywordHandler:addKeyword({'brog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Brog's hot blood is in our veins, tempting us and distracting us from improvement of our souls."})
keywordHandler:addKeyword({'urgith'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The bonemaster is strong in the ruins of Drefia. There you can test the braveness of your soul ... or lose it to his minions."})
keywordHandler:addKeyword({'archdemons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are soulless and therefore without true power in the end."})
keywordHandler:addKeyword({'ruthless seven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are soulless and therefore without true power in the end."})
keywordHandler:addKeyword({'marri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I've quited that business, but I heard someone could merry people in Thais, go and ask there"})
keywordHandler:addKeyword({'ceremony'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry, I've quited that business, but I heard someone could merry people in Thais, go and ask there"})

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
		if player:getStorageValue(1081) == 8 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say('Yes, I was informed what to do. Are you prepared to receive my line of the prayer?', cid)
				npcHandler.topic[cid] = 1
			end
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		if player:getItemCount(5941) >= 1 then
			player:setStorageValue(1081, 9)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			npcHandler:say('So receive my prayer: \'Let there be honour and humility\'. Now, bring your stake to Rahkem in Ankrahmun for the next line of the prayer. I will inform him what to do.', cid)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())