local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "cough syrup") then
		npcHandler:say("Do you want to buy a bottle of cough syrup for 50 gold?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if not player:removeMoney(50) then
				npcHandler:say("You don't have enough money.", cid)
				return true
			end

			npcHandler:say("Thank you. Here it is.", cid)
			player:addItem(4839, 1)
		end

		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = "I am the grand druid of Carlin. I am responsible for the guild, the fields, and our citizens' health."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "Every druid is able to learn the numerous spells of our craft."})
--keywordHandler:addKeyword({'spell'}, StdModule.say, {npcHandler = npcHandler, text = "Sorry, I don't teach spells for your vocation."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = "I am Padreia, grand druid of our fine city."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = "Time is just a crystal pillar - the centre of creation and life."})
keywordHandler:addKeyword({'druids'}, StdModule.say, {npcHandler = npcHandler, text = "We are druids, preservers of life. Our magic is about defence, healing, and nature."})
keywordHandler:addKeyword({'sorcerers'}, StdModule.say, {npcHandler = npcHandler, text = "Sorcerers are destructive. Their power lies in destruction and pain."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to our humble guild, wanderer. May I be of any assistance to you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())