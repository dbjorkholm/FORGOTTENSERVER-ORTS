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

	-- Mission 1 - The Supply Thief 
	if(msgcontains(msg, "job")) then
		if(getPlayerStorageValue(cid, 81) == 2) then
			npcHandler:say("What do you think? I am the sheriff of Carlin.", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "water pipe")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say({"Oh, there's a waterpipe in one of my cells? ...", "I guess my last {prisoner} forgot it there."}, cid, 0, 1, 2500)
			talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, "prisoner")) then
		if(talkState[talkUser] == 2) then
			npcHandler:say({"My last prisoner? Hmm. ...", "I think he was some guy from Darama. Can't remember his name. ...", "He was here just for one night, because he got drunk and annoyed our citizens. ...", "Obviously he wasn't pleased with this place, because he headed for Thais the next day. ...", "Something tells me that he won't stay out of trouble for too long."}, cid, 0, 1, 3500)
			setPlayerStorageValue(cid, 81, 3)
			talkState[talkUser] = 0
		end
	end
	-- Mission 1 - The Supply Thief 
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())