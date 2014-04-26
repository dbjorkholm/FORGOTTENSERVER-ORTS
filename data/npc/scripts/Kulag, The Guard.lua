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
 
	if(msgcontains(msg, "trouble") and getPlayerStorageValue(cid, 202) < 1) then
		npcHandler:say("You adventurers become more and more of a pest.", cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "authorities")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("They should throw you all into jail instead of giving you all those quests and rewards an honest watchman can only dream about.", cid)
			talkState[talkUser] = 0
			if(getPlayerStorageValue(cid, 202) < 1) then
				setPlayerStorageValue(cid, 202, 1)
				Player(cid):setStorageValue(12111, Player(cid):getStorageValue(12111) + 1) -- The Inquisition Questlog- "Mission 1: Interrogation"
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())