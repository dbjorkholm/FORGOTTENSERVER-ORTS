local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "vial") or msgcontains(msg, "ticket")   then
		if player:getStorageValue(Storage.OutfitQuest.MageSummonerFluidBeltAddon) < 1 then
			npcHandler:say("We have a special offer right now for depositing vials. Are you interested in hearing it?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.OutfitQuest.MageSummonerFluidBeltAddon) >= 1 then
			npcHandler:say("Would you like to get a lottery ticket instead of the deposit for your vials?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "prize") then
		npcHandler:say("Are you here to claim a prize?", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then	
			npcHandler:say({"The Edron academy has introduced a bonus system. Each time you deposit 100 vials without claiming the money for it, you will receive a lottery ticket. ...",
							"Some of these lottery tickets will grant you a special potion belt accessory, if you bring the ticket to me. ...",
							"If you join the bonus system now, I will ask you each time you are bringing back 100 or more vials to me whether you claim your deposit or rather want a lottery ticket. ...",
							"Of course, you can leave or join the bonus system at any time by just asking me for the 'bonus'. ...",
							"Would you like to join the bonus system now?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then	
			npcHandler:say("Great! I've signed you up for our bonus system. From now on, you will have the chance to win the potion belt addon!", cid)
			player:setStorageValue(Storage.OutfitQuest.MageSummonerFluidBeltAddon, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then	
			if player:removeItem(7634, 100) or player:removeItem(7635, 100) or player:removeItem(7636, 100) then
				npcHandler:say("Ok here take this Lottery Ticket!", cid)
				player:addItem(5957,1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You dont have 100 vials.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then	
			if player:getStorageValue(Storage.OutfitQuest.MageSummonerFluidBeltAddon) == 1 and player:getItemCount(5958) >= 1 then
				npcHandler:say("Congratulations! Here, from now on you can wear our lovely potion belt as accessory.", cid)
				player:removeItem(5958, 1)
				player:setStorageValue(Storage.OutfitQuest.MageSummonerFluidBeltAddon, 2)
				player:addOutfitAddon(138, 1)
				player:addOutfitAddon(133, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0
			elseif player:getItemCount(5958) >= 1 then
				player:removeItem(5958, 1)
				player:addMoney(50000)
				player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
				npcHandler:say("Congratulations! Here, you won 50000 Gold!", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You dont have a prize!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	return true
	end
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
