
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
	elseif msgcontains(msg, "cough syrup") then
		if player:getStorageValue(Storage.TheApeCity.Questline) == 5 then
			npcHandler:say("Do you want to buy a bottle of cough syrup for 50 gold?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 and player:removeMoney(50) then
			npcHandler:say("Thank you. Here it is.", cid)
			player:addItem(4839, 1)	
			player:setStorageValue(Storage.TheApeCity.Questline, 6)
			player:setStorageValue(Storage.TheApeCity.Mission02, 4) -- The Ape City Questlog - Mission 2: The Cure
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("You don't have enough money.", cid)
			npcHandler.topic[cid] = 0
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