local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mr. Postner is one of the most honorable men I know."})
keywordHandler:addKeyword({'postner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Mr. Postner is one of the most honorable men I know."})
keywordHandler:addKeyword({'postmasters guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As long as everyone lives up to our standarts our guild will be fine."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are always looking able recruits. Just speak to Mr.Postner in our headquarter."})
keywordHandler:addKeyword({'headquarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its easy to be found. Its on the road from Thais to Kazordoon and Ab'dendriel."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for this post office. If you have questions about the mail system or the depots, just ask me."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Dove."})
keywordHandler:addKeyword({'dove'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, like the bird. <giggles>"})
keywordHandler:addKeyword({'depot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The depots are very easy to use. Just step in front of them and you will find your items in them. They are free for all Tibian citizens."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even the king can be reached by the mailsystem."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Even the king can be reached by the mailsystem."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The soldiers get a lot of letters and parcels from Thais each week."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Try to contact him by mail."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Try to contact him by mail."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ham? No thanks, I ate fish already."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If i find it in an undeliverable parcel, I will contact you."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Well, there are rumours about the swampelves and the amazons, as usual."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All cities are covered by our mail system."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "All cities are covered by our mail system."})
keywordHandler:addKeyword({'swampelves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "They live somewhere in the swamp and usually stay out of our city. Only now and then some of them dare to interfere with us."})
keywordHandler:addKeyword({'amazon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "These women are renegades from Carlin, and one of their hidden villages or hideouts might be in the swamp."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "measurements") then
		if player:getStorageValue(2011) >= 1 and player:getStorageValue(2022) ~= 1 then
			npcHandler:say("Oh no! I knew that day would come! I am slightly above the allowed weight and if you can't supply me with some grapes to slim down I will get fired. Do you happen to have some grapes with you? ", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(2681, 1) then
				npcHandler:say("Oh thank you! Thank you so much! So listen ... <whispers her measurements> ", cid)
				player:setStorageValue(2011, player:getStorageValue(2011) + 1)
				player:setStorageValue(2022, 1)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())