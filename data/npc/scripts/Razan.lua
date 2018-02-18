local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the weaponmaster of Caliph Kazzan the great."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Razan ... Razan Ibn Rublai."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are talking of what you are wasting right now?"})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We owe caliph Kazzan our loyality and gratitude, thrice praised be his name."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We owe caliph Kazzan our loyality and gratitude, thrice praised be his name."})
keywordHandler:addKeyword({'shalmar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is competent. That's fine enough for a mage."})
keywordHandler:addKeyword({'djinn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some people in Darashia rely to much on the services of these creatures. I wonder if they keep the path in mind."})
keywordHandler:addKeyword({'path'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The path of enlightenment, leading to ascension as thaught to us by Daraman."})
keywordHandler:addKeyword({'Daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better talk to Kasmir about that."})
keywordHandler:addKeyword({'enlightenment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better talk to Kasmir about that."})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better talk to Kasmir about that."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Maybe a worthy oponent, but probably only another of these spellcasting cowards."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This information is confidential."})
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This information is confidential."})
keywordHandler:addKeyword({'kasmir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You will find him in the Muhayin, the sacred tower of meditation."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The skill should make a fighter strong, not the weapon."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care for rumours but for facts."})
keywordHandler:addKeyword({'weaponmaster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I mastered the arts of close combat and distance fight alike. I teach both, paladins and knights in their ways."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world is a dangerous place for body and for soul."})
keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The way of the warrior is not that different from the way to ascension."})
keywordHandler:addKeyword({'paladin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The way of the warrior is not that different from the way to ascension."})
keywordHandler:addKeyword({'spellbook'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In a spellbook, your spells are listed. There you will find the pronunciation of each spell. Rely more on your skills, though."})

npcHandler:addModule(FocusModule:new())