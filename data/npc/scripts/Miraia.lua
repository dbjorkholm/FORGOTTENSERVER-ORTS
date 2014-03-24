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

	if(msgcontains(msg, "scarab cheese")) then
		if(getPlayerStorageValue(cid, Rashid.MissionStart+2) == 1) then
			npcHandler:say("Let me cover my nose before I get this for you... Would you REALLY like to buy scarab cheese for 100 gold?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, Rashid.MissionStart+2) == 2) then
			npcHandler:say("Oh the last cheese molded? Would you like to buy another one for 100 gold?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			if(getPlayerMoney(cid) >= 100) then
				npcHandler:say("Here it is.", cid)
				setPlayerStorageValue(cid, Rashid.MissionStart+2, 2)
				doPlayerAddItem(cid, 8112, 1)
				doPlayerRemoveMoney(cid, 100)
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