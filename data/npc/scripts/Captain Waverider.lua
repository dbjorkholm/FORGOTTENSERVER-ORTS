local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end

keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Treasure Island}?'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})


 --************************************************************Travel************************************************************************************************************
        
 if luaFlags.freeBoats then
	local travelNode = keywordHandler:addKeyword({'treasure island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Treasure Island for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x = 32132, y = 32913, z = 7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

else
	local travelNode = keywordHandler:addKeyword({'treasure island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Treasure Island for 200 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 200, destination = {x = 32132, y = 32913, z = 7} })
        travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

end
		
function creatureSayCallback(cid, type, msg)

	local player = Player( cid )
	
	if (msgcontains(msg, 'peg leg')) then
		if luaFlags.freeBoats then
			npcHandler:say('Do you seek a passage to Meriana?', cid)
			
		else
			npcHandler:say('Do you seek a passage to Meriana for 50 golds?', cid)
		end
		npcHandler.topic[cid] = 1
	elseif (npcHandler.topic[cid] == 1) then
		if (msgcontains(msg, 'yes')) then
			if not luaFlags.freeBoats then
				if not player:removeMoney(50) then
					npcHandler:say('You don\'t have enough money.', cid)
					npcHandler.topic[cid] = 0
					return true
				end				
			end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32348, y = 32625, z = 7})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	
	return true
end      

--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
