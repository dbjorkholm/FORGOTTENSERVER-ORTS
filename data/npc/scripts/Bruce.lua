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
	
	if(msgcontains(msg, "report")) then
		if(getPlayerStorageValue(cid, 30) == 9 or getPlayerStorageValue(cid, 30) == 11) then
			npcHandler:say("Well, .. <gives a short and precise report>. ", cid)
			setPlayerStorageValue(cid, 30, getPlayerStorageValue(cid, 30) + 1)
			Player(cid):setStorageValue(12013, Player(cid):getStorageValue(12013) + 1) -- StorageValue for Questlog "Mission 02: Watching the Watchmen"
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "pass")) then
		npcHandler:say("You can {pass} either to the {Alchemist Quarter} or {Cemetery Quarter}. Which one will it be?", cid)
		talkState[talkUser] = 1	
	elseif(msgcontains(msg, "alchemist")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32738, y=31113, z=7})
			doSendMagicEffect({x=32738, y=31113, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "cemetery")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32743, y=31113, z=7})
			doSendMagicEffect({x=32743, y=31113, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())