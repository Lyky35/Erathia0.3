local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Aneus, the storyteller."})
keywordHandler:addKeyword({'bruno'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about him. I only know that he is selling fish in the village."})
keywordHandler:addKeyword({'marlene'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A lovely woman. But I give you a hint: Better keep away from her. *grin*"})
keywordHandler:addKeyword({'graubart'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't know much about him. But he sails much and has seen nearly the whole world."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm a storyteller."})
keywordHandler:addKeyword({'storyteller'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, if you wish I can tell you the story about this place here. The story about the Fields of Glory!"})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "story") then
		npc:say("Ok, sit down and listen. Back in the early days, one of the ancestors of our king Tibianus III wanted to build the best city in whole of Tibia.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'fields of glory') then
		npc:say("Ok, sit down and listen. Back in the early days, one of the ancestors of our king Tibianus III wanted to build the best city in whole of Tibia.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'ancestor') and npcHandler.topic[cid] == 1 then
		npc:say("Please forgive me. I forgot his name. I'm not that young anymore.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'city') and npcHandler.topic[cid] == 1 then
		npc:say("The works on this new city began and the king sent his best soldiers to protect the workers from orcs and to make them work harder.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'soldier') and npcHandler.topic[cid] == 2 then
		npc:say("It was the elite of the whole army. They were called the Red Legion (also known as the Bloody Legion).", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'orc') and npcHandler.topic[cid] == 2 then
		npc:say("The orcs attacked the workers from time to time and so they disturbed the works on the city.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'work harder') and npcHandler.topic[cid] == 2 then
		npc:say("The soldiers treated them like slaves.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'slave') and npcHandler.topic[cid] == 3 then
		npc:say("You dont know what a slave is? I really hope that you will never have to make this experience.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'works') and npcHandler.topic[cid] == 3 then
		npcHandler:say({"The development of the city was fine. Also a giant castle was build northeast of the city. ...", "But more and more workers started to rebel because of the bad conditions."}, cid, 0, 1, 3000)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, 'rebel') and npcHandler.topic[cid] == 4 then
		npcHandler:say({"All rebels were brought to the giant castle. Guarded by the Red Legion, they had to work and live in even worse conditions. ...", "Also some friends of the king's sister were brought there."}, cid, 0, 1, 3000)
		npcHandler.topic[cid] = 5
	elseif msgcontains(msg, 'friends') and npcHandler.topic[cid] == 5 then
		npcHandler:say({"The king's sister was pretty upset about the situation there but her brother didn't want to do anything about this matter. ...", "So she made a plan to destroy the Red Legion for their cruelty forever."}, cid, 0, 1, 4000)
		npcHandler.topic[cid] = 6
	elseif msgcontains(msg, 'cruelty') and npcHandler.topic[cid] == 6 then
		npc:say("The soldiers treated the workers like slaves.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 6
	elseif msgcontains(msg, 'plan') and npcHandler.topic[cid] == 6 then
		npc:say("She ordered her loyal druids and hunters to disguise themselves as orcs from the near island and to attack the Red Legion by night over and over again.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 7
	elseif msgcontains(msg, 'island') and npcHandler.topic[cid] == 7 then
		npc:say("The General of the Red Legion became very angry about these attacks and after some months he stroke back!", TALKTYPE_SAY)
		npcHandler.topic[cid] = 7
	elseif msgcontains(msg, 'attack') and npcHandler.topic[cid] == 7 then
		npc:say("The General of the Red Legion became very angry about these attacks and after some months he stroke back!", TALKTYPE_SAY)
		npcHandler.topic[cid] = 8
	elseif msgcontains(msg, 'stroke') and npcHandler.topic[cid] == 8 then
		npcHandler:say({"Most of the Red Legion went to the island by night. The orcs were not prepared and the Red Legion killed hundreds of orcs with nearly no loss. ...", "After they were satisfied they walked back to the castle."}, cid, 0, 1, 3500)
		npcHandler.topic[cid] = 9
	elseif msgcontains(msg, 'back') and npcHandler.topic[cid] == 9 then
		npcHandler:say({"It is said that the orcish shamans cursed the Red Legion. ...",
						"Nobody knows. But one third of the soldiers died by a disease on the way back. ...",
						"And the orcs wanted to take revenge, and after some days they stroke back! ...",
						"The orcs and many allied cyclopses and minotaurs from all over Tibia came to avenge their friends, and they killed nearly all workers and soldiers in the castle. ...",
						"The help of the king's sister came too late."
					}, cid, 0, 1, 3000)
		npcHandler.topic[cid] = 10
	elseif msgcontains(msg, 'walk') and npcHandler.topic[cid] == 10 then
		NPCSay("It is said that the orcish shamans cursed the Red Legion. ...", 1)
		NPCSay("Nobody knows. But one third of the soldiers died by a disease on the way back. ...", 5)
		NPCSay("And the orcs wanted to take revenge, and after some days they stroke back! ...", 9)
		NPCSay("The orcs and many allied cyclopses and minotaurs from all over Tibia came to avenge their friends, and they killed nearly all workers and soldiers in the castle. ...", 13)
		NPCSay("The help of the king's sister came too late.", 17)
		npcHandler:say({"It is said that the orcish shamans cursed the Red Legion. ..",
						"Nobody knows. But one third of the soldiers died by a disease on the way back. ...",
						"And the orcs wanted to take revenge, and after some days they stroke back! ...",
						"The orcs and many allied cyclopses and minotaurs from all over Tibia came to avenge their friends, and they killed nearly all workers and soldiers in the castle. ...",
						"The help of the king's sister came too late."
					}, cid, 0, 1, 3000)
		npcHandler.topic[cid] = 11
	elseif msgcontains(msg, 'help') and npcHandler.topic[cid] == 11 then
		npcHandler:say({"She tried to rescue the workers but it was too late. The orcs started immediately to attack her troops, too. ...", "Her royal troops went back to the city. A trick saved the city from destruction."}, cid, 0, 1, 3500)
		npcHandler.topic[cid] = 12
	elseif msgcontains(msg, 'trick') and npcHandler.topic[cid] == 12 then
		npcHandler:say({"They used the same trick as against the Red Legion and the orcs started to fight their non-orcish-allies. ...",
						"After a bloody long fight the orcs went back to their cities. The city of Carlin was rescued. ...",
						"Since then, a woman has always been ruling over Carlin and this statue was made to remind us of their great tactics against the orcs and the Red Legion. ...",
						"So that was the story of Carlin and these Fields of Glory. I hope you liked it. *smiles*"
					}, cid, 0, 1, 3500)
		npcHandler.topic[cid] = 13
	elseif msgcontains(msg, 'destruction') and npcHandler.topic[cid] == 13 then
		npcHandler:say({"They used the same trick as against the Red Legion and the orcs started to fight their non-orcish-allies. ...",
						"After a bloody long fight the orcs went back to their cities. The city of Carlin was rescued. ...",
						"Since then, a woman has always been ruling over Carlin and this statue was made to remind us of their great tactics against the orcs and the Red Legion. ...",
						"So that was the story of Carlin and these Fields of Glory. I hope you liked it. *smiles*"
					}, cid, 0, 1, 3500)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
