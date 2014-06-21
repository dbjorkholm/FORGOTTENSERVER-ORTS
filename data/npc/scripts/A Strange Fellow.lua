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
	
	if(getPlayerStorageValue(cid, 250) ~= 5) then
		return true
	end
	
	if(msgcontains(msg, "bill")) then
		if(talkState[talkUser] == 6) then
			npcHandler:say("A bill? Oh boy so you are delivering another bill to poor me? ", cid)
			talkState[talkUser] = 7
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 7) then
			npcHandler:say("Ok, ok, I'll take it. I guess I have no other choice anyways. And now leave me alone in my misery please. ", cid)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 250, 6)
		end
	elseif(msgcontains(msg, "hat")) then
		if(talkState[talkUser] < 1) then
			npcHandler:say("Uh? What do you want?! ", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("What? My hat?? Theres... nothing special about it! ", cid)
			talkState[talkUser] = 3
		elseif(talkState[talkUser] == 3) then
			npcHandler:say("Stop bugging me about that hat, do you listen? ", cid)
			talkState[talkUser] = 4
		elseif(talkState[talkUser] == 4) then
			npcHandler:say("Hey! Don't touch that hat! Leave it alone!!! Don't do this!!!! ", cid)
			talkState[talkUser] = 5
		elseif(talkState[talkUser] == 5) then
			npcHandler:say("Noooooo! Argh, ok, ok, I guess I can't deny it anymore, I am David Brassacres, the magnificent, so what do you want? ", cid)
			talkState[talkUser] = 6
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())