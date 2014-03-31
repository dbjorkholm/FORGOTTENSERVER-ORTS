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
	
	if(msgcontains(msg, "quara")) then
		if(getPlayerStorageValue(cid, 30) == 41 and getPlayerStorageValue(cid, 11) < 1  and getPlayerStorageValue(cid, 13) < 1 and getPlayerStorageValue(cid, 12) < 1) then
			npcHandler:say({"The quara in this area are a strange race that seeks for inner perfection rather than physical one. ...","However, recently the quara got mad because their area is flooded with toxic sewage from the city. If you could inform someone about it, they might stop the sewage and the quara could return to their own business."}, cid, 0, 1, 3000)
			setPlayerStorageValue(cid, 30, 42)
			Player(cid):setStorageValue(12018, 3) -- StorageValue for Questlog "Mission 07: A Fishy Mission"
			setPlayerStorageValue(cid, 14, 1)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())