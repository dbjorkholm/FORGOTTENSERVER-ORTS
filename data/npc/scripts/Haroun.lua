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
		{name = 'Axe Ring',				id = 2208,			sell = 100,			buy = 500},
		{name = 'Club Ring',			id = 2209,			sell = 100,			buy = 500},
		{name = 'Power Ring',			id = 2166,			sell = 50,			buy = 100},
		{name = 'Stealth Ring',			id = 2165,			sell = 200,			buy = 5000},
		{name = 'Sword Ring',			id = 2207,			sell = 100,			buy = 500},
		{name = 'Bronze Amulet',		id = 2172,			sell = 50,			buy = 100},
		{name = 'Garlic Necklace',		id = 2199,			sell = 50,			buy = 100},
		{name = 'elven Amulet',			id = 2198,			sell = 100,			buy = 500},
		{name = 'Stone Skin Amulet',	id = 2197,			sell = 500,			buy = 5000},
		{name = 'Wand of Cosmic Energy',id = 2189,			sell = 2000,		buy = 0},
		{name = 'Wand of Decay',		id = 2188,			sell = 1000,		buy = 0},
		{name = 'Wand of Defiance',		id = 18390,			sell = 6500,		buy = 0},
		{name = 'Wand of Everblazing',	id = 18409,			sell = 6000,		buy = 0},
		{name = 'Wand of Dragonbreath',	id = 2191,			sell = 200,			buy = 0},
		{name = 'Wand of Inferno',		id = 2187,			sell = 3000,		buy = 0},
		{name = 'Wand of Vortex',		id = 2190,			sell = 100,			buy = 0},
		{name = 'Wand of Draconia',		id = 8921,			sell = 1500,		buy = 0},
		{name = 'Wand of Starstorm',	id = 8920,			sell = 3600,		buy = 0},
		{name = 'Wand of Voodoo',		id = 8922,			sell = 4400,		buy = 0},
		{name = 'Magic Light Wand',		id = 2162,			sell = 35,			buy = 120},
		{name = 'Life Crystal',			id = 4851,			sell = 50,			buy = 0},
		{name = 'Mind Stone',			id = 2178,			sell = 100,			buy = 0},
		{name = 'Orb',					id = 7493,			sell = 750,			buy = 0}
	}
return list
end

function creatureSayCallback(cid, type, msg)

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(not npcHandler:isFocused(cid)) then
			return false
	end	
		
	if isInArray({"enchanted chicken wind", "boots of haste"}, msg:lower()) then
        npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wind?', cid)
        talk_state = 1 
	elseif isInArray({"warrior Sweat", "warrior helmet"}, msg:lower()) then
        npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', cid)
        talk_state = 2 
	elseif isInArray({"fighting Spirit", "royal helmet"}, msg:lower()) then
        npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', cid)       
        talk_state = 3
	elseif isInArray({"magic sulphur", "fire sword"}, msg:lower()) then
        npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', cid) 
        talk_state = 4
	elseif isInArray({"job", "items"}, msg:lower()) then
        npcHandler:say('I trade Enchanted Chicken Wind  for Boots of Haste ,Warrior Sweat for 4 Warrior Helmets ,Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', cid)
		talk_state = 0
		
	elseif msgcontains(msg,'yes') and talk_state <= 4 and talk_state >= 1 then
	
		local trade = {
				{NeedItem = 2195, Ncount = 1, GiveItem = 5891, Gcount = 1}, -- Enchanted Chicken Wing
				{NeedItem = 2475, Ncount = 4, GiveItem = 5885, Gcount = 1}, -- Flask of Warrior's Sweat
				{NeedItem = 2498, Ncount = 2, GiveItem = 5884, Gcount = 1}, -- Spirit Container
				{NeedItem = 2392, Ncount = 3, GiveItem = 5904, Gcount = 1}, -- Magic Sulphur
				}

        if getPlayerItemCount(cid,trade[talk_state].NeedItem) >= trade[talk_state].Ncount then
			doPlayerRemoveItem(cid, trade[talk_state].NeedItem, trade[talk_state].Ncount)
			doPlayerAddItem(cid, trade[talk_state].GiveItem, trade[talk_state].Gcount)
			return npcHandler:say(msg,'Here you are')						
        else
            npcHandler:say('Sorry but you don\'t have the item', cid)
        end
 
	elseif msgcontains(msg,'no') and (talk_state >= 1 and talk_state <= 5) then
		 npcHandler:say(msg,'Ok then', cid)
		 talk_state = 0
		 npcHandler:releaseFocus(cid)
	end
	return true
end

local function onTradeRequest(cid)
	if(getPlayerStorageValue(cid, BlueDjinn.MissionEnd) >= 4 or BlueDjinn.NeedMission ~= true) then
		local items = setNewTradeTable(sendTable(cid, getTable(), BlueDjinn.MissionEnd, BlueDjinn.WithoutMissionPrice, 4))
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
		
		openShopWindow(cid, sendTable(cid, getTable(), BlueDjinn.MissionEnd, BlueDjinn.WithoutMissionPrice, 4), onBuy, onSell)
		return npcHandler:say('It\'s my offer.', cid)	
		
	else
		npcHandler:say("I don't trade with not recognized traders.", cid)
		return false
	end
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())