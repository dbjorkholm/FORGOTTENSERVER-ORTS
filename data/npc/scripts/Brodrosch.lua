local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say('Passage to Cormaya! Unforgettable steamboat ride!', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, 'farmine') then
		npcHandler:say('Do you seek a ride to Farmine for 210 gold coins?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'cormaya') then
		npcHandler:say('Do you seek a ride to Cormaya for 160 gold coins?', cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'ticket') then
		if Player(cid):getStorageValue(Storage.wagonTicket) >= os.time() then
			npcHandler:say('Your weekly ticket is still valid. Would be a waste of money to purchase a second one', cid)
			return true
		end

		npcHandler:say('Do you want to purchase a weekly ticket for the ore wagons? With it you can travel freely and swiftly through Kazordoon for one week. 250 gold only. Deal?', cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] > 0 then
		local player = Player(cid)
		if npcHandler.topic[cid] == 1 then
			if not player:removeMoney(210) then
				npcHandler:say('You don\'t have enough money.', cid)
				return true
			end

			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

			local destination = Position(33025, 31553, 14)
			if player:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then --if The New Frontier Quest 'Mission 05: Getting Things Busy' complete then Stage 3
				destination.z = 10
			elseif player:getStorageValue(Storage.TheNewFrontier.Mission03) == 3 then --if The New Frontier Quest 'Mission 03: Strangers in the Night' complete then Stage 2
				destination.z = 12
			end

			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say('Full steam ahead!', cid)
		elseif npcHandler.topic[cid] == 2 then
			if not player:removeMoney(160) then
				npcHandler:say('You don\'t have enough money.', cid)
				return true
			end

			if player:getStorageValue(Storage.postman.Mission01) == 4 then
				player:setStorageValue(Storage.postman.Mission01, 5)
			end

			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local destination = Position(33311, 31989, 15)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say('Full steam ahead!', cid)
		elseif npcHandler.topic[cid] == 3 then
			if not player:removeMoney(250) then
				npcHandler:say('You don\'t have enough money.', cid)
				return true
			end

			player:setStorageValue(Storage.wagonTicket, os.time() + 7 * 24 * 60 * 60)
			npcHandler:say('Here is your stamp. It can\'t be transferred to another person and will last one week from now. You\'ll get notified upon using an ore wagon when it isn\'t valid anymore.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] > 0 then
		if npcHandler.topic[cid] == 3 then
			npcHandler:say('No then.', cid)
		else
			npcHandler:say('You shouldn\'t miss the experience.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want me take you to {Cormaya} or {Farmine}?'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Welcome, |PLAYERNAME|! May earth protect you on the rocky grounds. If you need a {passage}, I can help you.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')
npcHandler:addModule(FocusModule:new())
