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
		if player:getStorageValue(1004) < 1 then
			npcHandler:say("What are you thinking! I would never allow you to slay my beloved friends for the sake of your narcism. Only {Faolan} can grant you a fur like this one.", player)
			talkState[talkUser] = 2
		end
	elseif msgcontains(msg, "faolan") then
		if talkState[talkUser] == 2 then
			npcHandler:say("I know where the great wolf mother lives, but I will not tell that to just anyone. You have to earn my respect first. Are you willing to help me?", player)
			talkState[talkUser] = 3
		elseif player:getStorageValue(1004) == 8 then
			npcHandler:say("Right, I will keep my promise. Faolan roams Tibia freely, but her favourite sleeping cave is on Cormaya. I will now enchant you so you will be able to speak the wolf language.", player)
			player:setStorageValue(1004, 9)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "griffinclaw") or msgcontains(msg, "container") then
		if player:getStorageValue(1004) == 1 then
			npcHandler:say("Were you able to obtain a sample of the Griffinclaw?", player)
			talkState[talkUser] = 5
		end
	elseif msgcontains(msg, "task") then
		if player:getStorageValue(1004) == 2 then
			npcHandler:say({"Listen, my next task for you is not exactly easy either. ...",
							"In the mountains between Ankrahmun and Tiquanda are two hydra lairs. The nothern one has many waterfalls whereas the southern one has just tiny water trickles. ...",
							"However, these trickles are said to contain water as pure and clean as nowhere else in Tibia. ...",
							"If you could reach one of these trickles and retrieve a water sample for me, it would be a great help. ...",
							"It is important that you take the water directly from the trickle, not from the pond - else it will not be as pure anymore. ...",
							"Have you understood everything I told you and will fulfil this task for me?"}, player, 0, 1, 4000)
			talkState[talkUser] = 6
		elseif player:getStorageValue(1004) == 4 then
			npcHandler:say({"I'm glad that you are still with me, " .. getPlayerName(cid) .. ". Especially because my next task might require even more patience from your side than the ones before. ...",
							"Demons... these unholy creatures should have never been able to walk the earth. They are a brood fueled only by hatred and malice. ...",
							"Even if slain, their evil spirit is not fully killed. It needs a blessed stake to release their last bit of fiendishness and turn them into dust. ...",
							"It does not work all the time, but if you succeed, their vicious spirit is finally defeated. ...",
							"I want proof that you are on the right side, against Zathroth. Bring me 100 ounces of demon dust and I shall be convinced. ...",
							"You will probably need to ask a priest for help to obtain a blessed stake. ...",
							"Have you understood everything I told you and will fulfil this task for me?"}, player, 0, 1, 4000)
			talkState[talkUser] = 8
		elseif player:getStorageValue(1004) == 6 then
			npcHandler:say({"I have one final task for you, " .. getPlayerName(cid) .. ". Many months ago, I was trying to free the war wolves which are imprisoned inside the orc fortress.",
							"Unfortunately, my intrusion was discovered and I had to run for my life. During my escape, I lost my favourite wolf tooth chain.",
							"It should still be somewhere in the fortress, if the orcs did not try to eat it. I really wish you could retrieve it for me.",
							"It has the letter 'C' carved into one of the teeth. Please look for it.",
							"Have you understood everything I told you and will fulfil this task for me?"}, player, 0, 1, 4000)
			talkState[talkUser] = 10
		end
	elseif msgcontains(msg, "waterskin") then
		if player:getStorageValue(1004) == 3 then
			npcHandler:say("Did you bring me a sample of water from the hydra cave?", player)
			talkState[talkUser] = 7
		end
	elseif msgcontains(msg, "dust") then
		if player:getStorageValue(1004) == 5 then
			npcHandler:say("Were you really able to collect 100 ounces of demon dust?", player)
			talkState[talkUser] = 9
		end
	elseif msgcontains(msg, "chain") then
		if player:getStorageValue(1004) == 7 then
			npcHandler:say("Have you really found my wolf tooth chain??", player)
			talkState[talkUser] = 11
		end
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 3 then	
			npcHandler:say({"I hope that I am not asking too much of you with this task. I heard of a flower which is currently unique in Tibia and can survive at only one place. ...",
							"This place is somewhere in the bleak mountains of Nargor. I would love to have a sample of its blossom, but the problem is that it seldom actually blooms. ...",
							"I cannot afford to travel there each day just to check whether the time has already come, besides I have no idea where to start looking. ...",
							"I would be deeply grateful if you could support me in this matter and collect a sample of the blooming Griffinclaw for me. ...",
							"Have you understood everything I told you and will fullfil this task for me?"}, player, 0, 1, 4000)
			talkState[talkUser] = 4
		elseif talkState[talkUser] == 4 then	
			npcHandler:say("Alright then. Take this botanist's container and return to me once you were able to retrieve a sample. Don't lose patience!", player)
			player:setStorageValue(1004, 1)
			player:setStorageValue(12010, 1) --this for default start of Outfit and Addon Quests
			player:addItem( 4869, 1)
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 5 then
			if player:getItemCount(5937) >= 1 then
				npcHandler:say("Crunor be praised! The Griffinclaw really exists! Now, I will make sure that it will not become extinct. If you are ready to help me again, just ask me for a {task}.", player)
				player:removeItem( 5937, 1)
				player:setStorageValue(1004, 2)
				talkState[talkUser] = 0	
			end
		elseif talkState[talkUser] == 6 then	
			npcHandler:say("Great! Here, take my waterskin and try to fill it with water from this special trickle. Don't lose my waterskin, I will not accept some random dirty waterskin.", player)
			player:setStorageValue(1004, 3)
			player:addItem( 5938, 1)
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 7 then
			if player:getItemCount(5939) >= 1 then
				npcHandler:say("Good work, " .. getPlayerName(cid) .. "! This water looks indeed extremely clear. I will examine it right away. If you are ready to help me again, just ask me for a {task}.", player)
				player:removeItem(5939, 1)
				player:setStorageValue(1004, 4)
				talkState[talkUser] = 0	
			end
		elseif talkState[talkUser] == 8 then	
			npcHandler:say("Good! I will eagerly await your return.", player)
			player:setStorageValue(1004, 5)
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 9 then
			if player:getItemCount(6550) >= 100 then
				npcHandler:say("I'm very impressed, " .. getPlayerName(cid) .. ". With this task you have proven that you are on the right side and are powerful as well. If you are ready to help me again, just ask me for a {task}.", player)
				player:removeItem( 6550, 100)
				player:setStorageValue(1004, 6)
				talkState[talkUser] = 0	
			end	
		elseif talkState[talkUser] == 10 then	
			npcHandler:say("Thank you so much. I can't wait to wear it around my neck again, it was a special present from Faolan.", player)
			player:setStorageValue(1004, 7)
			talkState[talkUser] = 0	
		elseif talkState[talkUser] == 11 then
			if player:getItemCount(5940) >= 1 then
				npcHandler:say("Crunor be praised! You found my beloved chain! " .. getPlayerName(cid) .. ", you really earned my respect and I consider you as a friend from now on. Remind me to tell you about {Faolan} sometime.", player)
				player:removeItem( 5940, 1)
				player:setStorageValue(1004, 8)
				talkState[talkUser] = 0	
			end		
	
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())