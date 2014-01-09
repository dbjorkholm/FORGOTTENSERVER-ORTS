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

	if(msgcontains(msg, "wooden stake")) then
		if(getPlayerStorageValue(cid, 87) < 1) then
			npcHandler:say("A blessed stake to defeat evil spirits? I do know an old prayer which is said to grant sacred power and to be able to bind this power to someone, or something. ...", cid)
			npcHandler:say("However, this prayer needs the combined energy of ten priests. Each of them has to say one line of the prayer. ...", cid)
			npcHandler:say("I could start with the prayer, but since the next priest has to be in a different location, you probably will have to travel a lot. ...", cid)
			npcHandler:say("Is this stake really important enough to you so that you are willing to take this burden?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 87) == 2) then
			if(getPlayerItemCount(cid, 5941) >= 1) then
				npcHandler:say("Ah, I see you brought a stake with you. Are you ready to receive my line of the prayer then?", cid)
				talkState[talkUser] = 2
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			setPlayerStorageValue(cid, 87, 1)
			npcHandler:say("Alright, I guess you need a stake first. Maybe Gamon can help you, the leg of a chair or something could just do. Try asking him for a stake, and if you have one, bring it back to me.", cid)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 2) then
			if(getPlayerItemCount(cid, 5941) >= 1) then
				setPlayerStorageValue(cid, 87, 3)
				npcHandler:say(" So receive my prayer: 'Light shall be near - and darkness afar'. Now, bring your stake to Tibra in the Carlin church for the next line of the prayer. I will inform her what to do. ", cid)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())