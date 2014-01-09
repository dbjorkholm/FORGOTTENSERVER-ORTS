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

	if(msgcontains(msg, "shooting")) then
		if(getPlayerStorageValue(cid, 900) == 7) then
			npcHandler:say("To the left you see our shooting range. Grab a cannon and shoot at the targets. You need five hits to succeed. ... ", cid)
			npcHandler:say("Shoot at the villain targets that will pop up. DON'T shoot innocent civilians since this will reset your score and you have to start all over. Report to me afterwards. ", cid)
			setPlayerStorageValue(cid, 900, 8)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "report")) then
		if(getPlayerStorageValue(cid, 900) == 9) then
			npcHandler:say("You are showing some promise! Now continue with the recruitment and talk to Gnomewart to the south for your endurance test! ", cid)
			setPlayerStorageValue(cid, 900, 10)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())