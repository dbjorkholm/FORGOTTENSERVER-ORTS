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
	--npcHandler:say({"TextHere","Texthere"}, cid, 0, 1, TimeHere)
	local player = Player(cid)
 
	if(msgcontains(msg, "mission")) then
		if(player:getStorageValue(200) == 6) then
			if(player:getStorageValue(208) < 0) then
				player:setStorageValue(208, 0)
			end
			if(player:getStorageValue(208) < 20) then
				npcHandler:say("So far ye've brought me " .. player:getItemCount(5905) .. " of 20 {vampire dusts}. Do ye' have any more with ye'? ", cid)
				talkState[talkUser] = 1
			elseif(player:getStorageValue(208) == 20) then
				npcHandler:say("Fine, you're done! Ye' should talk to me about your {mission} again now.", cid)
				talkState[talkUser] = 2
				player:setStorageValue(200, 7)
				player:setStorageValue(12113, 2) -- The Inquisition Questlog- "Mission 3: Vampire Hunt"
			end
		elseif(player:getStorageValue(200) == 7) then
			npcHandler:say({"While ye' were keeping the lower ranks busy, I could get valuable information about some vampire lords. ...","One of them is hiding somewhere beneath the Green Claw Swamp. I expect ye' to find him and kill him. ...","But be warned: Without good preparation, ye' might get into trouble. I hope for ye' he will be sleeping in his coffin when ye' arrive. ...","Before ye' open his coffin and drag that beast out to destroy it, I advise ye' to place some garlic necklaces on the stone slabs next to his coffin. That will weaken him considerably. ...","Bring me his ring as proof for his death. And now hurry and good hunt to ye'."}, cid, 0, 1, 5000)
			player:setStorageValue(200, 8)
			player:setStorageValue(12113, 3) -- The Inquisition Questlog- "Mission 3: Vampire Hunt"
			talkState[talkUser] = 0
		elseif(player:getStorageValue(200) == 8 or player:getStorageValue(200) == 9) then
			if(player:removeItem(8752, 1)) then
				npcHandler:say({"Ding, dong, the vampire is dead, eh? So I guess ye' can return to Henricus and tell him that ye' finished your job here. I'm quite sure he has some more challenging task up his sleeve. ...","One more thing before ye' leave: I already mentioned the master vampires. ...","They are quite hard to find. If ye' stumble across one of them and manage to kill him, he will surely drop some token that proves his death. Bring me these tokens. ...","If ye' kill enough of them, I might have a little surprise for ye'."}, cid, 0, 1, 4000)
				player:setStorageValue(200, 10)
				player:setStorageValue(12113, 5) -- The Inquisition Questlog- "Mission 3: Vampire Hunt"
			else
				npcHandler:say("Have ye' killed the vampire lord? Because ye' have no his ring.", cid)
			end
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "vampire lord token") and player:getStorageValue(200) == 10) then
		if(player:getStorageValue(402) < 1) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 3
		elseif(player:getStorageValue(402) == 1) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 4
		elseif(player:getStorageValue(402) == 2) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 5
		elseif(player:getStorageValue(402) == 3) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 6
		elseif(player:getStorageValue(402) == 4) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 7
		elseif(player:getStorageValue(402) == 5) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 8
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			count = player:getItemCount(5905)
			requiredCount = 20 - player:getStorageValue(208)
			if(count > requiredCount) then
				count = requiredCount
			end
			player:setStorageValue(208, player:getStorageValue(208) + count)
			player:removeItem(5905, count)
			npcHandler:say("Ye've brought me " .. count .. " vampire dusts. " .. (20 - player:getStorageValue(208)) == 0 and ("Ask me for a {mission} to continue your quest.") or ("Ye' need to bring " .. (20 - player:getStorageValue(208)) .. " more."), cid)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			if(player:getItemCount(9020) >= 1) then
				npcHandler:say("Ye' brought the token needed to advance to the first vampire hunter rank. I consider that a fluke, but still, congrats! Let me share some of my experience with ye'.", cid)
				player:setStorageValue(402, 1)
				player:removeItem(9020, 1)
				player:addExperience( 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 4) then
			if(player:getItemCount(9020) >= 4) then
				npcHandler:say("Ye' brought the four tokens needed to advance to the second vampire hunter rank. Pretty lucky ye' are! Let me share some of my experience with ye'.", cid)
				player:setStorageValue(402, 2)
				player:removeItem(9020, 4)
				player:addExperience( 5 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 5) then
			if(player:getItemCount(9020) >= 5) then
				npcHandler:say("Ye' brought the five tokens needed to advance to the third vampire hunter rank. Wow, you're pretty determined! Let me share some of my experience with ye'.", cid)
				player:setStorageValue(402, 3)
				player:removeItem(9020, 5)
				player:addExperience( 10 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 6) then
			if(player:getItemCount(9020) >= 10) then
				npcHandler:say("Ye' brought the ten tokens needed to advance to the fourth vampire hunter rank. You're absolutely painstaking! Let me share some of my experience with ye'.", cid)
				player:setStorageValue(402, 4)
				player:removeItem(9020, 10)
				player:addExperience( 20 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 7) then
			if(player:getItemCount(9020) >= 30) then
				npcHandler:say("Ye' brought the thirty tokens needed to advance to the fifth vampire hunter rank. You're completely obliterative, kid! Let me share some of my experience with ye'.", cid)
				player:setStorageValue(402, 5)
				player:removeItem(9020, 30)
				player:addExperience( 50 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 8) then
			if(player:getItemCount(9020) >= 50) then
				npcHandler:say("Ye' brought the fifty tokens needed to advance to the last vampire hunter rank. Now that's something. You're razing-amazing! Let me share some of my experience and a little something with ye'!", cid)
				player:setStorageValue(402, 6)
				player:removeItem(9020, 50)
				player:addItem(9019, 1)
				player:addExperience( 100 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())