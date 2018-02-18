local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me put name away name long ago. Now only blind prophet of ape people are."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me prophet and guardian is."})
keywordHandler:addKeyword({'prophet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me is who in dreams speak to holy banana. Me divine the will of banana."})
keywordHandler:addKeyword({'guardian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me guard the forbidden land behind the great palisade. If any want to enter, he must ask me for transport."})
keywordHandler:addKeyword({'forbidden'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me guard the forbidden land behind the great palisade. If any want to enter, he must ask me for transport."})
keywordHandler:addKeyword({'Hairycles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Good ape he is. Has to work hard to make other apes listen but you helped a lot."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me not know. Me seldom have visions of not banana related objects."})
keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our people a lot to learn have. One day we might live in peace with you hairless apes, who knows."})
keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hairless apes strange people are."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The lizards evil and vengeful are. Ape people on guard must be."})
keywordHandler:addKeyword({'hair'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me visions show hair in the far north west of forbidden land. Near coast look for signs of Bongs presence."})

npcHandler:addModule(FocusModule:new())