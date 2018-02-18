local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Job? I have no job. I just live for the gods of Tibia."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Quentin."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They created Tibia and all life on it."})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "On Tibia there are many forms of life. There are plants and people and monsters."})
keywordHandler:addKeyword({'plant'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just walk around, you will see grass, trees, and bushes."})
keywordHandler:addKeyword({'people'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a simple monk. I just know Sam, Frodo, and Gorn. They all live in the main street to the north."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is our blacksmith. He sells weapons and armour."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the owner of Frodo's Hut, the tavern north of this temple."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is selling equipment. If you still have no backpack you should go and ask him for one."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is the leader of the local Paladins' guild."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Muriel is a famous sorcerer. She is the keeper of arcane secrets that are known only to few mortals."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The leader of the Knights' guild is a man of few words."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I admire the healing skills of Marvik."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our king resides in the castle to the west."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is where we are. The world of Tibia. Admire it's beauty."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She is a highly competent priest."})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A hard man but his heart is in the right right place."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about the Tibian army. Ask general Harkath Bloodblade about that."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hush! Do not mention the Evil One in these walls."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Harkath Bloodblade is his name."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the king's jester, but he believes himself to be the king of fools."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is the guard of the royal castle."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This man is spreading horrible rumours all the time."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds run the local farm."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Please do not mention the fallen one."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Legends tell us that that Excalibug is a gift of the gods. Banor used in his battles.  They say it was passed on to one of his followers."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I know nothing new. Please ask Frodo about that topic."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are really too many of them in Tibia. But who am I to challenge the wisdom of the gods?"})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'task'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'what'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should try to get some gold to buy better equipment."})
keywordHandler:addKeyword({'gold'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you need money you should slay monsters and take their gold. Look for spiders and rats."})
keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you need money you should slay monsters and take their gold. Look for spiders and rats."})
keywordHandler:addKeyword({'spider'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are spiders' nests beyond our city near Gorn's shop and at the McRonalds' farm in the east."})
keywordHandler:addKeyword({'rat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are sewers underneath the city. They say these sewers are brimming with rats."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can enter the sewers thorugh a sewer grate. But watch out. There are many rats. And don't forget to bring a torch."})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "First you should buy a bag or backpack. That way your hands will be free to hold a weapon and a shield."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Take a weapon into your hand and select a target. If you are wounded you should eat some food to heal your wounds."})
keywordHandler:addKeyword({'slay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Take a weapon into your hand and select a target. If you are wounded you should eat some food to heal your wounds."})
keywordHandler:addKeyword({'eat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you would like to heal your wounds you should eat some food. Frodo sells excellent meals. But if you are very weak you can also come to me. I will heal you."})
keywordHandler:addKeyword({'bles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lifeforce of this world is waning. There are no more blessings avaliable on this world."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask Gorn for a watch, if you need one."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "heal") then
		if player:getHealth() < 40 then
			npcHandler:say("You are looking really bad. Let me heal your wounds.", cid)
			player:addHealth(40)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
			npcHandler:say("You aren't looking really bad. Sorry, I can't help you.", cid)
		end
	elseif msgcontains(msg, 'wooden stake') then
		if player:getStorageValue(1081) < 1 then
			npcHandler:say({
				'A blessed stake to defeat evil spirits? I do know an old prayer which is said to grant sacred power and to be able to bind this power to someone, or something. ...',
				'However, this prayer needs the combined energy of ten priests. Each of them has to say one line of the prayer. ...',
				'I could start with the prayer, but since the next priest has to be in a different location, you probably will have to travel a lot. ...',
				'Is this stake really important enough to you so that you are willing to take this burden?'
			}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(1081) == 2 then
			if player:getItemCount(5941) > 0 then
				npcHandler:say('Ah, I see you brought a stake with you. Are you ready to receive my line of the prayer then?', cid)
				npcHandler.topic[cid] = 2
			end
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue(1081, 1)
			player:setStorageValue(1080, 1)
			npcHandler:say('Alright, I guess you need a stake first. Maybe Gamon can help you, the leg of a chair or something could just do. Try asking him for a stake, and if you have one, bring it back to me.', cid)
		elseif npcHandler.topic[cid] == 3 then
			if player:getItemCount(5941) > 0 then
				player:setStorageValue(1081, 3)
				npcHandler:say('So receive my prayer: \'Light shall be near - and darkness afar\'. Now, bring your stake to Tibra in the Carlin church for the next line of the prayer. I will inform her what to do. ', cid)
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())