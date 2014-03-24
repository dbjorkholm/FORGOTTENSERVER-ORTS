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

	-- Mission 1 - The Supply Thief 
	if(msgcontains(msg, "prison")) then
		if(getPlayerStorageValue(cid, 81) == 3) then
			npcHandler:say("You mean that's a JAIL? They told me it's the finest hotel in town! THAT explains the lousy roomservice!", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "ankrahmun")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say({"Yes, I've lived in Ankrahmun for quite some time. Ahh, good old times! ...", "Unfortunately I had to relocate. <sigh> ...", "Business reasons - you know."}, cid, 0, 1, 3000)
			talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, "supplies")) then
		if(talkState[talkUser] == 2) then
			npcHandler:say({"What!? I bet, Baa'leal sent you! ...", "I won't tell you anything! Shove off!"}, cid, 0, 1, 2000)
			setPlayerStorageValue(cid, 81, 4)
			talkState[talkUser] = 0
		end
	end
	-- Mission 1 - The Supply Thief 
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())