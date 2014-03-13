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
	
	if(msgcontains(msg, 'key')) then
		selfSay('I will give the key to the crypt only to the closest followers of my master. Would you like me to test you?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		selfSay('Before we start I must ask you for a small donation of 1000 gold coins. Are you willing to pay 1000 gold coins for the test?', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then
		if(doPlayerRemoveMoney(cid, 1000)) then
			selfSay('All right then. Here comes the first question. What was the name of Dago\'s favourite pet?', cid)
			talkState[talkUser] = 3
		else
			selfSay('You don\'t have enough money', cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, 'redips') and talkState[talkUser] == 3) then
		selfSay('Perhaps you knew him after all. Tell me - how many fingers did he have when he died?', cid)
		talkState[talkUser] = 4
	elseif(msgcontains(msg, '7') and talkState[talkUser] == 4) then
		selfSay('Also true. But can you also tell me the colour of the deamons in which master specialized?', cid)
		talkState[talkUser] = 5
	elseif(msgcontains(msg, 'black') and talkState[talkUser] == 5) then
		selfSay('It seems you are worthy after all. Do you want the key to the crypt?', cid)
		talkState[talkUser] = 6
	elseif(talkState[talkUser]== 6) then
		selfSay('here you are', cid)
		local item = doPlayerAddItem(cid, 2089, 1)
             doSetItemActionId(item, 3142)
	end
        
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())