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
 
	if(msgcontains(msg, "trouble") and talkState[talkUser] == nil and getPlayerStorageValue(cid, 204) < 1) then
		npcHandler:say("I'm fine. There's no trouble at all.", cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "foresight of the authorities")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Well, of course. We live in safety and peace.", cid)
			talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, "also for the gods")) then
		if(talkState[talkUser] == 2) then
			npcHandler:say("I think the gods are looking after us and their hands shield us from evil.", cid)
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, "trouble will arise in the near future")) then
		if(talkState[talkUser] == 3) then
			npcHandler:say("I think the gods and the government do their best to keep away harm from the citizens.", cid)
			talkState[talkUser] = 0
			if(getPlayerStorageValue(cid, 204) < 1) then
				setPlayerStorageValue(cid, 204, 1)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())