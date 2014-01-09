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
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 30) == 29) then
			npcHandler:say("Why should I do something for another human being? I have been on my own for all those years. Hmm, but actually there is something I could need some assistance with. ... ", cid)
			npcHandler:say("If you help me to solve my problems, I will help you with your mission. Do you accept?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 30) == 32) then
			npcHandler:say("You have kept your promise. Now, it's time to fulfil my part of the bargain. What kind of animals shall I raise? {Warbeasts} or {cattle}?", cid)
			talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, "animal cure")) then
		if(getPlayerStorageValue(cid, 30) == 30 and getPlayerItemCount(cid, 9734) >= 1) then
			doPlayerRemoveItem(cid, 9734, 1)
			setPlayerStorageValue(cid, 30, 31)
			npcHandler:say("Thank you very much. As I said, as soon as you have helped me to solve both of my problems, we will talk about your mission.", cid)
			talkState[talkUser] = 0
		else
			npcHandler:say("Come back when you have the cure.", cid)
		end
	elseif(msgcontains(msg, "cattle")) then
		if(talkState[talkUser] == 2) then
			setPlayerStorageValue(cid, 16, 1)
			setPlayerStorageValue(cid, 30, 32)
			npcHandler:say("So be it! ", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "warbeast")) then
		if(talkState[talkUser] == 2) then
			setPlayerStorageValue(cid, 16, 2)
			setPlayerStorageValue(cid, 30, 32)
			npcHandler:say("So be it! ", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "morik")) then
		if(getPlayerStorageValue(cid, 30) == 31 and getPlayerItemCount(cid, 9735) >= 1) then
			doPlayerRemoveItem(cid, 9735, 1)
			setPlayerStorageValue(cid, 30, 32)
			npcHandler:say("So he finally got what he deserved. As I said, as soon as you have helped me to solve both of my problems, we will talk about your mission. ", cid)
			talkState[talkUser] = 0
		else
			npcHandler:say("Come back when you got rid with Morik.", cid)
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			setPlayerStorageValue(cid, 30, 30)
			npcHandler:say("I ask you for two things! For one thing, I need an animal cure and for another thing, I ask you to get rid of the gladiator Morik for me. ", cid)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())