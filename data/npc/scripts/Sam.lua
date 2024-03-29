local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say('Hello there, adventurer! Need a deal in weapons or armor? I\'m your man!', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if isInArray({'adorn', 'helmet', 'outfit', 'addon'}, msg) then
		if player:getStorageValue(1058) == 5 then
			npcHandler:say('Oh, Gregor sent you? I see. It will be my pleasure to adorn your helmet. Please give me some time to finish it.', cid)
			player:setStorageValue(1058, 6)
			player:setStorageValue(1059, os.time() + 2 * 60 * 60) -- 2 hour
		elseif player:getStorageValue(1058) == 6 then
			if player:getStorageValue(1059) < os.time() then
				npcHandler:say('Just in time, '.. player:getName() ..'. Your helmet is finished, I hope you like it.', cid)
				player:addOutfitAddon(139, 2)
				player:addOutfitAddon(131, 2)
				player:setStorageValue(1058, 7)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				npcHandler:say('It\'s not finished yet.', cid)
			end
		end
	end
	return true
end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the blacksmith. If you need weapons or armor - just ask me.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Samuel, but you can call me Sam."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'tibanus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king supports Tibia's economy a lot."})
keywordHandler:addKeyword({'quentin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a monk of some kind!"})
keywordHandler:addKeyword({'lynda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Uhm! ---blush---"})
keywordHandler:addKeyword({'harkath'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A warrior who is a joy for Banor."})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A warrior who is a joy for Banor."})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I supply the army with weapons and armor."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A threat for mankind! Buy weapons to be ready to face him."})
keywordHandler:addKeyword({'sam'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I was named after my grandfather."})
keywordHandler:addKeyword({'gorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He can tell a tale or two about his adventures with baxter in their younger days."})
keywordHandler:addKeyword({'frodo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like crowded places like his bar."})
keywordHandler:addKeyword({'elane'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, I hardly know her."})
keywordHandler:addKeyword({'muriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorcerers seldom need my skills."})
keywordHandler:addKeyword({'gregor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "His guild relies heavily on my wares."})
keywordHandler:addKeyword({'marvik'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I never visited his ... cave or whatever it's called."})
keywordHandler:addKeyword({'bozo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is funny now and then."})
keywordHandler:addKeyword({'baxter'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A fine warrior."})
keywordHandler:addKeyword({'oswald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oswald isn't one of the most liked people in this city."})
keywordHandler:addKeyword({'sherry'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'donald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'mcronald'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The McRonalds are the local farmers, aren't they?"})
keywordHandler:addKeyword({'lurgi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I just know some rumours that he is a follower of evil."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It is rumoured to be a weapon beyond mortal craftsmanship."})
keywordHandler:addKeyword({'news'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I know nothing of interest."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I sell and buy weapons, armor, helmets, and shields. So you are able to slash the monsters."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah, these awful beasts. They live in the forests near the city and in the sewers and dungeons."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Below our city are the sewers and I heard about a passage to the deeper dungeons."})
keywordHandler:addKeyword({'sewer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Below our city are the sewers and I heard about a passage to the deeper dungeons."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't ask me. I have never been there."})
keywordHandler:addKeyword({'thanks'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You are welcome."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to my shop, adventurer |PLAYERNAME|! I trade with weapons and armor.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye and come again, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye and come again.")


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'axe'},Cfaxe,7)
shopModule:addSellableItem({'battle axe'},Cfbattleaxe,80)
shopModule:addSellableItem({'battle hammer'},Cfbattlehammer,120)
shopModule:addSellableItem({'battle shield'},Cfbattleshield,95)
shopModule:addSellableItem({'bone club'},Cfboneclub,5)
shopModule:addSellableItem({'bone sword'},Cfbonesword,20)
shopModule:addSellableItem({'brass armor'},Cfbrassarmor,150)
shopModule:addSellableItem({'brass helmet'},Cfbrasshelmet,30)
shopModule:addSellableItem({'brass legs'},Cfbrasslegs,49)
shopModule:addSellableItem({'brass shield'},Cfbrassshield,25)
shopModule:addSellableItem({'carlin sword'},Cfcarlinsword,118)
shopModule:addSellableItem({'chain armor'},Cfchainarmor,70)
shopModule:addSellableItem({'chain helmet'},Cfchainhelmet,17)
shopModule:addSellableItem({'chain legs'},Cfchainlegs,25)
shopModule:addSellableItem({'club'},Cfclub,1)
shopModule:addSellableItem({'coat'},Cfcoat,1)
shopModule:addSellableItem({'copper shield'},Cfcoppershield,50)
shopModule:addSellableItem({'crowbar'},Cfcrowbar,50)
shopModule:addSellableItem({'dagger'},Cfdagger,2)
shopModule:addSellableItem({'doubleaxe'},Cfdoubleaxe,260)
shopModule:addSellableItem({'doublet'},Cfdoublet,3)
shopModule:addSellableItem({'dwarven shield'},Cfdwarvenshield,100)
shopModule:addSellableItem({'fire sword'},Cffiresword,1000)
shopModule:addSellableItem({'halberd'},Cfhalberd,400)
shopModule:addSellableItem({'hand axe'},Cfhandaxe,4)
shopModule:addSellableItem({'hatchet'},Cfhatchet,25)
shopModule:addSellableItem({'iron helmet'},Cfironhelmet,150)
shopModule:addSellableItem({'jacket'},Cfjacket,1)
shopModule:addSellableItem({'katana'},Cfkatana,35)
shopModule:addSellableItem({'leather armor'},Cfleatherarmor,12)
shopModule:addSellableItem({'leather boots'},Cfleatherboots,2)
shopModule:addSellableItem({'leather helmet'},Cfleatherhelmet,4)
shopModule:addSellableItem({'leather legs'},Cfleatherlegs,9)
shopModule:addSellableItem({'legion helmet'},Cflegionhelmet,22)
shopModule:addSellableItem({'longsword'},Cflongsword,51)
shopModule:addSellableItem({'mace'},Cfmace,30)
shopModule:addSellableItem({'magic plate armor'},Cfmagicplatearmor,6400)
shopModule:addSellableItem({'morning star'},Cfmorningstar,100)
shopModule:addSellableItem({'orcish axe'},Cforcishaxe,350)
shopModule:addSellableItem({'plate armor'},2463,400)
shopModule:addSellableItem({'plate legs'},Cfplatelegs,115)
shopModule:addSellableItem({'plate shield'},Cfplateshield,45)
shopModule:addSellableItem({'rapier'},Cfrapier,5)
shopModule:addSellableItem({'sabre'},Cfsabre,12)
shopModule:addSellableItem({'scale armor'},Cfscalearmor,75)
shopModule:addSellableItem({'short sword'},Cfshortsword,10)
shopModule:addSellableItem({'sickle'},Cfsickle,3)
shopModule:addSellableItem({'small axe'},Cfsmallaxe,5)
shopModule:addSellableItem({'soldier helmet'},Cfsoldierhelmet,16)
shopModule:addSellableItem({'spike sword'},Cfspikesword,240)
shopModule:addSellableItem({'steel helmet'},Cfsteelhelmet,293)
shopModule:addSellableItem({'steel shield'},Cfsteelshield,80)
shopModule:addSellableItem({'studded armor'},Cfstuddedarmor,25)
shopModule:addSellableItem({'studded club'},Cfstuddedclub,10)
shopModule:addSellableItem({'studded helmet'},Cfstuddedhelmet,20)
shopModule:addSellableItem({'studded legs'},Cfstuddedlegs,15)
shopModule:addSellableItem({'studded shield'},Cfstuddedshield,16)
shopModule:addSellableItem({'swampling club'},Cfswamplingclub,40)
shopModule:addSellableItem({'sword'},Cfsword,25)
shopModule:addSellableItem({'throwing knife'},Cfthrowingknife,2)
shopModule:addSellableItem({'twohanded sword'},Cftwohandedsword,450)
shopModule:addSellableItem({'viking helmet'},Cfvikinghelmet,66)
shopModule:addSellableItem({'viking shield'},Cfvikingshield,85)
shopModule:addSellableItem({'war hammer'},Cfwarhammer,470)
shopModule:addSellableItem({'wooden shield'},Cfwoodenshield,5)
	

shopModule:addBuyableItem({'axe'},CFaxe,20)
shopModule:addBuyableItem({'battle axe'},CFbattleaxe,235)
shopModule:addBuyableItem({'battle hammer'},CFbattlehammer,350)
shopModule:addBuyableItem({'bone sword'},CFbonesword,75)
shopModule:addBuyableItem({'brass armor'},CFbrassarmor,450)
shopModule:addBuyableItem({'brass helmet'},CFbrasshelmet,120)
shopModule:addBuyableItem({'brass legs'},CFbrasslegs,195)
shopModule:addBuyableItem({'brass shield'},CFbrassshield,65)
shopModule:addBuyableItem({'carlin sword'},CFcarlinsword,473)
shopModule:addBuyableItem({'chain armor'},CFchainarmor,200)
shopModule:addBuyableItem({'chain helmet'},CFchainhelmet,52)
shopModule:addBuyableItem({'chain legs'},CFchainlegs,80)
shopModule:addBuyableItem({'club'},CFclub,5)
shopModule:addBuyableItem({'coat'},CFcoat,8)
shopModule:addBuyableItem({'crowbar'},CFcrowbar,260)
shopModule:addBuyableItem({'dagger'},CFdagger,5)
shopModule:addBuyableItem({'doublet'},CFdoublet,16)
shopModule:addBuyableItem({'dwarven shield'},CFdwarvenshield,500)
shopModule:addBuyableItem({'hand axe'},CFhandaxe,8)
shopModule:addBuyableItem({'iron helmet'},CFironhelmet,390)
shopModule:addBuyableItem({'jacket'},CFjacket,12)
shopModule:addBuyableItem({'leather armor'},CFleatherarmor,35)
shopModule:addBuyableItem({'leather boots'},CFleatherboots,10)
shopModule:addBuyableItem({'leather helmet'},CFleatherhelmet,12)
shopModule:addBuyableItem({'leather legs'},CFleatherlegs,10)
shopModule:addBuyableItem({'longsword'},CFlongsword,160)
shopModule:addBuyableItem({'mace'},CFmace,90)
shopModule:addBuyableItem({'morning star'},CFmorningstar,430)
shopModule:addBuyableItem({'plate armor'},2463,1200)
shopModule:addBuyableItem({'plate shield'},CFplateshield,125)
shopModule:addBuyableItem({'rapier'},CFrapier,15)
shopModule:addBuyableItem({'sabre'},CFsabre,35)
shopModule:addBuyableItem({'scale armor'},CFscalearmor,260)
shopModule:addBuyableItem({'short sword'},CFshortsword,26)
shopModule:addBuyableItem({'sickle'},CFsickle,7)
shopModule:addBuyableItem({'soldier helmet'},CFsoldierhelmet,110)
shopModule:addBuyableItem({'spike sword'},CFspikesword,8000)
shopModule:addBuyableItem({'steel helmet'},CFsteelhelmet,580)
shopModule:addBuyableItem({'steel shield'},CFsteelshield,240)
shopModule:addBuyableItem({'studded armor'},CFstuddedarmor,90)
shopModule:addBuyableItem({'studded helmet'},CFstuddedhelmet,63)
shopModule:addBuyableItem({'studded legs'},CFstuddedlegs,50)
shopModule:addBuyableItem({'studded shield'},CFstuddedshield,50)
shopModule:addBuyableItem({'sword'},CFsword,85)
shopModule:addBuyableItem({'throwing knife'},CFthrowingknife,25)
shopModule:addBuyableItem({'two handed sword'},CFtwohandedsword,950)
shopModule:addBuyableItem({'viking helmet'},CFvikinghelmet,265)
shopModule:addBuyableItem({'viking shield'},CFvikingshield,260)
shopModule:addBuyableItem({'war hammer'},CFwarhammer,10000)
shopModule:addBuyableItem({'wooden shield'},CFwoodenshield,15)

npcHandler:addModule(FocusModule:new())

