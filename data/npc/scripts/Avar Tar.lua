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
	elseif msgcontains(msg, "outfit") then
		if npcHandler.topic[cid] < 0  then
			npcHandler:say({"I'm tired of all these young unskilled wannabe heroes. Every Tibian can show his skills or actions by wearing a special outfit. To prove oneself worthy of the demon outfit, this is how it goes: ...",
					"The base outfit will be granted for completing the annihilator quest, which isn't much of a challenge nowadays, in my opinion. Anyway ...",
					"The shield however will only be granted to those adventurers who have finished the demon helmet quest. ...",
					"Well, the helmet is for those who really are tenacious and have hunted down all 6666 demons and finished the demon oak as well. ...",
					"Are you interested?"
					}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "base") then
		if npcHandler.topic[cid] == 2 then
			if player:getStorageValue(2215) == 1 then
				player:addOutfit(541, 0)
				player:addOutfit(542, 0)
				player:setStorageValue(2215, 2)
				npcHandler:say("Receive the base outfit, " .. player:getName() .. ".", cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "shield") then
		if npcHandler.topic[cid] == 2 then
			if player:getStorageValue(2215) == 2 and player:getStorageValue(2217) == 1 then
				player:addOutfitAddon(541, 1)
				player:addOutfitAddon(542, 1)
				npcHandler:say("Receive the shield, " .. player:getName() .. ".", cid)
				player:setStorageValue(2217, 2)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "helmet") then
		if npcHandler.topic[cid] == 2 then
			if player:getStorageValue(2215) == 2 and player:getStorageValue(Storage.DemonOak.Done) == 3 then
				player:addOutfitAddon(541, 2)
				player:addOutfitAddon(542, 2)
				player:setStorageValue(Storage.DemonOak.Done, 4)
				npcHandler:say("Receive the helmet, " .. player:getName() .. ".", cid)
			end
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("So you want to have the demon outfit, hah! Let's have a look first if you really deserve it. Tell me: {base}, {shield} or {helmet}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())