local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Passages to Kazordoon! Gotta try the beer there.'} }
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, text, cost, discount, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = text[1], cost = cost, discount = discount})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, text = text[2], cost = cost, discount = discount, destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = text[3], reset = true})
	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('kazordoon', {'Do you want to go to Kazordoon to try the beer there? |TRAVELCOST|?', 'Set the sails!', 'Then not.'}, 160, 'postman', Position(32660, 31957, 15))

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As should be quite obvious, I am operating a steamship."})
keywordHandler:addKeyword({'work'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As should be quite obvious, I am operating a steamship."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Gurbasch Firejuggler, son of the machine, of the Molten Rock."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia? Just don't ask."})
keywordHandler:addKeyword({'steamship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is indeed something we dwarfs may be proud of: a ship operating by steam power."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is indeed something we dwarfs may be proud of: a ship operating by steam power."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Captain"})
keywordHandler:addKeyword({'technomancer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A technomancer wields power over incredible machines, as his knowledge is his magic."})
keywordHandler:addKeyword({'inventors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You know, elves may be intelligent, but they are too lazy to invent. Really."})
keywordHandler:addKeyword({'inventions'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You know, elves may be intelligent, but they are too lazy to invent. Really."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not a vendor."})
keywordHandler:addKeyword({'buy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am not a vendor."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ""})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'senja'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'folda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'vega'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'ice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "How do you expect me to go there? Fly? Hm, wait... no, sorry."})
keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, we ARE at Cormaya! Must be the cavemadness..."})
keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ah, you got some? Nah, beer only tastes fine in Kazordoon. If you have brought it from there, it tastes foul now, I guess."})
keywordHandler:addKeyword({'beer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are an old and proud race, although we posess the best inventions."})
keywordHandler:addKeyword({'brodrosch'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is my brother working the Kazordoon steamship."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Have one elf onboard a ship, and you are doomed."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Have one elf onboard a ship, and you are doomed."})

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want me take you to Kazordoon?'})

npcHandler:setMessage(MESSAGE_GREET, 'Welcome, |PLAYERNAME|! May Earth protect you, even whilst sailing!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Until next time.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Until next time.')

npcHandler:addModule(FocusModule:new())
