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

	if(msgcontains(msg, "wooden stake")) then
		if(getPlayerStorageValue(cid, 87) == 11) then
			if(getPlayerItemCount(cid, 5941) >= 1) then
				npcHandler:say("Yes, I was informed what to do. Are you prepared to receive my line of the prayer?", cid)
				talkState[talkUser] = 1
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			if(getPlayerItemCount(cid, 5941) >= 1) then
				setPlayerStorageValue(cid, 87, 12)
				npcHandler:say("So receive my prayer: 'Your mind shall be a vessel for joy, light and wisdom' - uh, wow, something happened. Well, I guess that's it, but next time if you need some mumbo jumbo rather go to Chondur.", cid)
				doPlayerRemoveItem(cid, 5941, 1)
				doPlayerAddItem(cid, 5942, 1)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())