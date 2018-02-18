local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({'comb'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Sorry, I don\'t have a spare comb. I lost my favourite one when diving around in Calassa.'})

npcHandler:addModule(FocusModule:new())