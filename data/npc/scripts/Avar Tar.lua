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
	local player = Player(cid)
	if(msgcontains(msg, "outfit")) then
		npcHandler:say(
		{
		"I'm tired of all these young unskilled wannabe heroes. Every Tibian can show his skills or actions by wearing a special outfit. To prove oneself worthy of the demon outfit, this is how it goes: ... ", 
		"The base outfit will be granted for completing the annihilator quest, which isn't much of a challenge nowadays, in my opinion. Anyway ... ", 
		"The shield however will only be granted to those adventurers who have finished the demon helmet quest. ... ", 
		"Well, the helmet is for those who really are tenacious and have hunted down all 6666 demons and finished the demon oak as well. ... ", 
		"Are you interested?"
		}, player)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, "base")) then
		if(talkState[talkUser] == 2 and getPlayerStorageValue(cid, 2215) == 1 and canPlayerWearOutfit(cid, getPlayerSex(cid) == 0 and 541 or 542, 0) == false) then
			player:addOutfit(542, 0)
			player:addOutfit(541, 0)
			player:setStorageValue(2215, 2)
			npcHandler:say("Receive the base outfit, " .. getPlayerName(cid) .. ".", player)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "shield")) then
		if talkState[talkUser] == 2 then
		if player:getStorageValue(2215) == 2 and player:getStorageValue(2217) == 1 then
			player:addOutfitAddon(player:getSex() == 0 and 542 or 541, 1)
			player:setStorageValue(2217, 2)
			npcHandler:say("Receive the shield, " .. getPlayerName(cid) .. ".", player)
			talkState[talkUser] = 0
		end
		end
	elseif(msgcontains(msg, "helmet")) then
		if talkState[talkUser] == 2 then
		if player:getStorageValue(2215) == 2 and player:getStorageValue(1010) == 3 then
			player:addOutfitAddon(player:getSex() == 0 and 542 or 541, 2)
			player:setStorageValue(1010, 4)
			npcHandler:say("Receive the helmet, " .. getPlayerName(cid) .. ".", player)
			talkState[talkUser] = 0
		end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("So you want to have the demon outfit, hah! Let's have a look first if you really deserve it. Tell me: {base}, {shield} or {helmet}?", player)
			talkState[talkUser] = 2
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
