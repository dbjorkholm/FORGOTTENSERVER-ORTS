local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Darashia on Darama for 40 gold?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 40, destination = {x=33270, y=32441, z=6} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Svargrond for 60 gold?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 60, destination = {x=32253, y=31097, z=4} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'femor hills'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Femor Hills for 60 gold?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 60, destination = {x=32536, y=31837, z=4} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Edron for 60 gold?'})
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 60, destination = {x=33193, y=31784, z=3} })
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, 'farmine') then
		if Player(cid):getStorageValue(Storage.TheNewFrontier.Mission10) ~= 1 then
			npcHandler:say('Never heard about a place like this.', cid)
			return true
		end

		npcHandler:say('Do you seek a ride to Farmine for 60 gold?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'ticket') then
		if Player(cid):getStorageValue(Storage.wagonTicket) >= os.time() then
			npcHandler:say('Your weekly ticket is still valid. Would be a waste of money to purchase a second one', cid)
			return true
		end

		npcHandler:say('Do you want to purchase a weekly ticket for the ore wagons? With it you can travel freely and swiftly through Kazordoon for one week. 250 gold only. Deal?', cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] > 0 then
		local player = Player(cid)
		if npcHandler.topic[cid] == 1 then
			if not player:removeMoney(60) then
				npcHandler:say('You don\'t have enough money.', cid)
				return true
			end

			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local destination = Position(32983, 31539, 1)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say('Set the sails!', cid)
		elseif npcHandler.topic[cid] == 2 then
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

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
