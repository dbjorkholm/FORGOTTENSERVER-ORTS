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
	if(getPlayerStorageValue(cid, 19) == 1) then
		npcHandler:setMessage(MESSAGE_GREET, "Wh .. What? How did you get here? Where are all the guards? You .. you could have killed me but yet you chose to talk? What a relief! ... So what brings you here my friend, if I might call you like that? ")
	elseif(getPlayerStorageValue(cid, 19) == 2) then	
		npcHandler:setMessage(MESSAGE_GREET, "Murderer! But .. I give in, you won! ... Dictate me your conditions but please, I beg you, spare my life. What do you want?")
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 30) == 24) then
			if(getPlayerStorageValue(cid, 19) == 1) then
				npcHandler:say("Indeed, I can see the benefits of a mutual agreement. I will later read the details and send a letter to your superior. ", cid)
				setPlayerStorageValue(cid, 30, 25)
				setPlayerStorageValue(cid, 18, 1)
				talkState[talkUser] = 0
			elseif(getPlayerStorageValue(cid, 19) == 2) then
				npcHandler:say("Yes, for the sake of my life I'll accept those terms. I know when I have lost. Tell your master I will comply with his orders. ", cid)
				setPlayerStorageValue(cid, 30, 25)
				setPlayerStorageValue(cid, 18, 2)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())