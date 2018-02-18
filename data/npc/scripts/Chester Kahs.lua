local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, almost news that are a little interesting are confidential."})
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am troubled by all the mysteries out there."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am no tradesman, sorry."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King Tibianus III is our leader and my direct superior."})
keywordHandler:addKeyword({'superior'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I report directly to the king himself."})
keywordHandler:addKeyword({'report'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My reports are confidential and for the ears and eyes of the king only."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the head of the TBI."})
keywordHandler:addKeyword({'tbi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Tibian Bureau of Investigation, the secret service of His Royal Highness."})
keywordHandler:addKeyword({'investigation'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We collect information about people and incidents."})
keywordHandler:addKeyword({'bureau'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We collect information about people and incidents."})
keywordHandler:addKeyword({'people'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We know much about the citizens and some other people."})
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I only can give you some official information about our citizens. About whom do you wish to talk?"})
keywordHandler:addKeyword({'incident'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are things that must be kept secret."})
keywordHandler:addKeyword({'secret police'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Are you joking? What's secret in Tibia at all?"})
keywordHandler:addKeyword({'secret'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Certain information is not for the eyes and ears of everyone. Please understand that."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our army might be infested with spies already."})
keywordHandler:addKeyword({'spies'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Polymorphed Minotaurs, shapechanging demons, possessed innocents ... who can tell for sure."})
keywordHandler:addKeyword({'silver guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king's best. But is the best good enough to fight what stalks the nights?"})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think we can't trust the guards anymore."})
keywordHandler:addKeyword({'trust'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Too many possibilities to become a servant of darkness to trust ANYONE!"})
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The castle isn't safe! I warned them of the entrance to the dungeons, but no one is litstening. How many people have to die before they do something about that?"})
keywordHandler:addKeyword({'dogs of war'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even they can't stop a handful of demons."})
keywordHandler:addKeyword({'red guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are at my command now and then ... but it's a mistake to rely on anyone except yourself."})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city is open to almost everyone. That literally opens doors for all kinds of criminals and fiends."})
keywordHandler:addKeyword({'criminal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are so many murderers and thiefs out there that I wonder if there is some greater force of evil subtly encouraging that."})
keywordHandler:addKeyword({'fiend'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Not everything that walks our streets is human ... or even living"})
keywordHandler:addKeyword({'stutch'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is one of the few people I can trust."})
keywordHandler:addKeyword({'harsky'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is one of the few people I can trust."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He isn't the fool he pretends to be. So to what is he up to?"})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I say it was a mistake to rely on a single person for such vital services but having those venoreans here is even worse."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A man too concerned about profit to be trustworthy. This kind of man sells his soul to the highest bidder. It's just a question if he has done it already or will do it soon."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Have you noticed how easy it would be to poison his supplies and kill a great deal of people with ease?"})
keywordHandler:addKeyword({'benjamin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Something happened to him that snapped his mind. Can we be sure what more might have happened to him unnoticed?"})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are just the pawns of the gods. The best we can expect is that our play amuses them enough to keep their interest in us so we might live a day or two longer."})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She puts her trust in the help of beings she can't comprehend. Think by yourself if that's clever."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A peaceful man. But in our days peace is just an illusion. We are surrounded by enemies and dangers."})
keywordHandler:addKeyword({'enemy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The people of the northern city, the minotaurs, the followers of Zathroth, the demons, and countless others!"})
keywordHandler:addKeyword({'enemies'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The people of the northern city, the minotaurs, the followers of Zathroth, the demons, and countless others!"})
keywordHandler:addKeyword({'danger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Danger is common like day and night for a Tibian, who keeps his eyes open."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Monsters lurk in each corner of the dungeons, which spread beneath us, breeding in the shadows and plotting to destroy us all."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some say he's the avatar of Zathroth himself, but perhaps the truth about him is even darker then the worst rumours can imagine."})
keywordHandler:addKeyword({'demon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They say there are just two of them in the underground ruins! These damned fools! There are dozens of them! And the two they already saw are only some of the weakest of demonkind!"})
keywordHandler:addKeyword({'underground ruin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have no clue what happened to the civilization that once dwelled underground, but their complete extinction should be a warning for us!"})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Have you ever wondered what these caves under their farm are good for? And have you noticed how many adventurers go down there and never return? Well, think about it!"})
keywordHandler:addKeyword({'sorcerer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know where they got their secret spells in the first place, nor did most of them know ... If I were a sorcerer that would be a fact to give me nightmares."})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's too easy to become a knight. They take almost everyone. And if you look in the streets you can see what happens if you give training and a flashy title to almost everyone."})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They should be noble warriors, but does it take bravery to shoot someone from a certain distance? The former paladins were virtuous heroes, the ones you meet today are just simple treasure hunters."})
keywordHandler:addKeyword({'druid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is said that druids are preservers of life and good aligned, but let me ask you if it's so 'good' to sell runes to the highest bidder, no matter who that might be? I think you get the point!"})
keywordHandler:addKeyword({'truth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dungeons are full of hideous monsters, unnamed terrors, unsolved riddles ... and maybe some answers. Believe me! The truth is down there ... somewhere!"})
keywordHandler:addKeyword({'ruthless seven'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We know little about them. But even that gives me nightmares! But it's your lucky day, since this information is confidential, and so it can't bother you."})
keywordHandler:addKeyword({'aruda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This woman is a clever thief, so watch out when you are talking to her."})
keywordHandler:addKeyword({'partos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This criminal was wanted for many crimes. At last he got caught and put to jail."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are surrounded by myths, living and dead. How can someone doubt that there IS something like Excalibug somewhere?"})
keywordHandler:addKeyword({'necromant nectar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Followers of evil are investigating about that, though I guess even they don't know what it's good for. Perhaps just a myth of evil."})
keywordHandler:addKeyword({'rebellion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have far too few information about the rebellion, but we suspect the followers of Zathroth behind it."})
keywordHandler:addKeyword({'berfasmur is ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, thats what I figured out, too. Just one of his disguises."})
keywordHandler:addKeyword({'berfasmur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Strange name, isn't it? Play around with the letters and you are in for a surprise."})
 
local fire = Condition(CONDITION_FIRE)
fire:setParameter(CONDITION_PARAM_DELAYED, true)
fire:addDamage(25, 9000, -10)
 
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, 'gamel') and msgcontains(msg, 'rebel') then
		npc:say('Are you saying that Gamel is a member of the rebellion?', cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'no') then
			npc:say('Then don\'t bother me with it. I\'m a busy man.', cid)
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, 'yes') then
			npc:say('Do you know what his plans are about?', cid)
			npcHandler.topic[cid] = 2
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'magic') and msgcontains(msg, 'crystal') and msgcontains(msg, 'lugri') and msgcontains(msg, 'deathcurse') then
			npc:say('That\'s terrible! Will you give me the crystal?', cid)
			npcHandler.topic[cid] = 3
		else
			npc:say('Tell me precisely what he asked you to do! It\'s important!', cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		if msgcontains(msg, 'no') then
			npc:say('Traitor!', cid)
			player:addCondition(fire)
			player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONHIT)
			Npc():getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			player:removeItem(2177, 1)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		elseif msgcontains(msg, 'yes') then
			if player:removeItem(2177, 1) then
				npc:say('Thank you! Take this ring. If you ever need a healing, come, bring the scroll, and ask me to {heal}.', cid)
				player:addItem(2168, 1)
			else
				npc:say('Sorry, but you have none.', cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'heal') then
		npc:say('Do you need the healing now?', cid)
		npcHandler.topic[cid] = 4
	elseif npcHandler.topic[cid] == 4 then
		if msgcontains(msg, 'no') then
			npc:say('As you wish.', cid)
		elseif msgcontains(msg, 'yes') then
			if player:removeItem(2168, 1) then
				npc:say('So be healed!', cid)
				player:addHealth(player:getMaxHealth())
				Npc():getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				npc:say('Sorry, you are not worthy!', cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())