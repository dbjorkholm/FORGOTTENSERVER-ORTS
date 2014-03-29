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
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msg == "DJANNI'HAH" or (getPlayerStorageValue(cid,GreenDjinn.MissionEnd) >= 3 and msg == "hi")) then
		npcHandler:addFocus(cid)
		npcHandler:say("Be greeted, human " .. getPlayerName(cid) .. ". How can a humble djinn be of service?", cid)
	end
	
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Finally.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	
	return true
end

local function onTradeRequest(cid)
	if(getPlayerStorageValue(cid, GreenDjinn.MissionEnd) >= 4 or GreenDjinn.NeedMission ~= true) then

		local items = setNewTradeTable(sendTable(cid, getTable(), GreenDjinn.MissionEnd, GreenDjinn.WithoutMissionPrice, 4))
		
		function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
			if (ignoreCap == false and (getPlayerFreeCap(cid) < getItemWeight(items[item].itemId, amount) or inBackpacks and getPlayerFreeCap(cid) < (getItemWeight(items[item].itemId, amount) + getItemWeight(1988, 1)))) then
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You don\'t have enough cap.')
			end
			if items[item].buyPrice <= getPlayerMoney(cid) then
				if inBackpacks then
					local itembp = doCreateItemEx(1988, 1)
					local bp = doPlayerAddItemEx(cid, itembp)
					if(bp ~= 1) then
						return doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You don\'t have enough container.')	
					end
					doAddContainerItem(itembp, items[item].itemId, amount)	
				else
					return 
					doPlayerAddItem(cid, items[item].itemId, amount, false) and
					doPlayerRemoveMoney(cid, amount * items[item].buyPrice) and
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
				end
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
				doPlayerRemoveMoney(cid, amount * items[item].buyPrice)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You do not have enough money.')
			end
			return true
			end
			 
		local function onSell(cid, item, subType, amount, ignoreCap, inBackpacks)
			if items[item].sellPrice then
				return 
				doPlayerRemoveItem(cid, items[item].itemId, amount) and
				doPlayerAddMoney(cid, items[item].sellPrice * amount) and
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
			end
			return true
		end
		openShopWindow(cid, sendTable(cid, getTable(), GreenDjinn.MissionEnd, GreenDjinn.WithoutMissionPrice, 4), onBuy, onSell)
		return npcHandler:say('It\'s my offer.', cid)	
	end
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)