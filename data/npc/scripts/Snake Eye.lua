dofile('data/lib/MissionSelect.lua')
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "package for rashid")) then
		if(getPlayerStorageValue(cid, Rashid.MissionStart+1) >= 1 and getPlayerStorageValue(cid, Rashid.MissionStart+1) < 3) then
			npcHandler:say("So you're the delivery boy? Go ahead, but I warn you, it's quite heavy. You can take it from the box over there.", cid)
			setPlayerStorageValue(cid, Rashid.MissionStart+1, getPlayerStorageValue(cid, Rashid.MissionStart+1) + 1)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())