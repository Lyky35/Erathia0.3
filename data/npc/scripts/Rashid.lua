local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, text = "I am a travelling trader. I don't buy everything, though. And not from everyone, for that matter."})
keywordHandler:addKeyword({"name"}, StdModule.say, {npcHandler = npcHandler, text = "I am Rashid, son of the desert."})
keywordHandler:addKeyword({"offers"}, StdModule.say, {npcHandler = npcHandler, text = "Of course, old friend. You can also browse only armor, legs, shields, helmets, boots, weapons, enchanted weapons, jewelry or miscellaneous stuff."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, text = "Elves... I don't really trust them. All this talk about nature and flowers and treehugging... I'm sure there's some wicked scheme behind all this."})
keywordHandler:addKeyword({"desert"}, StdModule.say, {npcHandler = npcHandler, text = "My beloved hometown! Ah, the sweet scent of the desert sands, the perfect shape of the pyramids... stunningly beautiful."})
keywordHandler:addKeyword({"karmia"}, StdModule.say, {npcHandler = npcHandler, text = "I have to go to Karmia once in a while, since the queen wishes to see my exclusive wares in regular intervals."})
keywordHandler:addKeyword({"cormaya"}, StdModule.say, {npcHandler = npcHandler, text = "Cormaya? Not a good place to make business, it's way too far and small."})
keywordHandler:addKeyword({"darashia"}, StdModule.say, {npcHandler = npcHandler, text = "It's not the real thing, but almost as good. The merchants there claim ridiculous prices, which is fine for my own business."})
keywordHandler:addKeyword({"premy island"}, StdModule.say, {npcHandler = npcHandler, text = "Ah yes, Premy Island! Such a lovely and quiet island! I usually make some nice business there."})
keywordHandler:addKeyword({"bibula"}, StdModule.say, {npcHandler = npcHandler, text = "Too few customers there, it's not worth the trip."})
keywordHandler:addKeyword({"greenshore"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"moria"}, StdModule.say, {npcHandler = npcHandler, text = "I don't like being underground much. I also tend to get lost in these labyrinthine dwarven tunnels, so I rather avoid them."})
keywordHandler:addKeyword({"blood bay"}, StdModule.say, {npcHandler = npcHandler, text = "When you avoid the slums, it's a really pretty city. Almost as pretty as the governor's daughter."})
keywordHandler:addKeyword({"northport"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"port hope"}, StdModule.say, {npcHandler = npcHandler, text = "I like the settlement itself, but I don't set my foot into the jungle. Have you seen the size of these centipedes??"})
keywordHandler:addKeyword({"senja"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"svargrond"}, StdModule.say, {npcHandler = npcHandler, text = "I wish it was a little bit warmer there, but with a good mug of barbarian mead in your tummy everything gets a lot cosier."})
keywordHandler:addKeyword({"thalia"}, StdModule.say, {npcHandler = npcHandler, text = "I feel uncomfortable and rather unsafe in Thalia, so I don't really travel there."})
keywordHandler:addKeyword({"vega"}, StdModule.say, {npcHandler = npcHandler, text = "Um... I don't think so."})
keywordHandler:addKeyword({"venore"}, StdModule.say, {npcHandler = npcHandler, text = "Although it's the flourishing trade centre of Tibia, I don't like going there. Too much competition for my taste."})
keywordHandler:addKeyword({"time"}, StdModule.say, {npcHandler = npcHandler, text = "It's almost time to journey on."})
keywordHandler:addKeyword({"king"}, StdModule.say, {npcHandler = npcHandler, text = "Kings, queens, emperors and kaliphs... everyone claims to be different and unique, but actually it's the same thing everywhere."})

npcHandler:setMessage(MESSAGE_GREET, "Ah, a customer! Be greeted, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|, may the winds guide your way.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon!")
npcHandler:addModule(FocusModule:new())