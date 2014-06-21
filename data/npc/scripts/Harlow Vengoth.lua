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
	
	if(msgcontains(msg, "Yalahar")) then
		npcHandler:say("Do you want to travel to Yalahar for 50 gold?", cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			if(getPlayerMoney(cid) >= 50) then
				doPlayerRemoveMoney(cid, 50)
				doTeleportThing(cid, {x = 32837, y = 31366, z = 7})
				doSendMagicEffect({x = 32837, y = 31366, z = 7}, CONST_ME_TELEPORT)
				talkState[talkUser] = 0
			else
				npcHandler:say("You don't have enought money.", cid)
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Want to go back to {Yalahar} for 50 gold? Just ask me.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
