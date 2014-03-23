dofile('data/lib/MissionSelect.lua')
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
	if(getPlayerStorageValue(cid, BlueDjinn.MissionEnd) >= 1 or BlueDjinn.NeedMission ~= true) then
		local items = setNewTradeTable(sendTable(cid, getTable(), BlueDjinn.MissionEnd, BlueDjinn.WithoutMissionPrice))
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
		
		openShopWindow(cid, sendTable(cid, getTable(), BlueDjinn.MissionEnd, BlueDjinn.WithoutMissionPrice), onBuy, onSell)
		return npcHandler:say('It\'s my offer.', cid)	
		
	else
		npcHandler:say("I don't trade with not recognized traders.", cid)
		return false
	end
end
 
npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())