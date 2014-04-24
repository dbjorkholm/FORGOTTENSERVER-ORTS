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

function greetCallback(cid)
	local p = Player(cid)
	if(p:getStorageValue(30) == 30) then
		npcHandler:setMessage(MESSAGE_GREET, "Have you the {animal cure}?")
	elseif(p:getStorageValue(30) == 31) then
		npcHandler:setMessage(MESSAGE_GREET, "Have you killed {morik}?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello, what brings you here?")
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local p = Player(cid)
	if(msgcontains(msg, "mission")) then
		if(p:getStorageValue( 30) == 29) then
			npcHandler:say({"Why should I do something for another human being? I have been on my own for all those years. Hmm, but actually there is something I could need some assistance with. ... ",
							"If you help me to solve my problems, I will help you with your mission. Do you accept?"}, cid, 0, 1, 4000)
			talkState[talkUser] = 1
		elseif(p:getStorageValue( 30) == 32) then
			npcHandler:say("You have kept your promise. Now, it's time to fulfil my part of the bargain. What kind of animals shall I raise? {Warbeasts} or {cattle}?", cid)
			talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, "animal cure")) then
		if(p:getStorageValue( 30) == 30 and getPlayerItemCount(cid, 9734) >= 1) then
			doPlayerRemoveItem(cid, 9734, 1)
			p:setStorageValue( 30, 31)
			p:setStorageValue(12016, 4) -- StorageValue for Questlog "Mission 05: Food or Fight"
			npcHandler:say("Thank you very much. As I said, as soon as you have helped me to solve both of my problems, we will talk about your mission. Have you killed {morik}? ", cid)
			talkState[talkUser] = 0
		else
			npcHandler:say("Come back when you have the cure.", cid)
		end
	elseif(msgcontains(msg, "cattle")) then
		if(talkState[talkUser] == 2) then
			p:setStorageValue( 16, 1)
			p:setStorageValue( 30, 32)
			p:setStorageValue(12016, 6) -- StorageValue for Questlog "Mission 05: Food or Fight"
			npcHandler:say("So be it! ", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "warbeast")) then
		if(talkState[talkUser] == 2) then
			p:setStorageValue( 16, 2)
			p:setStorageValue( 30, 32)
			p:setStorageValue(12016, 7) -- StorageValue for Questlog "Mission 05: Food or Fight"
			npcHandler:say("So be it! ", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "morik")) then
		if(p:getStorageValue( 30) == 31 and getPlayerItemCount(cid, 9735) >= 1) then
			doPlayerRemoveItem(cid, 9735, 1)
			p:setStorageValue( 30, 32)
			p:setStorageValue(12016, 5) -- StorageValue for Questlog "Mission 05: Food or Fight"
			npcHandler:say("So he finally got what he deserved. As I said, as soon as you have helped me to solve both of my problems, we will talk about your {mission}. ", cid)
			talkState[talkUser] = 0
		else
			npcHandler:say("Come back when you got rid with Morik.", cid)
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			p:setStorageValue( 30, 30)
			p:setStorageValue(12016, 3) -- StorageValue for Questlog "Mission 05: Food or Fight"
			npcHandler:say("I ask you for two things! For one thing, I need an animal cure and for another thing, I ask you to get rid of the gladiator Morik for me. ", cid)
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())