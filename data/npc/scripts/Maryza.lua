local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "cookbook")) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart+1) == 1) then
			npcHandler:say("Would you like to buy a cookbook for 150 gold?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			if(getPlayerMoney(cid) >= 150) then
				npcHandler:say("Here it is.", cid)
				setPlayerStorageValue(cid, BlueDjinn.MissionStart+1, 2)
				doPlayerAddItem(cid, 2347, 1)
				doPlayerRemoveMoney(cid, 150)
				talkState[talkUser] = 0
			else
				npcHandler:say("You don't have enought money.", cid)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())