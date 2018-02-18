local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "wooden stake") then
		if npcHandler.topic[cid] == 0 then
			if player:getStorageValue(1081) < 12 then
				return false
			end
		
			if player:getItemCount(5941) < 1 then
				npcHandler:say("You don't have the wooden stake with you.", cid)
				return false
			end

			if player:getStorageValue(1082) > os.time() then
				npcHandler:say("Sorry I'm still exhausted from the last ritual. come back later and try again.", cid)
				npcHandler.topic[cid] = 0
				return false
			end

			npcHandler:say("Ten prayers for a blessed stake? Don't tell me they made you travel whole Tibia for it! Listen, child, if you bring me a wooden stake, I'll bless it for you. <chuckles>", cid)
			npcHandler.topic[cid] = 1
		elseif npcHandler.topic[cid] == 1 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say("Would you like to receive a spiritual prayer to bless your stake?", cid)
				npcHandler.topic[cid] = 2
			end
		end
	elseif msgcontains(msg, "addon") then
		if player:hasOutfit(player:getSex() == PLAYERSEX_FEMALE and 158 or 154) then
			if player:getStorageValue(2034) < 1 then
				npcHandler:say({
					"Deep in the Tiquandian jungle a monster lurks which is seldom seen. It is the revenge of the jungle against humankind. ...",
					"This monster, if slain, carries a rare root called Mandrake. If you find it, bring it to me. Also, gather 5 of the voodoo dolls used by the mysterious dworc voodoomasters. ...",
					"If you manage to fulfil this task, I will grant you your own staff. Have you understood everything and are ready for this test?"
				}, cid)
				npcHandler.topic[cid] = 4
			elseif player:getStorageValue(2034) == 1 then
				npcHandler:say("Have you gathered the mandrake and the 5 voodoo dolls from the dworcs?", cid)
				npcHandler.topic[cid] = 5
			elseif player:getStorageValue(2034) == 2 then
				npcHandler:say("You have successfully passed the first task. If you can fulfil my second task, I will grant you a mask like the one I wear. Will you listen to the requirements?", cid)
				npcHandler.topic[cid] = 6
			end
		else
			npcHandler:say("Come back when you can wear shamanic clothing.", cid)
		end
	elseif msgcontains(msg, "tribal mask") then
		if player:getStorageValue(2034) == 3 then
			npcHandler:say("Have you gathered the 5 tribal masks and the 5 banana staves?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			if not player:removeItem(5941, 1) then
				npcHandler:say("You don't have the wooden stake with you.", cid)
				npcHandler.topic[cid] = 0
				return false
			end

			player:setStorageValue(1082, os.time() + 7 * 24 * 60 * 60)
			npcHandler:say("<mumblemumble> Sha Kesh Mar!", cid)
			player:addItem(5942, 1)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			player:setStorageValue(2034, 1)
			npcHandler:say("Good! Come back once you found a mandrake and collected 5 dworcish voodoo dolls.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then
			if player:getItemCount(5015) > 0 and player:getItemCount(3955) >= 5 then
				player:removeItem(5015, 1)
				player:removeItem(3955, 5)
				player:addOutfitAddon(158, 1)
				player:addOutfitAddon(154, 1)
				player:setStorageValue(2034, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				npcHandler:say("I am proud of you, my child, excellent work. This staff shall be yours from now on!", cid)
			else
				npcHandler:say("You don't have the required items.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 6 then
			npcHandler:say({
				"The dworcs of Tiquanda like to wear certain tribal masks which I would like to take a look at. Please bring me 5 of these masks. ...",
				"Secondly, the high ape magicians of Banuta use banana staves. I would love to learn more about theses staves, so pleasebring me 5 of them also. ...",
				"If you manage to fulfil this task, I will grant you your own mask. Have you understood everything and are ready for this test?"
			}, cid)
			npcHandler.topic[cid] = 7
		elseif npcHandler.topic[cid] == 7 then
			player:setStorageValue(2034, 3)
			npcHandler:say({
				"Good! Come back once you have collected 5 tribal masks and 5 banana staves. ...",
				"I shall grant you a sign of your progress as shaman if you can fulfil my task."
			}, cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 8 then
			if player:getItemCount(3966) >= 5 and player:getItemCount(3967) >= 5 then
				player:removeItem(3966, 5)
				player:removeItem(3967, 5)
				player:addOutfitAddon(158, 2)
				player:addOutfitAddon(154, 2)
				player:setStorageValue(2034, 4)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				npcHandler:say("Well done, my child! I hereby grant you the right to wear a shamanic mask. Do it proudly.", cid)
			else
				npcHandler:say("You don't have the required items.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] >= 1 then
		npcHandler:say("Maybe next time.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())