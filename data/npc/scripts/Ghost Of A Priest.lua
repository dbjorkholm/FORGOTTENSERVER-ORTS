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
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 1060) == 10) then
			if(getPlayerPosition(cid).z == 12 and getPlayerStorageValue(cid, 1070) < 1) then
				npcHandler:say("Although we are willing to hand this item to you, there is something you have to understand: There is no such thing as 'the' sceptre. ... ", cid)
				npcHandler:say("Those sceptres are created for special purposes each time anew. Therefore you will have to create one on your own. It will be your mission to find us three keepers and to get the three parts of the holy sceptre. ... ", cid)
				npcHandler:say("Then go to the holy altar and create a new one. ", cid)
				talkState[talkUser] = 1
			elseif(talkState[talkUser] == 1) then
				npcHandler:say("Even though we are spirits, we can't create anything out of thin air. You will have to donate some precious metal which we can drain for energy and substance. ... ", cid)
				npcHandler:say("The equivalent of 5000 gold will do. Are you willing to make such a donation? ", cid)
				talkState[talkUser] = 2
			elseif(getPlayerPosition(cid).z == 13 and getPlayerStorageValue(cid, 1071) < 1) then
				npcHandler:say("Even though we are spirits, we can't create anything out of thin air. You will have to donate some precious metal which we can drain for energy and substance. ... ", cid)
				npcHandler:say("The equivalent of 5000 gold will do. Are you willing to make such a donation? ", cid)
				talkState[talkUser] = 3
			elseif(getPlayerPosition(cid).z == 14 and getPlayerStorageValue(cid, 1072) < 1) then
				npcHandler:say("Even though we are spirits, we can't create anything out of thin air. You will have to donate some precious metal which we can drain for energy and substance. ... ", cid)
				npcHandler:say("The equivalent of 5000 gold will do. Are you willing to make such a donation? ", cid)
				talkState[talkUser] = 4
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 2) then
			if(getPlayerMoney(cid) >= 5000) then
				setPlayerStorageValue(cid, 1070, 1)
				doPlayerRemoveMoney(cid, 5000)
				doPlayerAddItem(cid, 12324, 1)
				npcHandler:say("So be it! Here is my part of the sceptre. Combine it with the other parts on the altar of the Great Snake in the depths of this temple. ", cid)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 3) then
			if(getPlayerMoney(cid) >= 5000) then
				setPlayerStorageValue(cid, 1071, 1)
				doPlayerRemoveMoney(cid, 5000)
				doPlayerAddItem(cid, 12325, 1)
				npcHandler:say("So be it! Here is my part of the sceptre. Combine it with the other parts on the altar of the Great Snake in the depths of this temple. ", cid)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 4) then
			if(getPlayerMoney(cid) >= 5000) then
				setPlayerStorageValue(cid, 1072, 1)
				doPlayerRemoveMoney(cid, 5000)
				doPlayerAddItem(cid, 12326, 1)
				npcHandler:say("So be it! Here is my part of the sceptre. Combine it with the other parts on the altar of the Great Snake in the depths of this temple. ", cid)
				talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, "no") and talkState[talkUser]) then
		npcHandler:say("No deal then.", cid)
		talkState[talkUser] = 0
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
