local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(12120) < 1 then
			npcHandler:say("These are dire times for our people. Problems plenty are in this times. But me people not grant trust easy. Are you willing to prove you friend of ape people?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(12120) == 1 then
			npcHandler:say("Oh, you brought me whisper moss? Good hairless ape you are! Can me take it?", cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(12120) == 2 then
			npcHandler:say({"Whisper moss strong is, but me need liquid that humans have to make it work ...",
							"Our raiders brought it from human settlement, it's called cough syrup. Go ask healer there for it."}, cid, 0, 1, 3000)
			player:setStorageValue(12120, 3)
			player:setStorageValue(12122, 1) -- The Ape City Questlog - Mission 2: The Cure
		elseif player:getStorageValue(12120) >= 3 and player:getStorageValue(12120) <= 6 then
			npcHandler:say("You brought me that cough syrup from human healer me asked for?", cid)
			npcHandler.topic[cid] = 4
		elseif player:getStorageValue(12120) == 7 then
			npcHandler:say("Quest Work in process", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then	
				npcHandler:say("To become friend of ape people a long and difficult way is. We do not trust easy but help is needed. Will you listen to story of Hairycles?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then	
			npcHandler:say({"So listen, little ape was struck by plague. Hairycles not does know what plague it is. That is strange. Hairycles should know. But Hairycles learnt lots and lots ...",
							"Me sure to make cure so strong to drive away all plague. But to create great cure me need powerful components ...",
							"Me need whisper moss. Whisper moss growing south of human settlement is. Problem is, evil little dworcs harvest all whisper moss immediately ...",
							"Me know they hoard some in their underground lair. My people raided dworcs often before humans came. So we know the moss is hidden in east of upper level of dworc lair ...",
							"You go there and take good moss from evil dworcs. Talk with me about mission when having moss."}, cid, 0, 1, 4000)
			player:setStorageValue(12120, 1)
			player:setStorageValue(12121, 1) -- The Ape City Questlog - Mission 1: Whisper Moss
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:getItemCount(4838) >= 1 then
				player:removeItem(4838, 1)
				npcHandler:say("Ah yes! That's it. Thank you for bringing mighty whisper moss to Hairycles. It will help but still much is to be done. Just ask for other {mission} if you ready.", cid)
				player:setStorageValue(12120, 2)
				player:setStorageValue(12121, 3) -- The Ape City Questlog - Mission 1: Whisper Moss
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getItemCount(4839) >= 1 then
				player:removeItem(4839, 1)
				npcHandler:say("You so good! Brought syrup to me! Thank you, will prepare cure now. Just ask for mission if you want help again.", cid)
				player:setStorageValue(12120, 7)
				player:setStorageValue(12122, 5) -- The Ape City Questlog - Mission 2: The Cure
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