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
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	-- GREET
	if(msg == "DJANNI'HAH" and (getPlayerStorageValue(cid, GreenDjinn.MissionStart) < 1) or not BlueOrGreen) and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, Factions) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, GreenDjinn.MissionStart) < 1 or not BlueOrGreen) then
				npcHandler:say({"Whoa? You know the word! Amazing, " .. getCreatureName(cid) .. "!...","I should go and tell Fa'hradin. ...","Well. Why are you here anyway, " .. getCreatureName(cid) .. "?"}, cid, 0, 1, 3000)
				npcHandler:addFocus(cid)
			end
		end
		return true
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	-- JOINING
	if(msgcontains(msg, "passage")) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart) < 1) then
			npcHandler:say({"If you want to enter our fortress you have to become one of us and fight the Efreet. ...","So, are you willing to do so?"}, cid, 0, 1, 3000)
			talkState[talkUser] = 1
		end
	-- JOINING
	
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Are you sure? You pledge loyalty to king Gabel, who is... you know. And you are willing to never ever set foot on Efreets' territory, unless you want to kill them? Yes?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say({"Oh. Ok. Welcome then. You may pass. ...","And don't forget to kill some Efreets, now and then."}, cid, 0, 1, 2000)
			talkState[talkUser] = 3
			setPlayerStorageValue(cid, BlueDjinn.MissionStart, 1)
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("<salutes>Aaaa -tention!.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)