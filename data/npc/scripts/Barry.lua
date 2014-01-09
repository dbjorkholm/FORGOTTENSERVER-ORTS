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
			npcHandler:say("Oh my, where to begin with .. <tells about the troubles he and his men have recently encountered>. ", cid)
			setPlayerStorageValue(cid, 30, getPlayerStorageValue(cid, 30) + 1)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "pass")) then
		npcHandler:say("You can {pass} either to the {Magician Quarter} or {Sunken Quarter}. Which one will it be?", cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "magician")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32885, y=31157, z=7})
			doSendMagicEffect({x=32885, y=31157, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "sunken")) then
		if(talkState[talkUser] == 1) then
			doTeleportThing(cid, {x=32884, y=31162, z=7})
			doSendMagicEffect({x=32884, y=31162, z=7}, CONST_ME_TELEPORT)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())