local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

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
		elseif player:getStorageValue(storage) == 10 then
			npcHandler:say("Go to the academy in Edron and tell Zoltan that I sent you, player.", cid)
		else
			npcHandler:say("Before I can nominate you for an award, please complete your task.", cid)
		end
	elseif msgcontains(msg, "bat wings") then
		if player:getStorageValue(storage) == 1 then
			npcHandler:say("Oh, did you bring the 70 bat wings for me?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "red cloth") then
		if player:getStorageValue(storage) == 2 then
			npcHandler:say("Have you found 20 pieces of red cloth?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "ape fur") then
		if player:getStorageValue(storage) == 3 then
			npcHandler:say("Were you able to retrieve 40 pieces of ape fur?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "holy orchids") then
		if player:getStorageValue(storage) == 4 then
			npcHandler:say("Did you convince the elves to give you 35 holy orchids?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif msgcontains(msg, "spider silk yarn") then
		if player:getStorageValue(storage) == 5 then
			npcHandler:say(" Oh, did you bring 10 spools of spider silk yarn for me?", cid)
			npcHandler.topic[cid] = 7
		end
	elseif msgcontains(msg, "lizard scales") then
		if player:getStorageValue(storage) == 6 then
			npcHandler:say("Have you found 60 lizard scales?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif msgcontains(msg, "red dragon scales") then
		if player:getStorageValue(storage) == 7 then
			npcHandler:say("Were you able to get all 40 red dragon scales?", cid)
			npcHandler.topic[cid] = 9
		end
	elseif msgcontains(msg, "magic sulphur") then
		if player:getStorageValue(storage) == 8 then
			npcHandler:say("Have you collected 15 ounces of magic sulphur?", cid)
			npcHandler.topic[cid] = 10
		end
	elseif msgcontains(msg, "vampire dust") then
		if player:getStorageValue(storage) == 9 then
			npcHandler:say("Have you gathered 30 ounces of vampire dust?", cid)
			npcHandler.topic[cid] = 11
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({"Okay, great! You see, I need a few magical ingredients which I've run out of. First of all, please bring me 70 bat wings. ...", "Then, I urgently need a lot of red cloth. I think 20 pieces should suffice. ...", "Oh, and also, I could use a whole load of ape fur. Please bring me 40 pieces. ...", "After that, um, let me think... I'd like to have some holy orchids. Or no, many holy orchids, to be safe. Like 35. ...", "Then, 10 spools of spider silk yarn, 60 lizard scales and 40 red dragon scales. ...", "I know I'm forgetting something.. wait... ah yes, 15 ounces of magic sulphur and 30 ounces of vampire dust. ...", "That's it already! Easy task, isn't it? I'm sure you could get all of that within a short time. ...", "Did you understand everything I told you and are willing to handle this task?"}, cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			player:setStorageValue(storage, 1)
			npcHandler:say("Fine! Let's start with the 70 {bat wings}. I really feel uncomfortable out there in the jungle.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then -- bat wings
			if player:getItemCount(5894) >= 70 then 
				player:removeItem(5894, 70)
				player:setStorageValue(storage, 2)
				npcHandler:say("Thank you! I really needed them for my anti-wrinkle lotion. Now, please bring me 20 pieces of {red cloth}.", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then -- red cloth
			if player:getItemCount(5911) >= 20 then
				player:removeItem(5911, 20)
				player:setStorageValue(storage, 3)
				npcHandler:say("Great! This should be enough for my new dress. Don't forget to bring me 40 pieces of {ape fur} next!", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then -- ape fur
			if player:getItemCount(5883) >= 40 then
				player:removeItem(5883, 40)
				player:setStorageValue(storage, 4)
				npcHandler:say("Nice job, player. You see, I'm testing a new depilation cream. I guess if it works on ape fur it's good quality. Next, please bring me 35 {holy orchids}.", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 6 then -- holy orchids
			if player:getItemCount(5922) >= 35 then
				player:removeItem(5922, 35)
				player:setStorageValue(storage, 5)
				npcHandler:say("Thank god! The scent of holy orchids is simply the only possible solution against the horrible stench from the tavern latrine. Now, please bring me 10 rolls of {spider silk yarn}!", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then -- spider silk yarns
			if player:getItemCount(5886) >= 10 then
				player:removeItem(5886, 10)
				player:setStorageValue(storage, 6)
				npcHandler:say("I appreciate it. My pet doggie manages to bite through all sorts of leashes, which is why he is always gone. I'm sure this strong yarn will keep him. Now, go for the 60 {lizard scales}!", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 8 then -- lizard scales
			if player:getItemCount(5881) >= 60 then
				player:removeItem(5881, 60)
				player:setStorageValue(storage, 7)
				npcHandler:say("Good job. They will look almost like sequins on my new dress. Please go for the 40 {red dragon scales} now.", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 9 then -- red dragon scales
			if player:getItemCount(5882) >= 40 then
				player:removeItem(5882, 40)
				player:setStorageValue(storage, 8)
				npcHandler:say("Thanks! They make a pretty decoration, don't you think? Please bring me 15 ounces of {magic sulphur} now!", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 10 then -- magic sulphur
			if player:getItemCount(5904) >= 15 then
				player:removeItem(5904, 15)
				player:setStorageValue(storage, 9)
				npcHandler:say("Ah, that's enough magic sulphur for my new peeling. You should try it once, your skin gets incredibly smooth. Now, the only thing I need is {vampire dust}. 30 ounces will suffice.", cid)
			else
				npcHandler:say("No, no. That's not enough, I fear.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 11 then -- vampire dusts
			if player:getItemCount(5905) >= 30 then
				player:removeItem(5905, 30)
				player:setStorageValue(storage, 10)
				npcHandler:say("Ah, great. Now I can finally finish the potion which the academy of Edron asked me to. I guess, now you want your reward, don't you?", cid)
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