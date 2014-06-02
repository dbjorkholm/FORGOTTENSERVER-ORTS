local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Cormaya for 160 gold coins?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =160, destination = {x=33311, y=31989, z=15} })
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
				if player:getStorageValue(12135) == 7 then --if The New Frontier Quest "Mission 05: Getting Things Busy" complete then Stage 3
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					player:teleportTo({x=33025, y=31553, z=10})
					player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					return true
				elseif player:getStorageValue(12133) == 3 then --if The New Frontier Quest "Mission 03: Strangers in the Night" complete then Stage 2
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
	return true
end      

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
