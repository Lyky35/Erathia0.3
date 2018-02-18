local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Femor Hills or Darashia if you like. Where do you want to go?"})

local travelNodes = {
	["darashia"] = {cost = 40, pos = Carpetdarashia, text = "Darashia"},
	["femor hills"] = {cost = 60, pos = Carpethills, text = "Femor Hills"}
}

local bringNodes = {
	["bring me to darashia"] = {cost = 40, pos = Carpetdarashia},
	["bring me to fermor hills"] = {cost = 60, pos = Carpethills}
}

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())