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
	if(msgcontains(msg, "outfit") or msgcontains(msg, "addon")) then
		if(player:getStorageValue(1003) < 1) then
			npcHandler:say("This skull shows that you are a true follower of Zathroth and the glorious gods of darkness. Are you willing to prove your loyalty?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "shield") or msgcontains(msg, "medusa shield")) then
		if(player:getStorageValue(1003) == 1) then
			npcHandler:say("Is it your true wish to sacrifice a medusa shield to Zathroth?", cid)
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, "mail") or msgcontains(msg, "dragon scale mail")) then
		if(player:getStorageValue(1003) == 2) then
			npcHandler:say("Is it your true wish to sacrifice a dragon scale mail to Zathroth?", cid)
			talkState[talkUser] = 4
		end	
	elseif(msgcontains(msg, "legs") or msgcontains(msg, "crown legs")) then
		if(player:getStorageValue(1003) == 3) then
			npcHandler:say("Is it your true wish to sacrifice crown legs to Zathroth?", cid)
			talkState[talkUser] = 5
		end	
	elseif(msgcontains(msg, "ring") or msgcontains(msg, "ring of the sky")) then
		if(player:getStorageValue(1003) == 4) then
			npcHandler:say("Is it your true wish to sacrifice a ring of the sky to Zathroth?", cid)
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then	
			npcHandler:say("It will be a hard task which requires many sacrifices. Do you still want to proceed?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then	
			npcHandler:say("Good decision, " .. player:getName() .. ". Your first sacrifice will be a medusa shield. Bring it to me and do give it happily.", cid)
			player:setStorageValue(1003, 1)
			player:setStorageValue(12010, 1) --this for default start of Outfit and Addon Quests
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			if(player:getItemCount(2536) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The second sacrifice I require from you is a dragon scale mail. Bring it to me and do give it happily.", cid)
				player:removeItem(2536, 1)
				player:setStorageValue(1003, 2)
				talkState[talkUser] = 0	
			else
				npcHandler:say("You don't have it...", player)
			end
		elseif(talkState[talkUser] == 4) then
			if(player:getItemCount(2492) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The third sacrifice I require from you are crown legs. Bring them to me and do give them happily.", cid)
				player:removeItem(2492, 1)
				player:setStorageValue(1003, 3)
				talkState[talkUser] = 0	
			else
				npcHandler:say("You don't have it...", player)
			end
		elseif(talkState[talkUser] == 5) then
			if(player:getItemCount(2488) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The last sacrifice I require from you is a ring of the sky. Bring it to me and do give it happily.", cid)
				player:removeItem(2488, 1)
				player:setStorageValue(1003, 4)
				talkState[talkUser] = 0	
			else
				npcHandler:say("You don't have it...", player)
			end
		elseif(talkState[talkUser] == 6) then
			if(player:getItemCount(2123) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. You have proven that you are a true follower of Zathroth and do not hesitate to sacrifice worldly goods. Thus, I will reward you with this headgear. ", cid)
				player:removeItem(2123, 1)
				player:setStorageValue(1003, 5)
				player:addOutfitAddon(145, 2)
				player:addOutfitAddon(149, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				talkState[talkUser] = 0	
			else
				npcHandler:say("You don't have it...", player)
			end
		end
	elseif msgcontains(msg, "no") then
		if talkState[talkUser] > 1 then
			npcHandler:say("Then no.", player)
			talkState[talkUser] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
