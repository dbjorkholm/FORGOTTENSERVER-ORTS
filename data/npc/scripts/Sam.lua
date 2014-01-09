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
 
	if(msgcontains(msg, "old backpack")) then
		if(getPlayerStorageValue(cid, 330) < 1) then
			npcHandler:say("What? Are you telling me you found my old adventurer's backpack that I lost years ago??", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			if(getPlayerItemCount(cid, 3960) >= 1) then
				npcHandler:say("Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend Kroox to provide you a special dwarven armor. ... Sam: I will mail him about you immediately. Just tell him, his old buddy Sam is sending you. ", cid)
				setPlayerStorageValue(cid, 330, 1)
				doPlayerRemoveItem(cid, 3960, 1)
			else
				npcHandler:say("You don't have it...", cid)
			end
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "no")) then
		if(talkState[talkUser] > 0) then
			npcHandler:say("Then no.", cid)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())