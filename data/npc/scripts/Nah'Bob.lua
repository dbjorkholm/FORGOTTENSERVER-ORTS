local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()
	npcHandler:onThink()					
end

local buyList = 
{
	{itemId = 7436, price = 5000}, -- Angelic Axe
	{itemId = 2656, price = 10000}, -- Blue Robe
	{itemId = 2518, price = 1200}, -- Bonelord Shield
	{itemId = 2195, price = 30000}, -- Boots of Haste
	{itemId = 2413, price = 500}, -- Broadsword
	{itemId = 7412, price = 18000}, -- Butcher's Axe
	{itemId = 2487, price = 12000}, -- Crown Armor
	{itemId = 2491, price = 2500}, -- Crown Helmet
	{itemId = 2488, price = 12000}, -- Crown Legs
	{itemId = 2519, price = 8000}, -- Crown Shield
	{itemId = 2497, price = 6000}, -- Crusader Helmet
	{itemId = 2414, price = 9000}, -- Dragon Lance
	{itemId = 2516, price = 4000}, -- Dragon Shield
	{itemId = 7854, price = 1000}, -- Earth Spike Sword
	{itemId = 7868, price = 1200}, -- Earth War Hammer
	{itemId = 7869, price = 1000}, -- Energy Spike Sword
	{itemId = 7883, price = 1200}, -- Energy War Hammer
	{itemId = 7744, price = 1000}, -- Fiery Spike Sword
	{itemId = 7758, price = 1200}, -- Fiery War Hammer
	{itemId = 2432, price = 8000}, -- Fire Axe
	{itemId = 2392, price = 4000}, -- Fire Sword
	{itemId = 7454, price = 3000}, -- Glorious Axe
	{itemId = 2515, price = 2000}, -- Guardian Shield
	{itemId = 2396, price = 1000}, -- Ice Rapier
	{itemId = 7763, price = 1000}, -- Icy Spike Sword
	{itemId = 7777, price = 1200}, -- Icy War Hammer
	{itemId = 2486, price = 900}, -- Noble Armor
	{itemId = 2425, price = 500}, -- Obsidian Lance
	{itemId = 2539, price = 16000}, -- Phoenix Shield
	{itemId = 7410, price = 20000}, -- Queen's Sceptre
	{itemId = 2498, price = 30000}, -- Royal Helmet
	{itemId = 7451, price = 10000}, -- Shadow Sceptre
	{itemId = 2383, price = 1000}, -- Spike Sword
	{itemId = 7391, price = 16000}, -- Thaian Sword
	{itemId = 2391, price = 1200}, -- War Hammer
}
local sellList = 
{
	{itemId = 2518, price = 7000}, -- Bonelord Shield
	{itemId = 2486, price = 8000}, -- Noble Armor
	{itemId = 2425, price = 3000}, -- Obsidian Lance
	{itemId = 2383, price = 8000}, -- Spike Sword
	{itemId = 2391, price = 10000}, -- War Hammer
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())