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
		if(getPlayerStorageValue(cid, 30) == 10 or getPlayerStorageValue(cid, 30) == 11) then
			npcHandler:say("You have NO idea what we have to endure each day .. <gives a shocking and disturbing report>. ", cid)
			setPlayerStorageValue(cid, 30, getPlayerStorageValue(cid, 30) + 1)
			Player(cid):setStorageValue(12013, Player(cid):getStorageValue(12013) + 1) -- StorageValue for Questlog "Mission 02: Watching the Watchmen"
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "pass")) then
		npcHandler:say("You can {pass} either to the {Cemetery Quarter} or {Magician Quarter}. Which one will it be?", cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "cemetery")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32799, y=31103, z=7})
			doSendMagicEffect({x=32799, y=31103, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "magician")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32804, y=31103, z=7})
			doSendMagicEffect({x=32804, y=31103, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())