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
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "farmine")) then
		if(getPlayerStorageValue(cid, 1015) == 15) then
			npcHandler:say("Oh yes, that project the whole dwarven community is so excited about. I guess I already know why you are here, but speak up.", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "impress")) then
		if(talkState[talkUser] == 1) then
			if(getPlayerStorageValue(cid, 1024) < 1) then
				npcHandler:say("Your pathetic whimpering amuses me. For this I grant you my assistance. But listen, one day I'll ask you to return this favour. From now on, you owe me one.", cid)
				setPlayerStorageValue(cid, 1024, 1)
			end
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
