local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end
    
--************************************************************Travel************************************************************************************************************
 

local function creatureSayCallback(cid, type, msg)

	local player = Player( cid )
	
	if(msgcontains(msg, "monument tower")) then
		if luaFlags.freeBoats then
			npcHandler:say("Do you want to travel to the {monument tower} for free?", cid)
		else
			npcHandler:say("Do you want to travel to the {monument tower} for a 50 gold fee?", cid)
		end
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if not luaFlags.freeBoats then
				if not player:removeMoney( 50 ) then
					npcHandler:say("You don't have enought money.", cid)
					npcHandler.topic[cid] = 0
					return true
				end	
			end		

			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32940, y = 31182, z = 7})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)		
		
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

--***********************************************************Modules and Callbacks*******************************************************************************************************


npcHandler:setMessage(MESSAGE_GREET, "Can I interest you in a trip to the {monument tower}?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())