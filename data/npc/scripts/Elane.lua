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
	elseif msgcontains(msg, "addon") or msgcontains(msg, "outfit") then
		if player:getStorageValue(Storage.OutfitQuest.HunterHatAddon) < 1 then
			npcHandler:say("Oh, my winged tiara? Those are traditionally awarded after having completed a difficult {task} for our guild, only to female aspirants though. Male warriors will receive a hooded cloak.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "Task") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("So you are saying that you would like to prove that you deserve to wear such a hooded cloak?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "crossbow") then
		if player:getStorageValue(Storage.OutfitQuest.HunterHatAddon) == 1 then
			npcHandler:say("I'm so excited! Have you really found my crossbow?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "leather") then
		if player:getStorageValue(Storage.OutfitQuest.HunterHatAddon) == 2 then
			npcHandler:say("Did you bring me 100 pieces of lizard leather and 100 pieces of red dragon leather?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "chicken wing") then
		if player:getStorageValue(Storage.OutfitQuest.HunterHatAddon) == 3 then
			npcHandler:say("Were you able to get hold of 5 enchanted chicken wings?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "steel") then
		if player:getStorageValue(Storage.OutfitQuest.HunterHatAddon) == 4 then
			npcHandler:say("Ah, have you brought one piece of royal steel, draconian steel and hell steel each?", cid)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, "Sniper Gloves") then
		if player:getStorageValue(Storage.OutfitQuest.HunterBodyAddon) < 1 then
			npcHandler:say("You found sniper gloves?! Incredible! Listen, if you give them to me, I will grant you the right to wear the sniper gloves accessory. How about it?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then	
			npcHandler:say({"Alright, I will give you a chance. Pay close attention to what I'm going to tell you now. ...",
							"Recently, one of our members moved to Liberty Bay out of nowhere, talking about some strange cult. That is not the problem, but he took my favourite crossbow with him. ...",
							"Please find my crossbow. It has my name engraved on it and is very special to me. ...",
							"Secondly, we need a lot of leather for new quivers. 100 pieces of lizard leather and 100 pieces of red dragon leather should suffice. ...",
							"Third, since we are giving out tiaras, we are always in need of enchanted chicken wings. Please bring me 5, that would help us tremendously. ...",
							"Lastly, for our arrow heads we need a lot of steel. Best would be one piece of royal steel, one piece of draconian steel and one piece of hell steel. ...",
							"Did you understand everything I told you and are willing to handle this task?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then	
			npcHandler:say("That's the spirit! I hope you will find my crossbow, " .. player:getName() .. "!", cid)
			player:setStorageValue(Storage.OutfitQuest.HunterHatAddon, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if player:getItemCount( 5947) >= 1 then
				npcHandler:say("Yeah! I could kiss you right here and there! Besides, you're a handsome one. <giggles> Please bring me 100 pieces of lizard leather and 100 pieces of red dragon leather now!", cid)
				player:removeItem(5947, 1)
				player:setStorageValue(Storage.OutfitQuest.HunterHatAddon, 2)
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:getItemCount( 5876) >= 100 and player:getItemCount( 5948) >= 100  then
				npcHandler:say("Good work, " .. player:getName() .. "! That is enough leather for a lot of sturdy quivers. Now, please bring me 5 enchanted chicken wings.", cid)
				player:removeItem(5876, 100)
				player:removeItem(5948, 100)
				player:setStorageValue(Storage.OutfitQuest.HunterHatAddon, 3)
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:getItemCount( 5891) >= 5 then
				npcHandler:say("Great! Now we can create a few more Tiaras. If only they weren't that expensive... Well anyway, please obtain one piece of royal steel, draconian steel and hell steel each.", cid)
				player:removeItem(5891, 5)
				player:setStorageValue(Storage.OutfitQuest.HunterHatAddon, 4)
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 7 then
			if player:getItemCount( 5887) >= 1 and player:getItemCount( 5888) >= 1 and player:getItemCount( 5889) >= 1  then
				npcHandler:say("Wow, I'm impressed, " .. player:getName() .. ". Your really are a valuable member of our paladin guild. I shall grant you your reward now. Wear it proudly!", cid)
				player:removeItem(5887, 1)
				player:removeItem(5888, 1)
				player:removeItem(5889, 1)
				player:setStorageValue(Storage.OutfitQuest.HunterHatAddon, 5)
				player:addOutfitAddon(129, 1)
				player:addOutfitAddon(137, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 8 then
			if player:getItemCount( 5875) >= 1 then
				npcHandler:say("Great! I hereby grant you the right to wear the sniper gloves as accessory. Congratulations!", cid)
				player:removeItem(5875, 1)
				player:setStorageValue(Storage.OutfitQuest.HunterBodyAddon, 1)
				player:addOutfitAddon(129, 2)
				player:addOutfitAddon(137, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				npcHandler.topic[cid] = 0				
			else
				npcHandler:say("You don't have it...", cid)
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] > 1 then
			npcHandler:say("Then no.", cid)
			npcHandler.topic[cid] = 0
		end
	return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())