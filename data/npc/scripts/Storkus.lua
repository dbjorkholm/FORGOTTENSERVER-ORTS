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
 
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 200) == 6) then
			if(getPlayerStorageValue(cid, 208) < 0) then
				setPlayerStorageValue(cid, 208, 0)
			end
			if(getPlayerStorageValue(cid, 208) < 20) then
				npcHandler:say("So far ye've brought me " .. getPlayerItemCount(cid, 5905) .. " of 20 {vampire dusts}. Do ye' have any more with ye'? ", cid)
				talkState[talkUser] = 1
			elseif(getPlayerStorageValue(cid, 208) == 20) then
				npcHandler:say("Fine, you're done! Ye' should talk to me about your {mission} again now.", cid)
				talkState[talkUser] = 2
				setPlayerStorageValue(cid, 200, 7)
			end
		elseif(getPlayerStorageValue(cid, 200) == 7) then
			npcHandler:say({"While ye' were keeping the lower ranks busy, I could get valuable information about some vampire lords. ...","One of them is hiding somewhere beneath the Green Claw Swamp. I expect ye' to find him and kill him. ...","But be warned: Without good preparation, ye' might get into trouble. I hope for ye' he will be sleeping in his coffin when ye' arrive. ...","Before ye' open his coffin and drag that beast out to destroy it, I advise ye' to place some garlic necklaces on the stone slabs next to his coffin. That will weaken him considerably. ...","Bring me his ring as proof for his death. And now hurry and good hunt to ye'."}, cid, 0, 1, 5000)
			setPlayerStorageValue(cid, 200, 8)
			talkState[talkUser] = 0
		elseif(getPlayerStorageValue(cid, 200) == 8 or getPlayerStorageValue(cid, 200) == 9) then
			if(doPlayerRemoveItem(cid, 8752, 1)) then
				npcHandler:say({"Ding, dong, the vampire is dead, eh? So I guess ye' can return to Henricus and tell him that ye' finished your job here. I'm quite sure he has some more challenging task up his sleeve. ...","One more thing before ye' leave: I already mentioned the master vampires. ...","They are quite hard to find. If ye' stumble across one of them and manage to kill him, he will surely drop some token that proves his death. Bring me these tokens. ...","If ye' kill enough of them, I might have a little surprise for ye'."}, cid, 0, 1, 4000)
				setPlayerStorageValue(cid, 200, 10)
			else
				npcHandler:say("Have ye' killed the vampire lord? Because ye' have no his ring.", cid)
			end
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "vampire lord token") and getPlayerStorageValue(cid, 200) == 10) then
		if(getPlayerStorageValue(cid, 402) < 1) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 402) == 1) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 4
		elseif(getPlayerStorageValue(cid, 402) == 2) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 5
		elseif(getPlayerStorageValue(cid, 402) == 3) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 6
		elseif(getPlayerStorageValue(cid, 402) == 4) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 7
		elseif(getPlayerStorageValue(cid, 402) == 5) then
			npcHandler:say("Would ye' like to give me vampire tokens?", cid)
			talkState[talkUser] = 8
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			count = getPlayerItemCount(cid, 5905)
			requiredCount = 20 - getPlayerStorageValue(cid, 208)
			if(count > requiredCount) then
				count = requiredCount
			end
			setPlayerStorageValue(cid, 208, getPlayerStorageValue(cid, 208) + count)
			doPlayerRemoveItem(cid, 5905, count)
			npcHandler:say("Ye've brought me " .. count .. " vampire dusts. " .. (20 - getPlayerStorageValue(cid, 208)) == 0 and ("Ask me for a {mission} to continue your quest.") or ("Ye' need to bring " .. (20 - getPlayerStorageValue(cid, 208)) .. " more."), cid)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 9020) >= 1) then
				npcHandler:say("Ye' brought the token needed to advance to the first vampire hunter rank. I consider that a fluke, but still, congrats! Let me share some of my experience with ye'.", cid)
				setPlayerStorageValue(cid, 402, 1)
				doPlayerRemoveItem(cid, 9020, 1)
				doPlayerAddExp(cid, 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 4) then
			if(getPlayerItemCount(cid, 9020) >= 4) then
				npcHandler:say("Ye' brought the four tokens needed to advance to the second vampire hunter rank. Pretty lucky ye' are! Let me share some of my experience with ye'.", cid)
				setPlayerStorageValue(cid, 402, 2)
				doPlayerRemoveItem(cid, 9020, 4)
				doPlayerAddExp(cid, 5 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 5) then
			if(getPlayerItemCount(cid, 9020) >= 5) then
				npcHandler:say("Ye' brought the five tokens needed to advance to the third vampire hunter rank. Wow, you're pretty determined! Let me share some of my experience with ye'.", cid)
				setPlayerStorageValue(cid, 402, 3)
				doPlayerRemoveItem(cid, 9020, 5)
				doPlayerAddExp(cid, 10 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 6) then
			if(getPlayerItemCount(cid, 9020) >= 10) then
				npcHandler:say("Ye' brought the ten tokens needed to advance to the fourth vampire hunter rank. You're absolutely painstaking! Let me share some of my experience with ye'.", cid)
				setPlayerStorageValue(cid, 402, 4)
				doPlayerRemoveItem(cid, 9020, 10)
				doPlayerAddExp(cid, 20 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 7) then
			if(getPlayerItemCount(cid, 9020) >= 30) then
				npcHandler:say("Ye' brought the thirty tokens needed to advance to the fifth vampire hunter rank. You're completely obliterative, kid! Let me share some of my experience with ye'.", cid)
				setPlayerStorageValue(cid, 402, 5)
				doPlayerRemoveItem(cid, 9020, 30)
				doPlayerAddExp(cid, 50 * 1000, false, true)
			else
				npcHandler:say("Ye' don't have enought tokens.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 8) then
			if(getPlayerItemCount(cid, 9020) >= 50) then
				npcHandler:say("Ye' brought the fifty tokens needed to advance to the last vampire hunter rank. Now that's something. You're razing-amazing! Let me share some of my experience and a little something with ye'!", cid)
				setPlayerStorageValue(cid, 402, 6)
				doPlayerRemoveItem(cid, 9020, 50)
				doPlayerAddItem(cid, 9019, 1)
				doPlayerAddExp(cid, 100 * 1000, false, true)
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