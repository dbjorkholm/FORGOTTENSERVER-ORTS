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
			Npc():say("Passage to Cormaya! Unforgettable steamboat ride!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local cormayaPos = Position(33311, 31989, 15)

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'farmine') then
		npcHandler:say('Do you seek a ride to Farmine for 210 gold coins?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			if player:removeMoney(210) then
				if player:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then --if The New Frontier Quest "Mission 05: Getting Things Busy" complete then Stage 3
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(Position(33025, 31553, 10))
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					npcHandler:say('Set the sails!', cid)
					npcHandler.topic[cid] = 0
					return true
				elseif player:getStorageValue(Storage.TheNewFrontier.Mission03) == 3 then --if The New Frontier Quest "Mission 03: Strangers in the Night" complete then Stage 2
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(Position(33025, 31553, 12))
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					npcHandler:say('Set the sails!', cid)
					npcHandler.topic[cid] = 0
					return true
				else --if nothing done Stage 1
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(Position(33025, 31553, 14))
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					npcHandler:say('Set the sails!', cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say('You don\'t have enough money.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:removeMoney(160) then
				if player:getStorageValue(Storage.postman.Mission01) == 4 then
					player:setStorageValue(Storage.postman.Mission01, 5)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(cormayaPos)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					npcHandler:say('Set the sails!', cid)
					npcHandler.topic[cid] = 0
				else
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo(cormayaPos)
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					npcHandler:say('Set the sails!', cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say('You don\'t have enough money.', cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif  msgcontains(msg, 'no') then
			npcHandler:say('You shouldn\'t miss the experience.', cid)
			npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'cormaya') then
		npcHandler:say('Do you seek a ride to Cormaya for 160 gold coins?', cid)
		npcHandler.topic[cid] = 2
	end
	-- WAGON TICKET
	if msgcontains(msg, "ticket") then
		if player:getStorageValue(Storage.wagonTicket) < os.time() then
			npcHandler:say("Do you want to purchase a weekly ticket for the ore wagons? With it you can travel freely and swiftly through Kazordoon for one week. 250 gold only. Deal?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("Your weekly ticket is still valid. Would be a waste of money to purchase a second one", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getMoney() >= 250 then
				player:removeMoney(250)
				player:setStorageValue(Storage.wagonTicket, os.time() + 7 * 24 * 60 * 60)
				npcHandler:say("Here is your stamp. It can't be transferred to another person and will last one week from now. You'll get notified upon using an ore wagon when it isn't valid anymore.", cid)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 1 then 
		if msgcontains(msg, "no") then 
			npcHandler:say("No then.", cid)	
			npcHandler.topic[cid] = 0
		end
		-- WAGON TICKET
	end
	return true
end

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want me take you to {Cormaya} or {Farmine}?"})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome, |PLAYERNAME|! May earth protect you on the rocky grounds. If you need a {passage}, I can help you.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye then.")
npcHandler:addModule(FocusModule:new())
