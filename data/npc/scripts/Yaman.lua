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
		{id = 2201,		buy = 1000,		sell = 100,		name = 'Dragon Necklace'},
		{id = 2213,		buy = 2000,		sell = 100,		name = 'Dwarven Ring'},
		{id = 2167,		buy = 2000,		sell = 100,		name = 'Energy Ring'},
		{id = 2168,		buy = 900,		sell = 50,		name = 'Life Ring'},
		{id = 2164,		buy = 5000,		sell = 250,		name = 'Might Ring'},
		{id = 2200,		buy = 700,		sell = 100,		name = 'Protection Amulet'},
		{id = 2216,		buy = 2000,		sell = 100,		name = 'Ring of Healing'},
		{id = 2170,		buy = 100,		sell = 50,		name = 'Silver Amulet'},
		{id = 2161,		buy = 100,		sell = 30,		name = 'Strange Talisman'},
		{id = 2169,		buy = 2000,		sell = 100,		name = 'Time Ring'},
		{id = 2327,		buy = 0,		sell =  100,	name = 'Ankh'},
		{id = 18412,	buy = 0,		sell =  6500,	name = 'Glacial Rod'},
		{id = 2183,		buy = 0,		sell =  3000,	name = 'Hailstorm Rod'},
		{id = 2186,		buy = 0,		sell =  200,	name = 'Moonlight Rod'},
		{id = 18411,	buy = 0,		sell =  6000,	name = 'Muck Rod'},
		{id = 2194,		buy = 0,		sell =  50,		name = 'Mysterious Fetish'},
		{id = 2185,		buy = 0,		sell =  1000,	name = 'Necrotic Rod'},
		{id = 8911,		buy = 0,		sell =  1500,	name = 'Northwind Rod'},
		{id = 2182,		buy = 0,		sell =  100,	name = 'Snakebite Rod'},
		{id = 8912,		buy = 0,		sell =  3600,	name = 'Springsprout Rod'},
		{id = 2181,		buy = 0,		sell =  2000,	name = 'Terra Rod'},
		{id = 8910,		buy = 0,		sell =  4400,	name = 'Underworld Rod'}
	}
return list
end

function creatureSayCallback(cid, type, msg)
local player = Player(cid)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msg == "DJANNI'HAH" or (player:getStorageValue(GreenDjinn.MissionEnd) >= 3 and msg == "hi")) then
		npcHandler:addFocus(cid)
		npcHandler:say("Be greeted, human " .. player:getName() .. ". How can a humble djinn be of service?", player)
	end
	
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Finally.", player)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	
	return true
end

local function onTradeRequest(cid)
	TradeRequest(cid, npcHandler, getTable(), GreenDjinn, 4)
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)