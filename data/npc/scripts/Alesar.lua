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
	local missionProgress = player:getStorageValue(1098)
	if msgcontains(msg, 'mission') then
		if player:getStorageValue(1097) == 3 then
			if missionProgress < 1 then
				npcHandler:say({
					'So Baa\'leal thinks you are up to do a mission for us? ...',
					'I think he is getting old, entrusting human scum such as you are with an important mission like that. ...',
					'Personally, I don\'t understand why you haven\'t been slaughtered right at the gates. ...',
					'Anyway. Are you prepared to embark on a dangerous mission for us?'
				}, cid)
				npcHandler.topic[cid] = 1

			elseif missionProgress == 1 then
				npcHandler:say('Did you find the tear of Daraman?', cid)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say('Don\'t forget to talk to Malor concerning your next mission.', cid)
			end
		end

	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			npcHandler:say({
				'All right then, human. Have you ever heard of the \'Tears of Daraman\'? ...',
				'They are precious gemstones made of some unknown blue mineral and possess enormous magical power. ...',
				'If you want to learn more about these gemstones don\'t forget to visit our library. ...',
				'Anyway, one of them is enough to create thousands of our mighty djinn blades. ...',
				'Unfortunately my last gemstone broke and therefore I\'m not able to create new blades anymore. ...',
				'To my knowledge there is only one place where you can find these gemstones - I know for a fact that the Marid have at least one of them. ...',
				'Well... to cut a long story short, your mission is to sneak into Ashta\'daramai and to steal it. ...',
				'Needless to say, the Marid won\'t be too eager to part with it. Try not to get killed until you have delivered the stone to me.'
			}, cid)

			if missionProgress ~= 1 then
				player:setStorageValue(1098, 1)
			end
		elseif msgcontains(msg, 'no') then
			npcHandler:say('Then not.', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			if player:getItemCount(2346) == 0 or player:getStorageValue(31254) ~= 1 then
				npcHandler:say('As I expected. You haven\'t got the stone. Shall I explain your mission again?', cid)
				npcHandler.topic[cid] = 1
				return false
			end

			npcHandler:say({
				'So you have made it? You have really managed to steal a Tear of Daraman? ...',
				'Amazing how you humans are just impossible to get rid of. Incidentally, you have this character trait in common with many insects and with other vermin. ...',
				'Nevermind. I hate to say it, but it you have done us a favour, human. That gemstone will serve us well. ...',
				'Baa\'leal, wants you to talk to Malor concerning some new mission. ...',
				'Looks like you have managed to extended your life expectancy - for just a bit longer.'
			}, cid)
			player:removeItem(2346, 1)
			player:setStorageValue(1098, 2)
			npcHandler.topic[cid] = 0
		elseif msgcontains(msg, 'no') then
			npcHandler:say('As I expected. You haven\'t got the stone. Shall I explain your mission again?', cid)
			npcHandler.topic[cid] = 1
		end
	end
	return true
end

local function onTradeRequest(cid)
	if Player(cid):getStorageValue(2000) ~= 1 then
		npcHandler:say('No chance, human. Malor doesn\'t want me to trade with strangers.', cid)
		return false
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'What do you want from me, |PLAYERNAME|?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Finally.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Finally.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hi')
focusModule:addGreetMessage('hello')
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)