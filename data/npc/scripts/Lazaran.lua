
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, "mission") and player:getStorageValue(Storage.TheNewFrontier.Questline) == 9 then
		npcHandler:say("Me people wanting peace. No war with others. No war with little men. We few. We weak. Need help. We not wanting make war. No hurt.", cid)
		player:setStorageValue(Storage.TheNewFrontier.Questline, 10)
		player:setStorageValue(Storage.TheNewFrontier.Mission03, 2) --Questlog, The New Frontier Quest "Mission 03: Strangers in the Night"
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "help") and player:getStorageValue(Storage.UnnaturalSelection.Questline) < 1 then
	npcHandler:say(	
			{
				"Big problem we have! Skull of first leader gone. He ancestor of whole tribe but died long ago in war. We have keep his skull on our sacred place. ...",
				"Then one night, green men came with wolves... and one of wolves took skull and ran off chewing on it! We need back - many wisdom and power is in skull. Maybe they took to north fortress. But can be hard getting in. You try get our holy skull back?"
			}, cid)
	npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "mission") and player:getStorageValue(Storage.UnnaturalSelection.Questline) >= 1 then
		if player:getStorageValue(Storage.UnnaturalSelection.Questline) == 1 then
			npcHandler:say("Oh! You found holy skull? In bone pile you found?! Thank Pandor you brought! Me can have it back?", cid)
			npcHandler.topic[cid] = 2
		elseif player:getStorageValue(Storage.UnnaturalSelection.Questline) == 2 then
			npcHandler:say("work in process", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("You hero of our tribe if bring back holy skull!", cid)
			player:setStorageValue(Storage.UnnaturalSelection.Questline, 1)
			player:setStorageValue(Storage.UnnaturalSelection.Mission01, 1) --Questlog, Unnatural Selection Quest "Mission 1: Skulled"
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			if player:removeItem(11134, 1) then --remove tome
				npcHandler:say("Me thank you much! All wisdom safe again now.", cid)
				player:setStorageValue(Storage.UnnaturalSelection.Questline, 2)
				player:setStorageValue(Storage.UnnaturalSelection.Mission01, 3) --Questlog, Unnatural Selection Quest "Mission 1: Skulled"
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You do not have it!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
