local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, that's confidential."})				
keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm well prepared for my duty."})				
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Visit the shopkeepers to buy their fine wares."})				
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "LONG LIVE THE KING!"})				
keywordHandler:addKeyword({'leader'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "LONG LIVE THE KING!"})				
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm Lieutenant Falk."})				
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm the Edron harbour guard. I protect Edron castle and inform visitors about this building and Edron itself."})				
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The local army consists only of the Knights of Banor's Blood."})				
keywordHandler:addKeyword({'guard'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The local army consists only of the Knights of Banor's Blood."})				
keywordHandler:addKeyword({'battlegroup'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are the Dogs of War, the Red Guards, and the Silver Guards."})				
keywordHandler:addKeyword({'castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Edron castle is the home of many shops, a tavern, a bank, a depot, a post office and the temple of Banor's blood."})				
keywordHandler:addKeyword({'subject'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We all live under the benevolent guidance of our king."})				
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The shops are on the eastern side of the castle. Upstairs you'll find a tailor, a blacksmith, and an equipment store."})				
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The tavern is called the Horn of Plenty, and it's located upstairs in the southwest corner of the castle."})				
keywordHandler:addKeyword({'bank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You'll find the bank in the southwest of the castle. Look for Ebenizer, you can't miss him."})				
keywordHandler:addKeyword({'post'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The post office, run by the lovely Chrystal is in the southwest corner of the castle, near the Royal Bank."})				
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The temple can be found underground, in the southeast corner of the castle. There you can become a citizen of Edron"})				
keywordHandler:addKeyword({'citizen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The temple can be found underground, in the southeast corner of the castle. There you can become a citizen of Edron"})				
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The mysterious isle has many secrets and sights outside the castle. The areas of interest are in the west, the southwest, the north, and the northwest."})				
keywordHandler:addKeyword({'southwest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are rumours of orc buildings in the southeast. They say some daring fellows found a passage to this area in an old cavern beneath the Edron flats."})				
keywordHandler:addKeyword({'northwest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't even think about going there. Renegade Knights of Banor's Blood went there to unearth forbidden secrets in an ancient ruin."})				
keywordHandler:addKeyword({'north'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the north, there is an ancient city of cyclopses, called the cyclopolis. They are wary of us, but trade with servants of evil from any known race."})				
keywordHandler:addKeyword({'west'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There are rumours of two tribes of minor monsters who battle each other for dominance over the area. Not worth to crawl the sewers to get there."})				
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "In the city there is a furniture store and a jeweller. The Noodles Academy and the cemetary are outside."})				
keywordHandler:addKeyword({'academy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The Noodles Academy of the magic arts is in the east of Edron city."})				
keywordHandler:addKeyword({'cemetary'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The cemetary is north of the hamlet of Stonehome, which is at the east coast, northeast of Edron city. The cemetary is rumoured to be haunted."})				
keywordHandler:addKeyword({'work'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Explore the isle and destroy any enemy forces encountered. The honor shall be your reward."})				
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Explore the isle and destroy any enemy forces encountered. The honor shall be your reward."})				
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Explore the isle and destroy any enemy forces encountered. The honor shall be your reward."})				

local guardCondition = Condition(CONDITION_FIRE, CONDITIONID_COMBAT)
guardCondition:setParameter(CONDITION_PARAM_DELAYED, 10)
guardCondition:addDamage(10, 3000, -10)

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local npc = Npc()
	if isInArray(swear, msg) then
		npc:say("Take this!", TALKTYPE_SAY)
		npc:getPosition():sendDistanceEffect(player:getPosition(), CONST_ANI_FIRE)
		player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
		player:addCondition(guardCondition)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())