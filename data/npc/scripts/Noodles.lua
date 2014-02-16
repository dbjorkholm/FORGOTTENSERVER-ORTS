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

local function getPlayerBones(cid)
	return getPlayerItemCount(cid, 2230) + getPlayerItemCount(cid, 2231)
end

local function doPlayerRemoveBones(cid)
	return doPlayerRemoveItem(cid, 2230, getPlayerItemCount(cid, 2230)) and doPlayerRemoveItem(cid, 2231, getPlayerItemCount(cid, 2231))
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "banana skin")) then
		if(getPlayerStorageValue(cid, 250) == 19) then
			if(getPlayerItemCount(cid, 2219) >= 1) then
				npcHandler:say("<sniff><sniff> ", cid)
				talkState[talkUser] = 1
			end
		end
	elseif(msgcontains(msg, "dirty fur")) then
		if(getPlayerStorageValue(cid, 250) == 20) then
			if(getPlayerItemCount(cid, 2220) >= 1) then
				npcHandler:say("<sniff><sniff> ", cid)
				talkState[talkUser] = 2
			end
		end
	elseif(msgcontains(msg, "mouldy cheese")) then
		if(getPlayerStorageValue(cid, 250) == 21) then
			if(getPlayerItemCount(cid, 2235) >= 1) then
				npcHandler:say("<sniff><sniff> ", cid)
				talkState[talkUser] = 3
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Woof!", cid)
			setPlayerStorageValue(cid, 250, 20)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("Woof!", cid)
			setPlayerStorageValue(cid, 250, 21)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			npcHandler:say("Meeep! Grrrrr! <spits> ", cid)
			setPlayerStorageValue(cid, 250, 22)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())