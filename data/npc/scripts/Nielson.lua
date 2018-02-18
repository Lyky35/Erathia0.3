local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

-- Travel
local function addTravelKeyword(keyword, cost, destination)
	local travelKeyword = keywordHandler:addKeyword({keyword}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to sail to ' .. keyword:titleCase() .. ' for |TRAVELCOST|?', cost = cost, discount = 'postman'})
		travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, cost = cost, discount = 'postman', destination = destination})
		travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'We would like to serve you some time.', reset = true})
	keywordHandler:addKeyword({"bring me to "..keyword}, StdModule.travel, {npcHandler = npcHandler, premium = true, cost = cost, discount = 'postman', destination = destination, onlyFocus = false})
end

addTravelKeyword('vega', 20, Position(32020, 31692, 7))
addTravelKeyword('senja', 20, Position(32128, 31664, 7))
addTravelKeyword('folda', 20, Position(32046, 31578, 7))

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Nielson from the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'anderson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'svenson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'carlson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'nielson'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The four of us are the captains of the Nordic Tibia Ferries."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are ferrymen. We transport goods and passengers to the Ice Islands."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are ferrymen. We transport goods and passengers to the Ice Islands."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'ferry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'ferries'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'water'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our ferries are strong enough to stand the high waves of the Nordic Ocean."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can transport everything you want."})
keywordHandler:addKeyword({'passanger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We would like to welcome you on board our ferries."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today? We serve the routes to Senja, Folda, and Vega."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go today? We serve the routes to Senja, Folda, and Vega."})
keywordHandler:addKeyword({'island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We serve the routes to Senja, Folda, and Vega."})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We serve the routes to Senja, Folda, and Vega."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is Tibia, the continent."})

function greetCallback(cid)
	local player = Player(cid)
	if player:getSex() == PLAYERSEX_MALE then
		npcHandler:setMessage(MESSAGE_GREET, "Ahoi, young man ".. player:getName() .." and welcome to the Nordic Tibia Ferries.")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Ahoi, young lady ".. player:getName() .." and welcome to the Nordic Tibia Ferries.")
	end	
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
