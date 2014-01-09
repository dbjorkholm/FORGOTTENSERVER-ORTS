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
		if(getPlayerStorageValue(cid, 30) < 1 and getPlayerStorageValue(cid, 120) == 7 and getPlayerStorageValue(cid, 121) >= 5) then
			npcHandler:say("There is indeed something that needs our attention. In the far north, a new city named Yalahar was discovered. It seems to be incredibly huge. ...", cid)
			npcHandler:say("According to travelers, it's a city of glory and wonders. We need to learn as much as we can about this city and its inhabitants. ...", cid)
			npcHandler:say("Gladly the explorer's society already sent a representative there. Still, we need someone to bring us the information he was able to gather until now. ...", cid)
			npcHandler:say("Please look for the explorer's society's captain Maximilian in Liberty Bay. Ask him for a passage to Yalahar. There visit Timothy of the explorer's society and get his research notes. ...", cid)
			npcHandler:say("It might be a good idea to explore the city a bit on your own before you deliver the notes here, but please make sure you don't lose them. ", cid)
			setPlayerStorageValue(cid, 30, 1)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 30) == 2) then
			npcHandler:say("Did you bring the papers I asked you for?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "yes")) then	
		if(talkState[talkUser] == 1) then
			if(getPlayerItemCount(cid, 10090) >= 1) then
				doPlayerRemoveItem(cid, 10090, 1)
				setPlayerStorageValue(cid, 30, 3)
				npcHandler:say("Oh marvellous, please excuse me. I need to read this text immediately. Here, take this small reward of 500 gold pieces for your efforts.", cid)
				doPlayerAddMoney(cid, 500)
				talkState[talkUser] = 0
			end
		end
	elseif(msgcontains(msg, "farmine")) then
		if(getPlayerStorageValue(cid, 1015) == 15) then
			npcHandler:say("I've heard some odd rumours about this new dwarven outpost. But tell me, what has the Edron academy to do with Farmine?", cid)
			talkState[talkUser] = 30
		end
	elseif(msgcontains(msg, "plea")) then
		if(talkState[talkUser] == 30) then
			if(getPlayerStorageValue(cid, 1020) < 1) then
				npcHandler:say("Hm, you are right, we are at the forefront of knowledge and innovation. Our dwarven friends could learn much from one of our representatives.", cid)
				setPlayerStorageValue(cid, 1020, 1)
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())