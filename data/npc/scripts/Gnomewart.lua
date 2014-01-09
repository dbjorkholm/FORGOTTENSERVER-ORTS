local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()
	npcHandler:onThink()					
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "endurance")) then
		if(getPlayerStorageValue(cid, 900) == 9) then
			npcHandler:say("Ah, the test is a piece of mushroomcake! Just take the teleporter over there in the south and follow the hallway. ... ", cid)
			npcHandler:say("You'll need to run quite a bit. It is important that you don't give up! Just keep running and running and running and ... I guess you got the idea. ... ", cid)
			npcHandler:say("At the end of the hallway you'll find a teleporter. Step on it and you are done! I'm sure you'll do a true gnomerun! Afterwards talk to me. ", cid)
			setPlayerStorageValue(cid, 900, 10)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 900) == 11) then
			npcHandler:say("You have passed the test and are ready to create your soul melody. Talk to Gnomelvis in the east about it. ", cid)
			setPlayerStorageValue(cid, 900, 12)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())