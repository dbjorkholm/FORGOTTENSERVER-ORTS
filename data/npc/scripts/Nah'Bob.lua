local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

local function getTable()
	local list = 
	{
		{id = 7436,		sell = 5000,		buy = 0,		name = 'Angelic Axe'},
		{id = 2656,		sell = 10000,		buy = 0,		name = 'Blue Robe'},
		{id = 2518,		sell = 1200,		buy = 7000,		name = 'Bonelord Shield'},
		{id = 2195,		sell = 30000,		buy = 0,		name = 'Boots of Haste'},
		{id = 2413,		sell = 500,			buy = 0,		name = 'Broadsword'},
		{id = 7412,		sell = 18000,		buy = 0,		name = 'Butcher\'s Axe'},
		{id = 2487,		sell = 12000,		buy = 0,		name = 'Crown Armor'},
		{id = 2491,		sell = 2500,		buy = 0,		name = 'Crown Helmet'},
		{id = 2488,		sell = 12000,		buy = 0,		name = 'Crown Legs'},
		{id = 2519,		sell = 8000,		buy = 0,		name = 'Crown Shield'},
		{id = 2497,		sell = 6000,		buy = 0,		name = 'Crusader Helmet'},
		{id = 2414,		sell = 9000,		buy = 0,		name = 'Dragon Lance'},
		{id = 2516,		sell = 4000,		buy = 0,		name = 'Dragon Shield'},
		{id = 7854,		sell = 1000,		buy = 0,		name = 'Earth Spike Sword'},
		{id = 7868,		sell = 1200,		buy = 0,		name = 'Earth War Hammer'},
		{id = 7869,		sell = 1000,		buy = 0,		name = 'Energy Spike Sword'},
		{id = 7883,		sell = 1200,		buy = 0,		name = 'Energy War Hammer'},
		{id = 7744,		sell = 1000,		buy = 0,		name = 'Fiery Spike Sword'},
		{id = 7758,		sell = 1200,		buy = 0,		name = 'Fiery War Hammer'},
		{id = 2432,		sell = 8000,		buy = 0,		name = 'Fire Axe'},
		{id = 2392,		sell = 4000,		buy = 0,		name = 'Fire Sword'},
		{id = 7454,		sell = 3000,		buy = 0,		name = 'Glorious Axe'},
		{id = 2515,		sell = 2000,		buy = 0,		name = 'Guardian Shield'},
		{id = 2396,		sell = 1000,		buy = 0,		name = 'Ice Rapier'},
		{id = 7763,		sell = 1000,		buy = 0,		name = 'Icy Spike Sword'},
		{id = 7777,		sell = 1200,		buy = 0,		name = 'Icy War Hammer'},
		{id = 2486,		sell = 900,			buy = 8000,		name = 'Noble Armor'},
		{id = 2425,		sell = 500,			buy = 3000,		name = 'Obsidian Lance'},
		{id = 2539,		sell = 16000,		buy = 0,		name = 'Phoenix Shield'},
		{id = 7410,		sell = 20000,		buy = 0,		name = 'Queen\'s Sceptre'},
		{id = 2498,		sell = 30000,		buy = 0,		name = 'Royal Helmet'},
		{id = 7451,		sell = 10000,		buy = 0,		name = 'Shadow Sceptre'},
		{id = 2383,		sell = 1000,		buy = 8000,		name = 'Spike Sword'},
		{id = 7391,		sell = 16000,		buy = 0,		name = 'Thaian Sword'},
		{id = 2391,		sell = 1200,		buy = 10000,	name = 'War Hammer'}
	}
return list
end

function creatureSayCallback(cid, type, msg)

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid	
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	return true
end

local function onTradeRequest(cid)
	TradeRequest(cid, npcHandler, getTable(), BlueDjinn, 4)
end
 
npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())