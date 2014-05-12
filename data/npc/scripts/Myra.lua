local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local config = {
	["bat wings"] = {
		value = 1, 
		message = {"Oh, did you bring the 70 bat wings for me?", "Thank you! I really needed them for my anti-wrinkle lotion. Now, please bring me 20 pieces of {red cloth}."}, 
		items = {5894, 70}
	},
	["red cloth"] = {
		value = 2, 
		message = {"Have you found 20 pieces of red cloth?", "Great! This should be enough for my new dress. Don't forget to bring me 40 pieces of {ape fur} next!"}, 
		items = {5911, 20}
	},
	["ape fur"] = {
		value = 3, 
		message = {"Were you able to retrieve 40 pieces of ape fur?", "Nice job, player. You see, I'm testing a new depilation cream. I guess if it works on ape fur it's good quality. Next, please bring me 35 {holy orchids}."},
		items = {5883, 40} 
	},
	["holy orchids"] = {
		value = 4, 
		message = {"Did you convince the elves to give you 35 holy orchids?", "Thank god! The scent of holy orchids is simply the only possible solution against the horrible stench from the tavern latrine. Now, please bring me 10 rolls of {spider silk yarn}!"},
		items = {5922, 35} 
	},
	["spider silk yarn"] = {
		value = 5,
		message = {"Oh, did you bring 10 spools of spider silk yarn for me?", "I appreciate it. My pet doggie manages to bite through all sorts of leashes, which is why he is always gone. I'm sure this strong yarn will keep him. Now, go for the 60 {lizard scales}!"},
		items = {5886, 10}
	},
	["lizard scales"] = {
		value = 6, 
		message = {"Have you found 60 lizard scales?", "Good job. They will look almost like sequins on my new dress. Please go for the 40 {red dragon scales} now."},
		items = {5881, 60}
	},
	["red dragon scales"] = {
		value = 7, 
		message = {"Were you able to get all 40 red dragon scales?", "Thanks! They make a pretty decoration, don't you think? Please bring me 15 ounces of {magic sulphur} now!"},
		items = {5882, 40}
	},
	["magic sulphur"] = {
		value = 8, 
		message = {"Have you collected 15 ounces of magic sulphur?", "Ah, that's enough magic sulphur for my new peeling. You should try it once, your skin gets incredibly smooth. Now, the only thing I need is {vampire dust}. 30 ounces will suffice."}, 
		items = {5904, 15} 
	},
	["vampire dust"] = {
		value = 9, 
		message = {"Have you gathered 30 ounces of vampire dust?", "Ah, great. Now I can finally finish the potion which the academy of Edron asked me to. I guess, now you want your reward, don't you?"},
		items = {5905, 30}
	}
}

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	local storage = 50011
	
	if not npcHandler:isFocused(cid) then
		return false
	elseif isInArray({"outfit", "addon"}, msg) then
		npcHandler:say("This {Tiara} is an award by the academy of Edron in recognition of my service here.", cid)
	elseif msgcontains(msg, "tiara") then
		if player:getStorageValue(storage) < 1 then
			npcHandler:say("Well... maybe, if you help me a little, I could convince the academy of Edron that you are a valuable help here and deserve an award too. How about it?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(storage) >= 1 and player:getStorageValue(storage) < 10 then
			npcHandler:say("Before I can nominate you for an award, please complete your task.", cid)
		elseif player:getStorageValue(storage) == 10 then
			npcHandler:say("Go to the academy in Edron and tell Zoltan that I sent you, player.", cid)
		end
	elseif config[msg:lower()] then
		if player:getStorageValue(storage) == config[msg:lower()]["value"] then
			npcHandler:say(config[msg:lower()]["message"][1], cid)
			npcHandler.topic[cid] = 3
			message, itemId, amount = config[msg:lower()]["message"][2], config[msg:lower()]["items"][1], config[msg:lower()]["items"][2]
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({"Okay, great! You see, I need a few magical ingredients which I've run out of. First of all, please bring me 70 bat wings. ...", "Then, I urgently need a lot of red cloth. I think 20 pieces should suffice. ...", "Oh, and also, I could use a whole load of ape fur. Please bring me 40 pieces. ...", "After that, um, let me think... I'd like to have some holy orchids. Or no, many holy orchids, to be safe. Like 35. ...", "Then, 10 spools of spider silk yarn, 60 lizard scales and 40 red dragon scales. ...", "I know I'm forgetting something.. wait... ah yes, 15 ounces of magic sulphur and 30 ounces of vampire dust. ...", "That's it already! Easy task, isn't it? I'm sure you could get all of that within a short time. ...", "Did you understand everything I told you and are willing to handle this task?"}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			player:setStorageValue(storage, 1)
			npcHandler:say("Fine! Let's start with the 70 {bat wings}. I really feel uncomfortable out there in the jungle.", cid)
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

npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, |PLAYERNAME|.")
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())