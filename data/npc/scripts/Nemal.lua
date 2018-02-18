local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Nemal."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have no job. I'm a wanderer."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, I used to live there a while ago. Nice town."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Aaaahh, Carlin, yes. I know this town. Strange graveyard there, isn't it?"})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "King...king...yes, there is one. I still can remember the time when we had an other king. What was his name again?"})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I always have weapons with me. You never know what's behind the next corner."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hmm.. help? How can I help you?"})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I had a watch. It was nice, but I can't see the hands anymore."})
keywordHandler:addKeyword({'sword'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have a sword. It's very sharp. But I don't give it away, you never know."})
keywordHandler:addKeyword({'desert'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Desert? Where is one?"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard the name, but I don't trust rumours."})
keywordHandler:addKeyword({'fight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Better know how to fight!"})
keywordHandler:addKeyword({'guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hmmm.. I wouldn't ever join a guild, but i know of the existance of some."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't believe in gods, but a lot of people do. I never saw a god, why should I trust in someone I never met?"})
keywordHandler:addKeyword({'way'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are many ways. I don't know all of them."})
keywordHandler:addKeyword({'door'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Closed doors need keys. What a pity keys are not lying around like rubbish!"})
keywordHandler:addKeyword({'library'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can't read or write. What use would I have of a library?"})
keywordHandler:addKeyword({'secret'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Secrets should remain secret. No need of making them public."})
keywordHandler:addKeyword({'treasure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can find some treasures here - some are bigger, some are smaller, some are of true value, some are of materialistic value"})
keywordHandler:addKeyword({'book'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can't read. I've never learned it."})
keywordHandler:addKeyword({'gharonk'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My father knew this language."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't sell things. If you really need something, better walk straight to one of the towns or ask another adventurer."})
keywordHandler:addKeyword({'blind'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, I seem to be blind. But I am not sure - maybe the dungeons are too dark!"})

npcHandler:addModule(FocusModule:new())