local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am studying the power of magic all the time."})
keywordHandler:addKeyword({'lake'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I hope you like it. It is named like my master, Alatar, the Sage"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Loria, a former apprentice of Alatar, the Sage."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time means nothing to me."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't care for money, I care for magic."})
keywordHandler:addKeyword({'power'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Although your attack spells get stronger with your usage of magic, real power is gained by finding strategies to properly use your magic abilities."})
keywordHandler:addKeyword({'mana'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mana is the source of all magic. If you use spells, it will drain mana from your energy pool. This mana regenerates slowly, if you eat, or if you drink those mana fluids you can buy at Xodet's."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He runs an equipment shop close to the north gate of the city."})
keywordHandler:addKeyword({'xodet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He runs a magic shop in the main road."})
keywordHandler:addKeyword({'praise'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I praise my master Alatar."})
keywordHandler:addKeyword({'alatar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, he was my great master. He taught me all these fantastic things about magic. I really miss him."})
keywordHandler:addKeyword({'kill'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Killing and destruction are just foolish steaps to entrophy."})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard from a mystic bone of the lich lord below the House of Necromant. Bring it to me, and you will receive a reward."})
keywordHandler:addKeyword({'crystal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The mystic crystal should be able to resurrect fresh corpses."})
keywordHandler:addKeyword({'necromant'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He lived in a lonely house in the south eastern part of Tibia beyond the mountains."})
keywordHandler:addKeyword({'rune'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All spells starting with the syllable 'ad' must be burned into a rune. For this buy a rune from Xodet and put it in one of your hands. Now cast the formula of the spell."})
keywordHandler:addKeyword({'Muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He runs his magic shop in the southwest of the city. He sells runes and spells and helps you, if you want to become a sorcerer."})

npcHandler:addModule(FocusModule:new())