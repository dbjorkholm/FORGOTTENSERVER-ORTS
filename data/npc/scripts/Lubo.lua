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
		if player:getStorageValue(12063) < 1 then
			npcHandler:say("Sorry, the backpack I wear is not for sale. It's handmade from rare {minotaur leather}.", player)
			talkState[talkUser] = 1
		end
	elseif msgcontains(msg, "minotaur leather") then
		if talkState[talkUser] == 1 then
			npcHandler:say("Well, if you really like this backpack, I could make one for you, but minotaur leather is hard to come by these days. Are you willing to put some work into this?", player)
			talkState[talkUser] = 2
		end
	elseif msgcontains(msg, "backpack") then
		if player:getStorageValue(12063) == 1 then
			npcHandler:say("Ah, right, almost forgot about the backpack! Have you brought me 100 pieces of minotaur leather as requested?", player)
			talkState[talkUser] = 3
		end
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 2 then	
			npcHandler:say("Alright then, if you bring me 100 pieces of fine minotaur leather I will see what I can do for you. You probably have to kill really many minotaurs though... so good luck!", player)			
			talkState[talkUser] = 0
			player:setStorageValue(12063, 1)
			player:setStorageValue(12010, 1) --this for default start of Outfit and Addon Quests
		elseif talkState[talkUser] == 3 then
			if player:getItemCount( 5878) >= 100 then
				npcHandler:say("Your backpack is finished. Here you go, I hope you like it.", player)
				player:removeItem(5878, 100)
				player:setStorageValue(12063, 2)
				player:addOutfitAddon(136, 1)
				player:addOutfitAddon(128, 1)
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
	return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())