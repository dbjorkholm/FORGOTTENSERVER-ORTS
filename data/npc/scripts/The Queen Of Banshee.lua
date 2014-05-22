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
	elseif msgcontains(msg, "Seventh Seal") and npcHandler.topic[cid] == 0 then
		npcHandler:say("If you have passed the first six seals and entered the blue fires that lead to the chamber of the seal you might receive my {kiss} ... It will open the last seal. Do you think you are ready?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "kiss") and npcHandler.topic[cid] == 7 then
		if player:getStorageValue(50020) < 1 then
			npcHandler:say("Are you prepared to receive my kiss, even though this will mean that your death as well as a part of your soul will forever belong to me, my dear?", cid)
			npcHandler.topic[cid] = 8
		else
			npcHandler:say("You have already received my kiss. You should know better then to ask for it.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "spectral dress") then
		if player:getStorageValue(90) == 48 then
			npcHandler:say("Your wish for a spectral dress is silly. Although I will grant you the permission to take one. My maidens left one in a box in a room, directly south of here.", cid)
			player:setStorageValue(90, 49)
		end
	elseif msgcontains(msg, "addon") then
		if player:getStorageValue(1003) == 5 then
			npcHandler:say("Say... I have been longing for something for an eternity now... if you help me retrieve it, I will reward you. Do you consent to this arrangement?", cid)
			npcHandler.topic[cid] = 9
		end
	elseif msgcontains(msg, "orchid") then
		if player:GetStorageValue(1003) == 6 then
			npcHandler:say("Have you really brought me 50 holy orchids?", cid)
			npcHandler.topic[cid] = 11
		end	
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getStorageValue(50016) == 1 then
				npcHandler:say("The Queen of the Banshee: Yessss, I can sense you have passed the seal of sacrifice. Have you passed any other seal yet?", cid)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say("You have not passed the seal of sacrifice yet. Return to me when you are better prepared.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:getStorageValue(50013) == 1 then
				npcHandler:say("The Queen of the Banshee: I sense you have passed the hidden seal as well. Have you passed any other seal yet?", cid)
				npcHandler.topic[cid] = 3
			else
				npcHandler:say("You have not found the hidden seal yet. Return when you are better prepared.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			if player:getStorageValue(50019) == 1 then
				npcHandler:say("The Queen of the Banshee: Oh yes, you have braved the plague seal. Have you passed any other seal yet?", cid)
				npcHandler.topic[cid] = 4
			else
				npcHandler:say("You have not faced the plagueseal yet. Return to me when you are better prepared.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 then
			if player:getStorageValue(50018) == 1 then
				npcHandler:say("The Queen of the Banshee: Ah, I can sense the power of the seal of demonrage burning in your heart. Have you passed any other seal yet?", cid)
				npcHandler.topic[cid] = 5
			else
				npcHandler:say("You are not filled with the fury of the imprisoned demon. Return when you are better prepared.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 5 then
			if player:getStorageValue(50015) == 1 then
				npcHandler:say("The Queen of the Banshee: So, you have managed to pass the seal of the true path. Have you passed any other seal yet?", cid)
				npcHandler.topic[cid] = 6
			else
				npcHandler:say("You have not found your true path yet. Return when you are better prepared.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 6 then
			if player:getStorageValue(50014) == 1 then
				npcHandler:say("The Queen of the Banshee: I see! You have mastered the seal of logic. You have made the sacrifice, you have seen the unseen, you possess fortitude, you have filled yourself with power and found your path. You may ask me for my {kiss} now.", cid)
				npcHandler.topic[cid] = 7
			else
				npcHandler:say("You have not found your true path yet. Return to meh when you are better prepared.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 8 then
			if not player:isPzLocked() then
				npcHandler:say("So be it! Hmmmmmm...", cid)
				npcHandler.topic[cid] = 0
				player:teleportTo({x = 32202, y = 31812, z = 8}, false)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:setStorageValue(50020, 1)
			else
				npcHandler:say("You have spilled too much blood recently and the dead are hungry for your soul. Perhaps return when you regained you inner balance.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 9 then
			npcHandler:say({"Listen... there are no blooming flowers down here and the only smell present is that of death and decay. ...", "I wish that I could breathe the lovely smell of beautiful flowers just one more time, especially those which elves cultivate. ...", "Could you please bring me 50 holy orchids?"}, cid, 0, 1, 4000)
			npcHandler.topic[cid] = 10
		elseif npcHandler.topic[cid] == 10 then
			npcHandler:say("Thank you. I will wait for your return.", cid)
			player:setStorageValue(1003, 6)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 11 then
			if player:removeItem(5922, 50) then
				npcHandler:say("Thank you! You have no idea what that means to me. As promised,here is your reward... as a follower of Zathroth, I hope that you will like this accessory.", cid)
				player:setStorageValue(1003, 7)
				player:addOutfitAddon(player:getSex() == 0 and 149 or 145, 2)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You need 50 holy orchid.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] >= 1 and npcHandler.topic[cid] <= 7 then
			npcHandler:say("Then try to be better prepared next time we meet.", cid)
		elseif npcHandler.topic[cid] == 8 then
			npcHandler:say("Perhaps it is the better choice for you, my dear.", cid)
		end		
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())