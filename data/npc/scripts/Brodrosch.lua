local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Cormaya for 160 gold coins?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, destination = {x=33311, y=31989, z=15} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'farmine') then
		npcHandler:say('Do you seek a ride to Farmine for 210 gold coins?', cid)
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, 'yes') then
			if player:removeMoney(210) then
				if player:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then --if The New Frontier Quest "Mission 05: Getting Things Busy" complete then Stage 3
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo({x=33025, y=31553, z=10})
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					return true
				elseif player:getStorageValue(Storage.TheNewFrontier.Mission03) == 3 then --if The New Frontier Quest "Mission 03: Strangers in the Night" complete then Stage 2
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo({x=33025, y=31553, z=12})
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					return true
				else --if nothing done Stage 1
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo({x=33025, y=31553, z=14})
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
			else
			npcHandler:say('You don\'t have enough money.', cid)
			npcHandler.topic[cid] = 0
			end
		elseif  msgcontains(msg, 'no') then
			npcHandler:say('You shouldn\'t miss the experience.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	-- WAGON TICKET
	if(msgcontains(msg, "ticket")) then
		if player:getStorageValue(Storage.wagon.Ticket) < os.time() then
			npcHandler:say("Do you want to purchase a weekly ticket for the ore wagons? With it you can travel freely and swiftly through Kazordoon for one week. 250 gold only. Deal?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if player:getMoney() >= 250 then
				player:removeMoney(250)
				player:setStorageValue(Storage.wagon.Ticket, os.time() + 7 * 24 * 60 * 60)
				npcHandler:say("Here is your stamp. It can't be transferred to another person and will last one week from now. You'll get notified upon using an ore wagon when it isn't valid anymore.", cid)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif(npcHandler.topic[cid] == 1) then 
		if(msgcontains(msg, "no")) then 
			npcHandler:say("No then.", cid)	
			npcHandler.topic[cid] = 0
		end
	-- WAGON TICKET
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
