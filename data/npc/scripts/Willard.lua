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
			npcHandler:say("Oooh, damn, I completely forgot about that. I was supposed to pick it up from the Outlaw Camp. ...", cid)
			npcHandler:say("I can't leave my shop here right now, please go and talk to Snake Eye about that package... I promise he won't make any trouble. ...", cid)
			npcHandler:say("Don't tell Rashid! I really don't want him to know that I forgot his order. Okay?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Thank you, I appreciate it. Don't forget to mention the package to Snake.", cid)
			setPlayerStorageValue(cid, Rashid.MissionStart+1, getPlayerStorageValue(cid, Rashid.MissionStart+1) + 1)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())