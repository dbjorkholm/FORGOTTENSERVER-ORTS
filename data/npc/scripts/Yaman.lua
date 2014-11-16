local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function getTable()
	local list = {
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
		{id = 2327,		buy = 0,		sell = 100,		name = 'Ankh'},
		{id = 18412,	buy = 0,		sell = 6500,	name = 'Glacial Rod'},
		{id = 2183,		buy = 0,		sell = 3000,	name = 'Hailstorm Rod'},
		{id = 2186,		buy = 0,		sell = 200,		name = 'Moonlight Rod'},
		{id = 18411,	buy = 0,		sell = 6000,	name = 'Muck Rod'},
		{id = 2194,		buy = 0,		sell = 50,		name = 'Mysterious Fetish'},
		{id = 2185,		buy = 0,		sell = 1000,	name = 'Necrotic Rod'},
		{id = 8911,		buy = 0,		sell = 1500,	name = 'Northwind Rod'},
		{id = 2182,		buy = 0,		sell = 100,		name = 'Snakebite Rod'},
		{id = 8912,		buy = 0,		sell = 3600,	name = 'Springsprout Rod'},
		{id = 2181,		buy = 0,		sell = 2000,	name = 'Terra Rod'},
		{id = 8910,		buy = 0,		sell = 4400,	name = 'Underworld Rod'}
	}

	return list
end

local function greetCallback(cid, message)
	if not msgcontains(message, 'djanni\'hah') and Player(cid):getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) < 3 then
		return false
	end

	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if isInArray({"enchanted chicken wing", "boots of haste"}, msg) then
		npcHandler:say('Do you want to trade Boots of haste for Enchanted Chicken Wing?', cid)
		npcHandler.topic[cid] = 1
	elseif isInArray({"warrior Sweat", "warrior helmet"}, msg) then
		npcHandler:say('Do you want to trade 4 Warrior Helmet for Warrior Sweat?', cid)
		npcHandler.topic[cid] = 2
	elseif isInArray({"fighting Spirit", "royal helmet"}, msg) then
		npcHandler:say('Do you want to trade 2 Royal Helmet for Fighting Spirit', cid)
		npcHandler.topic[cid] = 3
	elseif isInArray({"magic sulphur", "fire sword"}, msg) then
		npcHandler:say('Do you want to trade 3 Fire Sword for Magic Sulphur', cid)
		npcHandler.topic[cid] = 4
	elseif isInArray({"job", "items"}, msg) then
		npcHandler:say('I trade Enchanted Chicken Wing for Boots of Haste, Warrior Sweat for 4 Warrior Helmets, Fighting Spirit for 2 Royal Helmet Magic Sulphur for 3 Fire Swords', cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'cookie') then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) == 31
				and player:getStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.Djinn) ~= 1 then
			npcHandler:say('You brought cookies! How nice of you! Can I have one?', cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg,'yes') then
		if npcHandler.topic[cid] >= 1 and npcHandler.topic[cid] <= 4 then
			local trade = {
					{ NeedItem = 2195, Ncount = 1, GiveItem = 5891, Gcount = 1}, -- Enchanted Chicken Wing
					{ NeedItem = 2475, Ncount = 4, GiveItem = 5885, Gcount = 1}, -- Flask of Warrior's Sweat
					{ NeedItem = 2498, Ncount = 2, GiveItem = 5884, Gcount = 1}, -- Spirit Container
					{ NeedItem = 2392, Ncount = 3, GiveItem = 5904, Gcount = 1}  -- Magic Sulphur
			}

			if player:getItemCount(trade[npcHandler.topic[cid]].NeedItem) >= trade[npcHandler.topic[cid]].Ncount then
				player:removeItem(trade[npcHandler.topic[cid]].NeedItem, trade[npcHandler.topic[cid]].Ncount)
				player:addItem(trade[npcHandler.topic[cid]].GiveItem, trade[npcHandler.topic[cid]].Gcount)
				return npcHandler:say('Here you are.', cid)
			else
				npcHandler:say('Sorry but you don\'t have the item.', cid)
			end
		elseif npcHandler.topic[cid] == 5 then
			if not player:removeItem(8111, 1) then
				npcHandler:say('You have no cookie that I\'d like.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:setStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.Djinn, 1)
			if player:getCookiesDelivered() == 10 then
				player:addAchievement('Allow Cookies?')
			end

			Npc():getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			npcHandler:say('You see, good deeds like this will ... YOU ... YOU SPAWN OF EVIL! I WILL MAKE SURE THE MASTER LEARNS ABOUT THIS!', cid)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		end
	elseif msgcontains(msg,'no') then
		if npcHandler.topic[cid] >= 1 and npcHandler.topic[cid] <= 4 then
			npcHandler:say('Ok then.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then
			npcHandler:say('I see.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

local function onTradeRequest(cid)
	TradeRequest(cid, Npc(), getTable(), GreenDjinn, 4)
end

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, human |PLAYERNAME|. How can a humble djinn be of service?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, human.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, human.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hi')
focusModule:addGreetMessage('hello')
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)
