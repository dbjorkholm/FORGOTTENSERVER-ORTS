local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local config = {
	["hardened bone"] = {
		value = 1, 
		message = {"How are you faring with your mission? Have you collected all 100 hardened bones?", "I'm surprised. That's pretty good for a man. Now, bring us the 100 turtle shells."}, 
		items = {5925, 100}
	},
	["turtle shell"] = {
		value = 2, 
		message = {"Did you get us 100 turtle shells so we can make new shields?", "Well done - for a man. These shells are enough to build many strong new shields. Thank you! Now - show me fighting spirit."}, 
		items = {5899, 100}
	},
	["fighting spirit"] = {
		value = 3, 
		message = {"So, can you show me your fighting spirit?", "Correct - pretty smart for a man. But the hardest task is yet to come: the claw from a lord among the dragon lords."},
		items = {5884, 1} 
	},
	["dragon claw"] = {
		value = 4, 
		message = {"Have you actually managed to obtain the dragon claw I asked for?", "You did it! I have seldom seen a man as courageous as you. I really have to say that you deserve to wear a spike. Go ask Cornelia to adorn your armour."},
		items = {10020, 1} 
	}
}

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	local storage = Storage.OutfitQuest.WarriorShoulderAddon

	if not npcHandler:isFocused(cid) then
		return false
	elseif isInArray({"outfit", "addon"}, msg) then
		npcHandler:say("Are you talking about my spiky shoulder pad? You can't buy one of these. They have to be {earned}.", cid)
	elseif msgcontains(msg, "earn") then
		if player:getStorageValue(storage) < 1 then
			npcHandler:say("I'm not sure if you are enough of a hero to earn them. You could try, though. What do you think?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(storage) >= 1 and player:getStorageValue(storage) < 5 then
			npcHandler:say("Before I can nominate you for an award, please complete your task.", cid)
		elseif player:getStorageValue(storage) == 5 then
			npcHandler:say("You did it! I have seldom seen a man as courageous as you. I really have to say that you deserve to wear a spike. Go ask Cornelia to adorn your armour.", cid)
		end
	elseif config[msg:lower()] then
		if player:getStorageValue(storage) == config[msg:lower()]["value"] then
			npcHandler:say(config[msg:lower()]["message"][1], cid)
			npcHandler.topic[cid] = 3
			message, itemId, amount = config[msg:lower()]["message"][2], config[msg:lower()]["items"][1], config[msg:lower()]["items"][2]
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({"Okay, who knows, maybe you have a chance. A really small one though. Listen up: ...", 
							"First, you have to prove your guts by bringing me 100 hardened bones. ...", 
							"Next, if you actually managed to collect that many, please complete a small task for our guild and bring us 100 turtle shells. ...", 
							"It is said that excellent shields can be created from these. ...", 
							"Alright, um, afterwards show me that you have fighting spirit. Any true hero needs plenty of that. ...", 
							"The last task is the hardest. You will need to bring me a claw from a mighty dragon king. ...", 
							"Did you understand everything I told you and are willing to handle this task?"}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			player:setStorageValue(storage, 1)
			player:setStorageValue(Storage.OutfitQuest.DefaultStart, 1) --this for default start of Outfit and Addon Quests
			npcHandler:say("Fine! First, you have to prove your guts by bringing me 100 hardened bones.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:getItemCount(itemId) >= amount then 
				player:removeItem(itemId, amount)
				player:setStorageValue(storage, math.max(0, (player:getStorageValue(storage) or 0)) + 1)
				npcHandler:say(message, cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0 
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] >= 1 then
			npcHandler:say("That's a pity.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|.")
npcHandler:addModule(FocusModule:new())
