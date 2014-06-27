local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

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
		{name = 'Orb',					id = 2176,			sell = 750,			buy = 0}
	}
return list
end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
			return false
	end	
		
	if isInArray({"enchanted chicken wing", "boots of haste"}, msg:lower()) then
        npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wing?', cid)
        npcHandler.topic[cid] = 1 
	elseif isInArray({"warrior Sweat", "warrior helmet"}, msg:lower()) then
        npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', cid)
        npcHandler.topic[cid] = 2 
	elseif isInArray({"fighting Spirit", "royal helmet"}, msg:lower()) then
        npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', cid)       
        npcHandler.topic[cid] = 3
	elseif isInArray({"magic sulphur", "fire sword"}, msg:lower()) then
        npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', cid) 
        npcHandler.topic[cid] = 4
	elseif isInArray({"job", "items"}, msg:lower()) then
        npcHandler:say('I trade Enchanted Chicken Wing for Boots of Haste, Warrior Sweat for 4 Warrior Helmets, Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', cid)
		npcHandler.topic[cid] = 0
		
	elseif msgcontains(msg,'yes') and npcHandler.topic[cid] <= 4 and npcHandler.topic[cid] >= 1 then
	
		local trade = {
				{NeedItem = 2195, Ncount = 1, GiveItem = 5891, Gcount = 1}, -- Enchanted Chicken Wing
				{NeedItem = 2475, Ncount = 4, GiveItem = 5885, Gcount = 1}, -- Flask of Warrior's Sweat
				{NeedItem = 2498, Ncount = 2, GiveItem = 5884, Gcount = 1}, -- Spirit Container
				{NeedItem = 2392, Ncount = 3, GiveItem = 5904, Gcount = 1}, -- Magic Sulphur
				}

        if player:getItemCount(trade[npcHandler.topic[cid]].NeedItem) >= trade[npcHandler.topic[cid]].Ncount then
			player:removeItem(trade[npcHandler.topic[cid]].NeedItem, trade[npcHandler.topic[cid]].Ncount)
			player:addItem(trade[npcHandler.topic[cid]].GiveItem, trade[npcHandler.topic[cid]].Gcount)
			return npcHandler:say(msg,'Here you are')						
        else
            npcHandler:say('Sorry but you don\'t have the item', player)
        end
 
	elseif msgcontains(msg,'no') and (npcHandler.topic[cid] >= 1 and npcHandler.topic[cid] <= 5) then
		 npcHandler:say(msg,'Ok then', player)
		 npcHandler.topic[cid] = 0
		 npcHandler:releaseFocus(cid)
	end
	return true
end

local function onTradeRequest(cid)
	TradeRequest(cid, npcHandler, getTable(), BlueDjinn, 4)
end

npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
