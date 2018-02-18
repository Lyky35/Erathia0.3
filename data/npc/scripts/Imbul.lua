local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Travel
local function addTravelKeyword(keyword, text, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to the ' .. text .. ' for |TRAVELCOST|?', cost = cost})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Maybe another time.', reset = true})
	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('east', 'east end', 7, Position(32679, 32777, 7))
addTravelKeyword('centre', 'centre', 7, Position(32679, 32777, 7))

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm a ferryman. If you want me to transport you to the other end of the city, feel free to ask me for a passage."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Imbul."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, I don't own a watch."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It must be fun to be a king."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Here are many people from Venore. I used to live there but I lost my job and took the chance to come here."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's where the king lives. The roads there must be made of gold or marble at least."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a city, I know that."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Edron is some isle where the richest knights and sorcerers live. There they are not annoyed of the constant begging of poor people."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We already lost many settlers to the jungle. No one knows who is next."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That is our world, yes."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think those dwarves came from Kazordoon."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves that live here are searching for gold."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The dwarves that live here are searching for gold."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What is that?"})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The elven queen is the most beautiful woman in Tibia."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The elven queen is the most beautiful woman in Tibia."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Many came here to make their fortune. But it might take a while to become rich."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's somewhere behind that mountain."})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard it's a ghost town or something like that."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Why have some magicians to become evil?"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I never heard about that."})
keywordHandler:addKeyword({'apes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They stole my paddle once."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you follow the river far enough upcountry, you might see a lizardman. But be careful, they'll attack you as soon as they catch sight of you."})
keywordHandler:addKeyword({'dworc'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They are all murderers and cannibals."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can bring you either to the east end of Port Hope or to the centre of the town, where would you like to go?"})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can bring you either to the east end of Port Hope or to the centre of the town, where would you like to go?"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can bring you either to the east end of Port Hope or to the centre of the town, where would you like to go?"})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can bring you either to the east end of Port Hope or to the centre of the town, where would you like to go?"})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can bring you either to the east end of Port Hope or to the centre of the town, where would you like to go?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can bring you either to the east end of Port Hope or to the centre of the town, where would you like to go?"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can bring you either to the east end of Port Hope or to the centre of the town, where would you like to go?'})

npcHandler:addModule(FocusModule:new())
