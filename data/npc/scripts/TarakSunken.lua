local keywordHandler = KeywordHandler:new()
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
	
	if(msgcontains(msg, "passage")) then
		npcHandler:say("Do you want to go back to {Yalahar}?", cid)
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then

			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32916, y = 31199, z = 7})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)		
		
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

--***********************************************************Modules and Callbacks*******************************************************************************************************



npcHandler:setMessage(MESSAGE_GREET, "Want to go back to Yalahar? Just ask me for a free {passage}.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())