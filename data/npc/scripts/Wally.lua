local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm Wally the post officer."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am working here at the post office for Kevin."})
keywordHandler:addKeyword({'kevin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, our boss is upstairs. Better only disturb him with important issues though."})
keywordHandler:addKeyword({'postmer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, our boss is upstairs. Better only disturb him with important issues though."})
keywordHandler:addKeyword({'postmaster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are an organization of importance for the whole of Tibia. Even kings tremble before our might."})
keywordHandler:addKeyword({'guild'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We are an organization of importance for the whole of Tibia. Even kings tremble before our might."})
keywordHandler:addKeyword({'join'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You have to talk with the exalted archpostman Kevin Postner if you want to join our prestigeous guild."})
keywordHandler:addKeyword({'markwin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This minotaur is quite moody. Better make sure not to anger him. He's likely to call for his guards as soon as he notices a stranger, so you are on tough luck if you ever find him."})
keywordHandler:addKeyword({'santa'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This old whitebeard lives on some hill on the western coast of Vega as far as I know."})
keywordHandler:addKeyword({'claus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This old whitebeard lives on some hill on the western coast of Vega as far as I know."})
keywordHandler:addKeyword({'brassac'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This guy might be hard to find. Hes likely disguising himself. If you see someone suspicious, try to ask other people who are around about him. That might give you some clue."})
keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ask Mr. Postner about your current missions."})
keywordHandler:addKeyword({'ben'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Old Ben lost some of his marbles in some battle long ago. He is still a quite capable postman though ... on second thought thats some disturbing fact."})
keywordHandler:addKeyword({'lokur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarfs make quite good postmen. They are stubborn, strong and ... sturdy. Its a waste that he prefers a job behind the counter."})
keywordHandler:addKeyword({'dove'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dove is as good as a dozend pigeons. He He He."})
keywordHandler:addKeyword({'olrik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This Olrik was made postman only for convenience. He is quite aware that his attitude and affiliation with the thaian government makes it impossible for him to rise in rank. This leads only to him behaving even worse tough."})
keywordHandler:addKeyword({'liane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Although I never met her in person we became penpals over the time."})
keywordHandler:addKeyword({'wally'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, thats me, Wally!"})
keywordHandler:addKeyword({'advancement'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The exalted archpostman Kevin Postner alone decides about advancement of our members. All ranks come with certain privileges."})
keywordHandler:addKeyword({'privileges'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our privileges are top secret, other people envy us enough already for beeing members in this splendid guild."})
keywordHandler:addKeyword({'uniform'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We could badly need new uniforms."})
keywordHandler:addKeyword({'dress'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I vaguely remember the last dress pattern of our uniforms was dependend on certain key elements. It had some technical gadgets, a special smell and was uniquely colored."})
keywordHandler:addKeyword({'pattern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I vaguely remember the last dress pattern of our uniforms was dependend on certain key elements. It had some technical gadgets, a special smell and was uniquely colored."})
keywordHandler:addKeyword({'crowbar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Most general stores should sell crowbars. I think the store in Edron sells some for instance."})
keywordHandler:addKeyword({'hint'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can't help you much with your missions. Of course we tell you everything we know and do't make our missions needlesly difficult."})
keywordHandler:addKeyword({'headquarter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its humble and practical. Considering we have bases all over the known world we don't need a bigger base anyways. On the other hand Mr. Postner is dreaming about a postman academy now and then."})
keywordHandler:addKeyword({'bones'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If I would be looking for bones I'd inspect some skeletons ... If I weren't so affraid of them that is."})
keywordHandler:addKeyword({'banana'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uh? How disgusting. Look for this rubbish in some places where waste is dumped .. and don't ever tell me what you need it for."})
keywordHandler:addKeyword({'fur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "As far as I heard some of the minor orcs carry a pice of fur as a fetish or lucky charm with them."})
keywordHandler:addKeyword({'moldy cheese'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What a disgusting taste you have. Like those Goblins who carry this stuff with them."})
keywordHandler:addKeyword({'noodles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This dog is his majestys most priced possesion and heavily guarded. Anger the dog and you anger the king."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One of the oldest holdings of humanity that still exist and the heart of the biggest kingdom in the known world."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Carlin is an upcoming power in theese days. Albeit its ambitions it still dwarfs the old kingdom of thais in power and influence."})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think no longer is king Tibianus reigning this city, nor are the merchants ruling it, regardless what they might think. The true monarch before whom all there bow is the money."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I gues Edron isn't the source of wealth and rescources as the thaians hoped. The defection of those knights did cause the expansion and exploitation there to an halt."})
keywordHandler:addKeyword({'defection'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know nothing special about that story. I only heared that a good part of the knightly order the king sent there succumbed to their lust for wealth and power and turned against their swordbrethren."})
keywordHandler:addKeyword({'darama'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A far away place with strange customs and an even stranger philosophy. One day I might travel there to see it on my own."})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A far away place with strange customs and an even stranger philosophy. One day I might travel there to see it on my own."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elven volunteers for becoming a postofficer are quite rare. We had to rely on a human living there to ensure our postsystems function. Most elvish members of the guild prefer to work as courriers."})
keywordHandler:addKeyword({'elf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elven volunteers for becoming a postofficer are quite rare. We had to rely on a human living there to ensure our postsystems function. Most elvish members of the guild prefer to work as courriers."})
keywordHandler:addKeyword({'elve'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elven volunteers for becoming a postofficer are quite rare. We had to rely on a human living there to ensure our postsystems function. Most elvish members of the guild prefer to work as courriers."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city of the dwarfs is a bit hidden and new postoficers often get lost while looking for it. Just look for a hidden passage to a western valley in the mountaion called the big old one."})
keywordHandler:addKeyword({'dwar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The city of the dwarfs is a bit hidden and new postoficers often get lost while looking for it. Just look for a hidden passage to a western valley in the mountaion called the big old one."})
keywordHandler:addKeyword({'big old'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Its a huge Mountain, north of here, just across the river."})
keywordHandler:addKeyword({'posthorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A posthorn is a postmens bride ... or a postwomans husband. The only true friend a lonly postofficer has in the foregin lands and dangerous places he has to visit."})
keywordHandler:addKeyword({'cap'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A cap is what shows you are a postofficer. But your heart and your state of mind are what you makes a postofficer."})
keywordHandler:addKeyword({'mailbox'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our mailboxes are quite reliable but know and then one has to be fixed. Especually in the more rough climates."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local npc = Npc()
	if msgcontains(msg, "letter") then
		npc:say("Would you like to buy a letter for "..costLetter.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "parcel") then
		npc:say("Would you like to buy a parcel for "..costParcel.." gold", TALKTYPE_SAY)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, "mail") then
		npc:say("Our mail system is perfectly unique, and everybody is free to use it. Would you like to know more about it?", TALKTYPE_SAY)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then
			npc:say("Here it is. Don't forget to write the name of the receiver in the first line and the address in the second one before you put the letter in a mailbox", TALKTYPE_SAY)
			player:addItem(Cfletter, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			npc:say("Here you are. Don't forget to write the name and the address of the receiver on the label. The label has to be in the parcel before you put the parcel in a mailbox.", TALKTYPE_SAY)
			player:addItem(Cfparcel, 1)
			player:addItem(Cflabel, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			npc:say("The Tibia Mail System allows you to send and receive letters and parcels. You can buy them here if you want.", TALKTYPE_SAY)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] >= 1 then
		npc:say("Not then.", TALKTYPE_SAY)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
