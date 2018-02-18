local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
-- OTServ event handling functions start
function onCreatureSay(cid, type, msg)                          npcHandler:onCreatureSay(cid, type, msg) end
function onThingMove(creature, thing, oldpos, oldstackpos)              npcHandler:onThingMove(creature, thing, oldpos, oldstackpos) end
function onCreatureAppear(creature)                             npcHandler:onCreatureAppear(creature) end
function onCreatureDisappear(id)                            npcHandler:onCreatureDisappear(id) end
function onCreatureTurn(creature)                           npcHandler:onCreatureTurn(creature) end
function onCreatureChangeOutfit(creature)                       npcHandler:onCreatureChangeOutfit(creature) end
function onThink()                                  npcHandler:onThink() end
-- OTServ event handling functions end
 
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 
-- ITEMS HE BUYS! --
-- Rings: --
shopModule:addSellableItem({'sell sword ring'}, 2207, 100, 'Sword Ring')
shopModule:addSellableItem({'sell club ring'}, 2209, 100, 'Club Ring')
shopModule:addSellableItem({'sell axe ring'}, 2208, 100, 'Axe Ring')
shopModule:addSellableItem({'sell power ring'}, 2166, 50, 'Power Ring')
shopModule:addSellableItem({'sell stealth ring'}, 2165, 200, 'Stealth Ring')
-- Amulets: --
shopModule:addSellableItem({'sell stone skin amulet'}, 2197, 500, 'Stone Skin Amulet')
shopModule:addSellableItem({'sell elven amulet'}, 2198, 100, 'Elven Amulet')
shopModule:addSellableItem({'sell bronze amulet'}, 2172, 50, 'Bronze Amulet')
shopModule:addSellableItem({'sell garlic necklace'}, 2199, 50, 'Garlic Necklace')
-- Wands: --
shopModule:addSellableItem({'magic light wand', 'magic lightwand'}, 2162, 35, 'Magic Lightwand')
shopModule:addSellableItem({'wand of vortex'}, 2190, 100, 'Wand of Vortex')
shopModule:addSellableItem({'wand of dragonbreath'}, 2191, 200, 'Wand of Dragonbreath')
shopModule:addSellableItem({'wand of plague'}, 2188, 1000, 'Wand of Plague')
shopModule:addSellableItem({'wand of cosmic energy'}, 2189, 2000, 'Wand of Cosmic Energy')
shopModule:addSellableItem({'wand of inferno'}, 2187, 3000, 'Wand of Inferno')
-- Special Items: --
shopModule:addSellableItem({'orb'}, 2176, 750, 'Orb')
shopModule:addSellableItem({'mind stone'}, 2178, 100, 'Mind Stone')
shopModule:addSellableItem({'life crystal'}, 2177, 50, 'Life Crystal')
 
-- ITEMS HE SELLS! --
shopModule:addBuyableItem({'buy sword ring'}, 2207, 500, 'Sword Ring')
shopModule:addBuyableItem({'buy club ring'}, 2209, 500, 'Club Ring')
shopModule:addBuyableItem({'buy axe ring'}, 2208, 500, 'Axe Ring')
shopModule:addBuyableItem({'buy power ring'}, 2166, 100, 'Power Ring')
shopModule:addBuyableItem({'buy stealth ring'}, 2165, 5000, 'Stealth Ring')
-- Amulets: --
shopModule:addBuyableItem({'buy stone skin amulet'},    2197, 5000,     10, 5, 'Stone Skin Amulet')
shopModule:addBuyableItem({'buy elven amulet'},     2198, 500,  50, 30, 'Elven Amulet')
shopModule:addBuyableItem({'buy bronze amulet'},    2172, 100,  200, 200,    'Bronze Amulet')
shopModule:addBuyableItem({'buy garlic necklace'},  2199, 100,  150, 200,    'Garlic Necklace')
 
 
 
-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())