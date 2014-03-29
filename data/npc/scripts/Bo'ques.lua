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
	if(msg == "DJANNI'HAH") and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, Factions) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, GreenDjinn.MissionStart) < 1 or not BlueOrGreen) then
				npcHandler:say("Hey! A human! What are you doing in my kitchen, " .. getCreatureName(cid) .. "?", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart) == 1 and getPlayerStorageValue(cid, BlueDjinn.MissionStart+1) < 1) then
			npcHandler:say({"My collection of recipes is almost complete. There are only but a few that are missing. ...","Mmmm... now that we talk about it. There is something you could help me with. Are you interested?"}, cid, 0, 1, 2500)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "cookbook")) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart+1) == 2) then
			npcHandler:say("Do you have the cookbook of the dwarven kitchen with you? Can I have it?", cid)
			talkState[talkUser] = 2
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say({"Fine! Even though I know so many recipes, I'm looking for the description of some dwarven meals. ...","So, if you could bring me a cookbook of the dwarven kitchen I will reward you well."}, cid, 0, 1, 2500)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, BlueDjinn.MissionStart+1, 1)
		elseif(talkState[talkUser] == 2) then
			if(doPlayerRemoveItem(cid, 2347, 1)) then
				npcHandler:say({"The book! You have it! Let me see! <browses the book> ...","Dragon Egg Omelette, Dwarven beer sauce... it's all there. This is great! Here is your well-deserved reward. ...","Incidentally, I have talked to Fa'hradin about you during dinner. I think he might have some work for you. Why don't you talk to him about it?"}, cid, 0, 1, 3000)
				talkState[talkUser] = 0
				setPlayerStorageValue(cid, BlueDjinn.MissionStart+1, 3)
				doPlayerAddItem(cid, 2146, 3)
			end
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Goodbye. I am sure you will come back for more. They all do.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)