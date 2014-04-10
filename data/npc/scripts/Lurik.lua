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
	if msgcontains(msg, "mission") then
		if player:getStorageValue(90) == 61 then
			npcHandler:say({"Ah! You did it! I can't wait to hear the sound... but I will do that in a silent moment. ...",
							"You helped as much in our research here. As a reward, you may use our astral portal in the upper room from now on. ...",
							"For just one orichalcum pearl, you can travel between Liberty Bay and Svargrond. Thank you again!"}, player, 0, 1, 3500)
			talkState[talkUser] = 0
			player:setStorageValue(90, 62)
		elseif player:getStorageValue(12001) == 32 then
			npcHandler:say({"You are the one who became an honorary barbarian! The one who made friends with the grim local musher and helped the shamans of Nibelor! The one they call old bearhugg ... erm ... I mean indeed I might have a mission for someone like you ...",
							"We are trying to find out what is happening in the raider camps. Through our connection to the shamans we could get a covered contact in their majorcamp far to the south. We equipped our contact with a memory crystal so he could report all he knew ...",
							"We need you to recover this crystal. Travel to the southern camp of the raiders and find our contact man there. Get the memory crystal and bring ithere. The society and the shamans will then decide our next steps. Do you think you can do this?"}, player, 0, 1, 3500)
			talkState[talkUser] = 1
		elseif player:getStorageValue(12001) == 33 then
			npcHandler:say("Have you retrieved the memory crystal?", player)
			talkState[talkUser] = 2
		elseif player:getStorageValue(12001) == 34 and player:getStorageValue(12009) > os.time() then
			npcHandler:say("Give me some more time!", player)
			talkState[talkUser] = 0
		elseif player:getStorageValue(12001) == 34 and player:getStorageValue(12009) < os.time() then
			npcHandler:say({"The information was quite useful. What worries me most are not the raiders but those that have driven them from the old mines...",
							"We need to investigate the mines. Most entrances collapsed due to the lack of maintenance but there should be some possibilities to get in ...",
							"In case you find a door, Ill tell you the old trick of the Carlin mining company to open it <whisper> <whisper>. Find some hint or someone who is willing to talk about what is going on there."}, player, 0, 1, 3500)
			talkState[talkUser] = 0
			player:setStorageValue(12001, 35)
			player:setStorageValue(12033, 1) -- Questlog The Ice Islands Quest, Formorgar Mines 1: The Mission
		end
	elseif msgcontains(msg, "yes") then
		if talkState[talkUser] == 1 then
			npcHandler:say("Excellent. Just report about your mission when you got the memory crystal.", player)
			player:setStorageValue(12001, 33)
			player:setStorageValue(12032, 2) -- Questlog The Ice Islands Quest, The Contact
			talkState[talkUser] = 0
		elseif talkState[talkUser] == 2 then
			if player:getItemCount(7281) >= 1 then
				npcHandler:say("Ah, great. Please give me some time to evaluate the information. Then talk to me again about your mission. ", player)
				player:setStorageValue(12001, 34)
				player:removeItem(7281, 1)
				player:setStorageValue(12032, 4) -- Questlog The Ice Islands Quest, The Contact
				player:setStorageValue(12009, os.time() + 5 * 60)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())