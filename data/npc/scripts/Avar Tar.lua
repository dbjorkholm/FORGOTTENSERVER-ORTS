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
		npcHandler:say("I'm tired of all these young unskilled wannabe heroes. Every Tibian can show his skills or actions by wearing a special outfit. To prove oneself worthy of the demon outfit, this is how it goes: ... ", cid)
		npcHandler:say("The base outfit will be granted for completing the annihilator quest, which isn't much of a challenge nowadays, in my opinion. Anyway ... ", cid)
		npcHandler:say("The shield however will only be granted to those adventurers who have finished the demon helmet quest. ... ", cid)
		npcHandler:say("Well, the helmet is for those who really are tenacious and have hunted down all 6666 demons and finished the demon oak as well. ... ", cid)
		npcHandler:say("Are you interested? ", cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "base")) then
		if(talkState[talkUser] == 2 and getPlayerStorageValue(cid, 310) == 1 and canPlayerWearOutfit(cid, getPlayerSex(cid) == 0 and 541 or 542, 0) == false) then
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 541 or 542, 0)
			npcHandler:say("Receive the base outfit, " .. getPlayerName(cid) .. ".", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "shield")) then
		if(talkState[talkUser] == 2 and getPlayerStorageValue(cid, 305) == 1 and canPlayerWearOutfit(cid, getPlayerSex(cid) == 0 and 541 or 542, 1) == false) then
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 541 or 542, 1)
			npcHandler:say("Receive the base outfit, " .. getPlayerName(cid) .. ".", cid)
			talkState[talkUser] = 0
		end
	-- elseif(msgcontains(msg, "helmet")) then
		-- if(talkState[talkUser] == 2 and getPlayerStorageValue(cid, ) == 1 and canPlayerWearOutfit(cid, getPlayerSex(cid) == 0 and 541 or 542, 2) == false) then
			-- doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 541 or 542, 2)
			-- npcHandler:say("Receive the base outfit, " .. getPlayerName(cid) .. ".", cid)
			-- talkState[talkUser] = 0
		-- end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("So you want to have the demon outfit, hah! Let's have a look first if you really deserve it. Tell me: {base}, {shield} or {helmet}?", cid)
			talkState[talkUser] = 2
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())