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
 
	if(msgcontains(msg, "spectral dress")) then
		if(getPlayerStorageValue(cid, 90) == 48) then
			npcHandler:say("Your wish for a spectral dress is silly. Although I will grant you the permission to take one. My maidens left one in a box in a room, directly south of here.", cid)
			setPlayerStorageValue(cid, 90, 49)
		end
	elseif(msgcontains(msg, "addon")) then
		if(getPlayerStorageValue(cid, 1003) == 5) then
			npcHandler:say("Say... I have been longing for something for an eternity now... if you help me retrieve it, I will reward you. Do you consent to this arrangement?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "orchid")) then
		if(getPlayerStorageValue(cid, 1003) == 6) then
			npcHandler:say("Have you really brought me 50 holy orchids?", cid)
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Listen... there are no blooming flowers down here and the only smell present is that of death and decay. ...", cid)
			npcHandler:say("I wish that I could breathe the lovely smell of beautiful flowers just one more time, especially those which elves cultivate. ...", cid)
			npcHandler:say("Could you please bring me 50 holy orchids?", cid)
			npcHandler:say("", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("Thank you. I will wait for your return.", cid)
			setPlayerStorageValue(cid, 1003, 6)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 5922) >= 50) then
				npcHandler:say("Thank you! You have no idea what that means to me. As promised,here is your reward... as a follower of Zathroth, I hope that you will like this accessory.", cid)
				doPlayerRemoveItem(cid, 5922, 1)
				setPlayerStorageValue(cid, 1003, 7)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 149 or 145, 2)
				talkState[talkUser] = 0	
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())