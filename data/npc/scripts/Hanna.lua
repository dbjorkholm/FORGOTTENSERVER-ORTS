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
	if not npcHandler:isFocused(cid) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local player = Player(cid)
	if msgcontains(msg, "addon") or msgcontains(msg, "outfit") then
		if player:getStorageValue(12062) < 1 then
			npcHandler:say("Pretty, isn't it? My friend Amber taught me how to make it, but I could help you with one if you like. What do you say?", player)
			talkState[talkUser] = 1
		end
	elseif msgcontains(msg, "hat") then
		if player:getStorageValue(12062) == 1 then
			npcHandler:say("Oh, you're back already? Did you bring a legion helmet, 100 chicken feathers and 50 honeycombs?", player)
			talkState[talkUser] = 2
		end
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 1 then	
			npcHandler:say({"Okay, here we go, listen closely! I need a few things...",
							"a basic hat of course, maybe a legion helmet would do. Then about 100 chicken feathers...",
							"and 50 honeycombs as glue. That's it, come back to me once you gathered it!"}, player, 0, 1, 3500)
			talkState[talkUser] = 0
			player:setStorageValue(12062, 1)
			player:setStorageValue(12010, 1) --this for default start of Outfit and Addon Quests
		elseif talkState[talkUser] == 2 then
			if player:getItemCount( 5890) >= 100 and player:getItemCount( 5902) >= 50 and player:getItemCount( 2480) >= 1  then
				npcHandler:say("Great job! That must have taken a lot of work. Okay, you put it like this... then glue like this... here!", player)
				player:removeItem(5890, 100)
				player:removeItem(5902, 50)
				player:removeItem(2480, 1)
				player:setStorageValue(12062, 2)
				player:addOutfitAddon(136, 2)
				player:addOutfitAddon(128, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				talkState[talkUser] = 0	
			else
				npcHandler:say("You don't have it...", player)
			end
		end
	elseif msgcontains(msg, "no") then
		if talkState[talkUser] > 0 then
			npcHandler:say("Then no.", player)
			talkState[talkUser] = 0
		end
	return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())