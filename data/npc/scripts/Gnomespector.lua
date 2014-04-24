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

	local player = Player(cid)	
	
	if(msgcontains(msg, "recruit")) then
		if(player:getStorageValue(900) == 3) then
			npcHandler:say({" Your examination is quite easy. Just step through the green crystal {apparatus} in the south! We will examine you with what we call g-rays. Where g stands for gnome of course ..."," Afterwards walk up to Gnomedix for your ear examination."}, cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "apparatus") and talkState[talkUser] == 1) then
		if(player:getStorageValue(900) == 3) then
			npcHandler:say("Don't be afraid. It won't hurt! Just step in!", cid)
			player:setStorageValue(900, 4)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())