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
	if msgcontains(msg, "vial") or msgcontains(msg, "ticket")   then
		if player:getStorageValue(12064) < 1 then
			npcHandler:say("We have a special offer right now for depositing vials. Are you interested in hearing it?", player)
			talkState[talkUser] = 1
		elseif player:getStorageValue(12064) >= 1 then
			npcHandler:say("Would you like to get a lottery ticket instead of the deposit for your vials?", player)
			talkState[talkUser] = 3
		end
	elseif msgcontains(msg, "prize") then
		npcHandler:say("Are you here to claim a prize?", player)
		talkState[talkUser] = 4
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 1 then	
			npcHandler:say({"The Edron academy has introduced a bonus system. Each time you deposit 100 vials without claiming the money for it, you will receive a lottery ticket. ...",
							"Some of these lottery tickets will grant you a special potion belt accessory, if you bring the ticket to me. ...",
							"If you join the bonus system now, I will ask you each time you are bringing back 100 or more vials to me whether you claim your deposit or rather want a lottery ticket. ...",
							"Of course, you can leave or join the bonus system at any time by just asking me for the 'bonus'. ...",
							"Would you like to join the bonus system now?"}, player, 0, 1, 4000)
			talkState[talkUser] = 2
		elseif talkState[talkUser] == 2 then	
			npcHandler:say("Great! I've signed you up for our bonus system. From now on, you will have the chance to win the potion belt addon!", player)
			player:setStorageValue(12064, 1)
			player:setStorageValue(12010, 1) --this for default start of Outfit and Addon Quests
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 3 then	
			if player:removeItem(7634, 100) or player:removeItem(7635, 100) or player:removeItem(7636, 100) then
				npcHandler:say("Ok here take this Lottery Ticket!", player)
				player:addItem(5957,1)
				talkState[talkUser] = 0
			else
				npcHandler:say("You dont have 100 vials.", player)
				talkState[talkUser] = 0
			end
		elseif talkState[talkUser] == 4 then	
			if player:getStorageValue(12064) == 1 and player:getItemCount(5958) >= 1 then
				npcHandler:say("Congratulations! Here, from now on you can wear our lovely potion belt as accessory.", player)
				player:removeItem(5958, 1)
				player:setStorageValue(12064, 2)
				player:addOutfitAddon(138, 1)
				player:addOutfitAddon(133, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				talkState[talkUser] = 0
			elseif player:getItemCount(5958) >= 1 then
				player:removeItem(5958, 1)
				player:addMoney(50000)
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				npcHandler:say("Congratulations! Here, you won 50000 Gold!", player)
				talkState[talkUser] = 0
			else
				npcHandler:say("You dont have a prize!", player)
				talkState[talkUser] = 0
			end
		end
	return true
	end
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
