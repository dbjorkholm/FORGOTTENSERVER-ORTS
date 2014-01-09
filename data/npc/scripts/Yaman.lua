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
	{itemId = 2201, price = 1000}, -- Dragon Necklace
	{itemId = 2215, price = 2000}, -- Dwarven Ring
	{itemId = 2204, price = 2000}, -- Energy Ring
	{itemId = 2205, price = 900}, -- Life Ring
	{itemId = 2164, price = 5000}, -- Might Ring
	{itemId = 2200, price = 700}, -- Protection Amulet
	{itemId = 2216, price = 2000}, -- Ring of Healing
	{itemId = 2170, price = 100}, -- Silver Amulet
	{itemId = 2161, price = 100}, -- Strange Talisman
	{itemId = 2206, price = 2000}, -- Time Ring
}
local sellList = 
{
	{itemId = 2327, price = 100}, -- Ankh
	{itemId = 2201, price = 100}, -- Dragon Necklace
	{itemId = 2215, price = 100}, -- Dwarven Ring
	{itemId = 2204, price = 100}, -- Energy Ring
	{itemId = 18412, price = 6500}, -- Glacial Rod
	{itemId = 2183, price = 3000}, -- Hailstorm Rod
	{itemId = 2205, price = 50}, -- Life Ring
	{itemId = 2164, price = 250}, -- Might Ring
	{itemId = 2186, price = 200}, -- Moonlight Rod
	{itemId = 18411, price = 6000}, -- Muck Rod
	{itemId = 2194, price = 50}, -- Mysterious Fetish
	{itemId = 2185, price = 1000}, -- Necrotic Rod
	{itemId = 8911, price = 1500}, -- Northwind Rod
	{itemId = 2200, price = 100}, -- Protection Amulet
	{itemId = 2216, price = 100}, -- Ring of Healing
	{itemId = 2170, price = 50}, -- Silver Amulet
	{itemId = 2182, price = 100}, -- Snakebite Rod
	{itemId = 8912, price = 3600}, -- Springsprout Rod
	{itemId = 2161, price = 30}, -- Strange Talisman
	{itemId = 2181, price = 2000}, -- Terra Rod
	{itemId = 2206, price = 100}, -- Time Ring
	{itemId = 8910, price = 4400}, -- Underworld Rod
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