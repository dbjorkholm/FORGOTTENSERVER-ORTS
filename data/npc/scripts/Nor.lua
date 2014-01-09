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

	if(msgcontains(msg, "crystal")) then
		if(getPlayerStorageValue(cid, 121) == 32) then
			npcHandler:say("Ah! You did it! I can't wait to hear the sound... but I will do that in a silent moment. ...", cid)
			npcHandler:say("You helped as much in our research here. As a reward, you may use our astral portal in the upper room from now on. ...", cid)
			npcHandler:say("For just one orichalcum pearl, you can travel between Liberty Bay and Svargrond. Thank you again!", cid)
			talkState[talkUser] = 0
			doPlayerAddItem(cid, 9744, 1)
			setPlayerStorageValue(cid, 121, 33)
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())