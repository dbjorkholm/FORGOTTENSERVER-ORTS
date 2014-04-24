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
		if(getPlayerStorageValue(cid, 30) == 7 or getPlayerStorageValue(cid, 30) == 13) then
			npcHandler:say("A report? What do they think is happening here? <gives an angry and bitter report>. ", cid)
			setPlayerStorageValue(cid, 30, getPlayerStorageValue(cid, 30) + 1)
			Player(cid):setStorageValue(12013, Player(cid):getStorageValue(12013) + 1) -- StorageValue for Questlog "Mission 02: Watching the Watchmen"
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "pass")) then
		npcHandler:say("You can {pass} either to the {Factory Quarter} or {Trade Quarter}. Which one will it be?", cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "factory")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32859, y=31302, z=7})
			doSendMagicEffect({x=32859, y=31302, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "trade")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32854, y=31302, z=7})
			doSendMagicEffect({x=32854, y=31302, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())