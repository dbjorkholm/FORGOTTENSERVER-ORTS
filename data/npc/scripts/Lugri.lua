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

	if(msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 1003) < 1) then
			npcHandler:say("This skull shows that you are a true follower of Zathroth and the glorious gods of darkness. Are you willing to prove your loyalty?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "shield")) then
		if(getPlayerStorageValue(cid, 1003) == 1) then
			npcHandler:say("Is it your true wish to sacrifice a medusa shield to Zathroth?", cid)
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, "mail")) then
		if(getPlayerStorageValue(cid, 1003) == 2) then
			npcHandler:say("Is it your true wish to sacrifice a dragon scale mail to Zathroth?", cid)
			talkState[talkUser] = 4
		end	
	elseif(msgcontains(msg, "legs")) then
		if(getPlayerStorageValue(cid, 1003) == 3) then
			npcHandler:say("Is it your true wish to sacrifice crown legs to Zathroth?", cid)
			talkState[talkUser] = 5
		end	
	elseif(msgcontains(msg, "ring")) then
		if(getPlayerStorageValue(cid, 1003) == 4) then
			npcHandler:say("Is it your true wish to sacrifice a ring of the sky to Zathroth?", cid)
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then	
			npcHandler:say("It will be a hard task which requires many sacrifices. Do you still want to proceed?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then	
			npcHandler:say("Good decision, <name>. Your first sacrifice will be a medusa shield. Bring it to me and do give it happily.", cid)
			setPlayerStorageValue(cid, 1003, 1)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 2) then
			if(getPlayerItemCount(cid, 2536) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The second sacrifice I require from you is a dragon scale mail. Bring it to me and do give it happily.", cid)
				doPlayerRemoveItem(cid, 2536, 1)
				setPlayerStorageValue(cid, 1003, 2)
				talkState[talkUser] = 0	
			end
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 2492) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The third sacrifice I require from you are crown legs. Bring them to me and do give them happily.", cid)
				doPlayerRemoveItem(cid, 2492, 1)
				setPlayerStorageValue(cid, 1003, 3)
				talkState[talkUser] = 0	
			end
		elseif(talkState[talkUser] == 4) then
			if(getPlayerItemCount(cid, 2488) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The last sacrifice I require from you is a ring of the sky. Bring it to me and do give it happily.", cid)
				doPlayerRemoveItem(cid, 2488, 1)
				setPlayerStorageValue(cid, 1003, 4)
				talkState[talkUser] = 0	
			end
		elseif(talkState[talkUser] == 5) then
			if(getPlayerItemCount(cid, 2123) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. You have proven that you are a true follower of Zathroth and do not hesitate to sacrifice worldly goods. Thus, I will reward you with this headgear. ", cid)
				doPlayerRemoveItem(cid, 2123, 1)
				setPlayerStorageValue(cid, 1003, 5)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 149 or 145, 1)
				talkState[talkUser] = 0	
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())