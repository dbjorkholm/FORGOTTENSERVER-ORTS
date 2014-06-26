local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end
    
--************************************************************Travel************************************************************************************************************
   
if luaFlags.freeBoats then

	local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Cormaya for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =0, destination = {x=33311, y=31989, z=15} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

else

	local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Cormaya for 160 gold coins?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =160, destination = {x=33311, y=31989, z=15} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
		
end		

local function creatureSayCallback(cid, type, msg)

	local player = Player(cid)

	if msgcontains(msg, 'farmine') then
		if not (isPremium(cid)) then
			npcHandler:say("I'm sorry, but you need a premium account in order to travel onboard our ships.", cid)
			return true
		end
		
		if luaFlags.freeBoats then
			npcHandler:say('Do you seek a ride to Farmine for free?', cid)
		else
			npcHandler:say('Do you seek a ride to Farmine for 210 gold coins?', cid)
		end
		
		npcHandler.topic[cid] = 1
		
	elseif ( npcHandler.topic[cid] == 1 ) then
	
		if msgcontains(msg, 'yes') then
			if not luaFlags.freeBoats then
				if not player:removeMoney(210) then
					npcHandler:say('You don\'t have enough money.', cid)
					npcHandler.topic[cid] = 0
					return true
				end	
			end
			
			--if nothing done Stage 1( default )
			local _floor = 14
			
			if ( player:getStorageValue(Storage.TheNewFrontier.Mission05) == 7 ) then --if The New Frontier Quest "Mission 05: Getting Things Busy" complete then Stage 3
				_floor = 10
			elseif ( player:getStorageValue(Storage.TheNewFrontier.Mission03) == 3 ) then --if The New Frontier Quest "Mission 03: Strangers in the Night" complete then Stage 2
				_floor = 12	
			end
			
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x=33025, y=31553, z=_floor})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)			

		elseif msgcontains(msg, 'no') then
			npcHandler:say('You shouldn\'t miss the experience.', cid)
			npcHandler.topic[cid] = 0
		end
	end
	
	return true
end      

--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
