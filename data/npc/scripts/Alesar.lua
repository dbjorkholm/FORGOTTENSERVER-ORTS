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
local list = {
	{id = 2532,		buy = 5000,		sell = 900,		name='Ancient Shield'},
	{id = 2489,		buy = 1500,		sell = 400,		name='Dark Armor'},
	{id = 2490,		buy = 1000,		sell = 250,		name='Dark Helmet'},
	{id = 2396,		buy = 5000,		sell = 0,		name='Ice Rapier'},
	{id = 2409,		buy = 6000,		sell = 900,		name='Serpent Sword'},
	{id = 2529,		buy = 0,		sell = 800,		name='Black Shield'},
	{id = 7428,		buy = 0,		sell = 10000,	name='Bonebreaker'},
	{id = 2434,		buy = 0,		sell = 2000,	name='Dragon Hammer'},
	{id = 7419,		buy = 0,		sell = 15000,	name='Dreaded Cleaver'},
	{id = 7860,		buy = 0,		sell = 2000,	name='Earth Knight Axe'},
	{id = 7875,		buy = 0,		sell = 2000,	name='Energy Knight Axe'},
	{id = 7750,		buy = 0,		sell = 2000,	name='Fiery Knight Axe'},
	{id = 2393,		buy = 0,		sell = 17000,	name='Giant Sword'},
	{id = 7407,		buy = 0,		sell = 8000,	name='Haunted Blade'},
	{id = 7769,		buy = 0,		sell = 2000,	name='Icy Knight Axe'},
	{id = 2476,		buy = 0,		sell = 5000,	name='Knight Armor'},
	{id = 2430,		buy = 0,		sell = 2000,	name='Knight Axe'},
	{id = 2477,		buy = 0,		sell = 5000,	name='Knight Legs'},
	{id = 2663,		buy = 0,		sell = 150,		name='Mystic Turban'},
	{id = 7421,		buy = 0,		sell = 22000,	name='Onyx Flail'},
	{id = 7411,		buy = 0,		sell = 20000,	name='Ornamented Axe'},
	{id = 2411,		buy = 0,		sell = 50,		name='Poison Dagger'},
	{id = 2436,		buy = 0,		sell = 6000,	name='Skull Staff'},
	{id = 2479,		buy = 0,		sell = 500,		name='Strange Helmet'},
	{id = 7413,		buy = 0,		sell = 4000,	name='Titan Axe'},
	{id = 2528,		buy = 0,		sell = 8000,	name='Tower Shield'},
	{id = 2534,		buy = 0,		sell = 15000,	name='Vampire Shield'},
	{id = 2475,		buy = 0,		sell = 5000,	name='Warrior Helmet'}
}
return list
end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	-- GREET
	if(msg == "DJANNI'HAH") then
		if(getPlayerStorageValue(cid, 80) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, 82) < 1) then
				npcHandler:say("What do you want from me, " .. getCreatureName(cid) .."?", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	-- Mission 2 - The Tear of Daraman
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 81) == 5) then
			npcHandler:say({"So Baa'leal thinks you are up to do a mission for us? ...", "I think he is getting old, entrusting human scum such as you are with an important mission like that. ...", "Personally, I don't understand why you haven't been slaughtered right at the gates. ...", "Anyway. Are you prepared to embark on a dangerous mission for us?"}, cid, 0, 1, 3500)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 81) == 7) then
			npcHandler:say("Did you find the tear of Daraman?", cid)
			talkState[talkUser] = 2
		end
	-- Mission 2 - The Tear of Daraman
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say({"All right then, human. Have you ever heard of the {'Tears of Daraman'}? ...", "They are precious gemstones made of some unknown blue mineral and possess enormous magical power. ...", "If you want to learn more about these gemstones don't forget to visit our library. ...", "Anyway, one of them is enough to create thousands of our mighty djinn blades. ...", "Unfortunately my last gemstone broke and therefore I'm not able to create new blades anymore. ...", "To my knowledge there is only one place where you can find these gemstones - I know for a fact that the Marid have at least one of them. ...", "Well... to cut a long story short, your mission is to sneak into Ashta'daramai and to steal it. ...", "Needless to say, the Marid won't be too eager to part with it. Try not to get killed until you have delivered the stone to me."}, cid, 0, 1, 4500)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 81, 6)
		elseif(talkState[talkUser] == 2) then
			if(doPlayerRemoveItem(cid, 2346, 1)) then
				npcHandler:say({"So you have made it? You have really managed to steal a Tear of Daraman? ...", "Amazing how you humans are just impossible to get rid of. Incidentally, you have this character trait in common with many insects and with other vermin. ...", "Nevermind. I hate to say it, but it you have done us a favour, human. That gemstone will serve us well. ...", "Baa'leal, wants you to talk to Malor concerning some new mission. ...", "Looks like you have managed to extended your life expectancy - for just a bit longer."}, cid, 0, 1, 4000)
				talkState[talkUser] = 0
				setPlayerStorageValue(cid, 81, 8)
			end
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Finally.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end

local function onTradeRequest(cid)
	if(getPlayerStorageValue(cid, 81) >= 12 or GreenDjinn.NeedMission ~= true) then
		local items = {}
		items = setNewTradeTable(sendTable(cid, getTable(), GreenDjinn.MissionEnd, GreenDjinn.WithoutMissionPrice))
		local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
			if (ignoreCap == false and (getPlayerFreeCap(cid) < getItemWeight(items[item].itemId, amount) or inBackpacks and getPlayerFreeCap(cid) < (getItemWeight(items[item].itemId, amount) + getItemWeight(1988, 1)))) then
				return doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, 'You don\'t have enough cap.')
			end
			if items[item].buyPrice <= getPlayerMoney(cid) then
				if inBackpacks then
					broadcastMessage("",4)
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
				doPlayerAddMoney(cid, items[item].sellPrice * amount)
				doPlayerRemoveItem(cid, items[item].itemId, amount)
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
			end
			return true
		end
		openShopWindow(cid, sendTable(cid, getTable(), GreenDjinn.MissionEnd, GreenDjinn.WithoutMissionPrice), onBuy, onSell)
		return npcHandler:say('It\'s my offer.', cid)	
	end
end
 
npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)