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
		if player:getStorageValue(Storage.OutfitQuest.KnightHatAddon) < 1 then
			npcHandler:say("Only the bravest warriors may wear adorned helmets. They are traditionally awarded after having completed a difficult {task} for our guild.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "Task") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("You mean, you would like to prove that you deserve to wear such a helmet?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "fang") or msgcontains(msg, "behemoth") then
		if player:getStorageValue(Storage.OutfitQuest.KnightHatAddon) == 1 then
			npcHandler:say("Have you really managed to fulfil the task and brought me 100 perfect behemoth fangs?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "helmet") then
		if player:getStorageValue(Storage.OutfitQuest.KnightHatAddon) == 2 then
			npcHandler:say("Did you recover the helmet of Ramsay the Reckless?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "sweat")  or msgcontains(msg, "flask") then
		if player:getStorageValue(Storage.OutfitQuest.KnightHatAddon) == 3 then
			npcHandler:say("Were you able to get hold of a flask with pure warrior's sweat?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "steel") then
		if player:getStorageValue(Storage.OutfitQuest.KnightHatAddon) == 4 then
			npcHandler:say("Ah, have you brought the royal steel?", cid)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 2 then	
			npcHandler:say({"Well then, listen closely. First, you will have to prove that you are a fierce and restless warrior by bringing me 100 perfect behemoth fangs. ...",
							"Secondly, please retrieve a helmet for us which has been lost a long time ago. The famous Ramsay the Reckless wore it when exploring an ape settlement. ...",
							"Third, we need a new flask of warrior's sweat. We've run out of it recently, but we need a small amount for the show battles in our arena. ...",
							"Lastly, I will have our smith refine your helmet if you bring me royal steel, an especially noble metal. ...",
							"Did you understand everything I told you and are willing to handle this task?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 3
		elseif npcHandler.topic[cid] == 3 then	
			npcHandler:say("Alright then. Come back to me once you have collected 100 perfect behemoth fangs.", cid)
			player:setStorageValue(Storage.OutfitQuest.KnightHatAddon, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if player:getItemCount(5893) >= 100 then
				npcHandler:say("I'm deeply impressed, (brave Knight) " .. player:getName() .. ". (Even if you are not a knight, you certainly possess knight qualities.) Now, please retrieve Ramsay's helmet.", cid)
				player:removeItem(5893, 100)
				player:setStorageValue(Storage.OutfitQuest.KnightHatAddon, 2)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:getItemCount(5924) >= 1 then
				npcHandler:say("Good work, (brave Knight) " .. player:getName() .. "! Even though it is damaged, it has a lot of sentimental value. Now, please bring me warrior's sweat.", cid)
				player:removeItem(5924, 1)
				player:setStorageValue(Storage.OutfitQuest.KnightHatAddon, 3)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:getItemCount(5885) >= 1 then
				npcHandler:say("Now that is a pleasant surprise, (brave Knight) " .. player:getName() .. "! There is only one task left now: Obtain royal steel to have your helmet refined.", cid)
				player:removeItem(5885, 1)
				player:setStorageValue(Storage.OutfitQuest.KnightHatAddon, 4)
				npcHandler.topic[cid] = 0	
			end
		elseif npcHandler.topic[cid] == 7 then
			if player:getItemCount(5887) >= 1 then
				npcHandler:say("You truly deserve to wear an adorned helmet, (brave Knight) " .. player:getName() .. ". Please talk to Sam and tell him I sent you. I'm sure he will be glad to refine your helmet.", cid)
				player:removeItem(5887, 1)
				player:setStorageValue(Storage.OutfitQuest.KnightHatAddon, 5)
				npcHandler.topic[cid] = 0	
			end
		end
	end
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
