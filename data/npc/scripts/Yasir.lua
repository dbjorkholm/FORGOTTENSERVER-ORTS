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
 
	if msg:lower() == "name" then
		return npcHandler:say("Me Yasir.", cid)
	elseif msg:lower() == "job" then
		return npcHandler:say("Tje hari ku ne finjala. {Ariki}?", cid)
	elseif msg:lower() == "passage" then
		return npcHandler:say("Soso yana. <shakes his head>", cid)
	end
	return true
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Si, jema ze harun. <waves>")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())