local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local creatures = { 'Slime', 'Slime', 'Slime', 'Orc Warlord', 'Orc Warlord', 'Orc Leader', 'Orc Leader', 'Orc Leader' }
local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.OrcKingGreeting) ~= 1 then
		player:setStorageValue(Storage.OrcKingGreeting, 1)
		for i = 1, #creatures do
			Game.createMonster(creatures[i], Npc():getPosition())
		end
		npcHandler:say('Arrrrgh! A dirty paleskin! To me my children! Kill them my guards!', TALKTYPE_SAY)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Harrrrk! You think you are strong now? You shall never escape my wrath! I am immortal!')
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local efreetMission3, maridMission3 = player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03), player:getStorageValue(Storage.DjinnWar.MaridFaction.Mission03)
	-- Mission 3 - Orc Fortress
	if msgcontains(msg, 'lamp') then
		if player:getStorageValue(Storage.DjinnWar.RecievedLamp) ~= 1
				and (efreetMission3 == 1 or maridMission3 == 1) then
			npcHandler:say({
				'I can sense your evil intentions to imprison a djinn! You are longing for the lamp, which I still possess. ...',
				'Who do you want to trap in this cursed lamp?'
			}, cid)
			npcHandler.topic[cid] = 1
		end

	elseif msgcontains(msg, 'cookie') then
		if player:getStorageValue(Storage.WhatAFoolishQuest.Questline) == 31 and player:getStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.OrcKing) ~= 1 then
			npcHandler:say('You bring me a stinking cookie???', cid)
			npcHandler.topic[cid] = 2
		end

	-- Mission 3 - Orc Fortress
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'malor') then
			if efreetMission3 == 1 then
				player:setStorageValue(Storage.DjinnWar.EfreetFaction.DoorToLamp, 1)

			elseif maridMission3 == 1 then
				player:setStorageValue(Storage.DjinnWar.MaridFaction.DoorToLamp, 1)
			end

			player:setStorageValue(Storage.DjinnWar.RecievedLamp, 1)
			player:addItem(2344, 1)
			npcHandler:say('I was waiting for this day! Take the lamp and let Malor feel my wrath!', cid)
		else
			npcHandler:say('I don\'t know your enemy, paleskin! Begone!', cid)
		end
		npcHandler.topic[cid] = 0

	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			if not player:removeItem(8111, 1) then
				npcHandler:say('You have no cookie that I\'d like.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			player:setStorageValue(Storage.WhatAFoolishQuest.CookieDelivery.OrcKing, 1)
			if player:getCookiesDelivered() == 10 then
				player:addAchievement('Allow Cookies?')
			end

			Npc():getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			npcHandler:say('Well, I hope it stinks a lot. I like stinking cookies best ... BY MY THOUSAND SONS! YOU ARE SO DEAD HUMAN! DEAD!', cid)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)

		elseif msgcontains(msg, 'no') then
			npcHandler:say('I see.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())