local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()		npcHandler:onThink()		end

local voices = { {text = 'Passages to Thais, Darashia, Edron, Venore, Ankrahmun and Liberty Bay.'} }
npcHandler:addModule(VoiceModule:new(voices))

-- Travel
local function addTravelKeyword(keyword, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you seek a passage to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination, onlyFocus = false}, nil, action)
end

addTravelKeyword('edron', 150, Position(33173, 31764, 6))
addTravelKeyword('venore', 160, Position(32954, 32022, 6))
addTravelKeyword('ankrahmun', 110, Position(33092, 32883, 6))
addTravelKeyword('darashia', 180, Position(33289, 32480, 6))
addTravelKeyword('thais', 160, Position(32310, 32210, 6))
addTravelKeyword('liberty bay', 50, Position(32285, 32892, 6))

-- Kick
keywordHandler:addKeyword({'kick'}, StdModule.kick, {npcHandler = npcHandler, destination = Position(32536, 32791, 6)})

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of the Poodle, the proudest ship on all oceans."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's Charles."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His majesty himself was present at the day the Poodle was launched."})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's a fascinating forest, full of exotic life. If it weren't for my duties, I would spend some time just exploring this jungle."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We live in a fascinating world with even more fascinating oceans. And all its major harbours are known to me."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "An inland town of dwarves, somewhere in the middle of nowhere."})
keywordHandler:addKeyword({'dwarves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's fun to see a seasoned dwarven fighter turnining into a shivering green something as soon as we get a mild breeze on sea."})
keywordHandler:addKeyword({'dwarfs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's fun to see a seasoned dwarven fighter turnining into a shivering green something as soon as we get a mild breeze on sea."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My visits there were interesting and I learnt a lot about the elves and their city. I can only recommend a visit there and if it is only to admire the amazing architectural style in which the city was built."})
keywordHandler:addKeyword({'elves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are very special creatures. They keep in touch with nature almost like druids. Although I don't really understand their way of life, I think we could learn one or two things of them."})
keywordHandler:addKeyword({'elfs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves are very special creatures. They keep in touch with nature almost like druids. Although I don't really understand their way of life, I think we could learn one or two things of them."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sailed around the whole continent once and I have seen many of its wonders. For sure there are more waiting to be discovered."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is that for the land what giant sea serpents are for the sea."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You better ask some knight about it."})
keywordHandler:addKeyword({'apes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would love to catch a living exemplar and bring it to Thais so the king could see it."})
keywordHandler:addKeyword({'lizard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They have a small settlement in the southeast of the jungle next to the coast. It looks somewhat primitive but there is evidence it was erected only recently."})
keywordHandler:addKeyword({'dworcs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They attacked us when we set our feet on the south shore of the continent. They are poison using savages, nothing more."})

npcHandler:setMessage(MESSAGE_GREET, "Ahoy. Where can I sail you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye.")
