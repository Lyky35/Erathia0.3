local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am just a humble monk and responsible to maintain this little outpost that is leftover from our grand order."})
keywordHandler:addKeyword({'monk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We monks of the humble path feel that we are not worthy to spread the word of the gods. We live in humility and poverty to serve the gods. Most of us have vowed an oath of silence and I humbly took the burden to become the spokesperson."})
keywordHandler:addKeyword({'order'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our order was once the greatest and richest in the whole known world. Kings, traders and knights of various orders were our supporters and the gods smiled upon us ... or at least that's what we thought until the day of doom."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I own no watch and only a small number of other worldly possessions."})
keywordHandler:addKeyword({'doom'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "On the day of doom, our dream of building the greatest and most opulent cathedral was shattered."})
keywordHandler:addKeyword({'shattered'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The cathedral was already high and impressive, the order had started to move in although there was still much left to be done. Then the great earthquake came."})
keywordHandler:addKeyword({'earthquake'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some say it was just the unstable ground or volcanic activity, some even claim it was the work of demons, but we know it was the will of the gods to punish our vanity."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king is a worldly ruler, and we don't burden ourselves with worldly concerns anymore."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The gracious tradesmen from Venore send us provisions from time to time."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is far and we have little contact with the kingdom's capital."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have no relations with that town."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope the knightly order there fares better than our own."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not worthy to speak about the gods."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The world is in the hand of the gods."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves are far from being humble. At least this ancient folk knows that there is nothing to gain in the cathedral's ruins and their treasure hunters stay away from there."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves are far from being humble. At least this ancient folk knows that there is nothing to gain in the cathedral's ruins and their treasure hunters stay away from there."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves are far from being humble. At least this ancient folk knows that there is nothing to gain in the cathedral's ruins and their treasure hunters stay away from there."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They will have to learn on their own."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They will have to learn on their own."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They will have to learn on their own."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Another continent that has to be seen as a present of the gods to us."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I will not judge those people."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not the right person to discuss this subject."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He will discover where his path will lead him to. But no matter how ruthless he is, even he stays away from the ruins of the cathedral."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is rumoured to be hidden somewhere beneath Edron."})

npcHandler:addModule(FocusModule:new())