
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
			npcHandler:say(	
			{
				"You brought back skull of first leader. Hero of tribe! But we more missions to do. ...",
				"Me and Ulala talk about land outside. We wanting to see more of land! Land over big water! But us no can leave tribe. No can cross water. Only way is skull of first leader. ...",
				"What holy skull sees, tribe sees. That we believe. Can you bring holy skull over big water and show places?"
			}, cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(Storage.UnnaturalSelection.Questline) == 3 then
			npcHandler:say("You say you was to where sun is hot and burning? And where trees grow as high as mountain? And where Fasuon cries white tears? Me can't wait to see!! Can have holy skull back?", cid)
			npcHandler.topic[cid] = 4
		elseif player:getStorageValue(Storage.UnnaturalSelection.Questline) == 4 then
			npcHandler:say("work in process", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("You hero of our tribe if bring back holy skull!", cid)
			player:setStorageValue(Storage.UnnaturalSelection.Questline, 1)
			player:setStorageValue(Storage.UnnaturalSelection.Mission01, 1) --Questlog, Unnatural Selection Quest "Mission 1: Skulled"
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			if player:removeItem(11076, 1) then
				npcHandler:say("Me thank you much! All wisdom safe again now.", cid)
				player:setStorageValue(Storage.UnnaturalSelection.Questline, 2)
				player:setStorageValue(Storage.UnnaturalSelection.Mission01, 3) --Questlog, Unnatural Selection Quest "Mission 1: Skulled"
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You do not have it!", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say("Here take holy skull. You bring where you think is good. See as much as possible! See where other people live!", cid)
			player:addItem(11076, 1)
			player:setStorageValue(Storage.UnnaturalSelection.Questline, 3)
			player:setStorageValue(Storage.UnnaturalSelection.Mission02, 1) --Questlog, Unnatural Selection Quest "Mission 2: All Around the World"
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if player:getStorageValue(Storage.UnnaturalSelection.Mission02) == 12 and player:getItemCount(11076) >= 1 then
				npcHandler:say("We make big ritual soon and learn much about world outside. Me thank you many times for teaching us world. Very wise and adventurous you are!", cid)
				player:removeItem(11076, 1)
				player:setStorageValue(Storage.UnnaturalSelection.Questline, 4)
				player:setStorageValue(Storage.UnnaturalSelection.Mission02, 13) --Questlog, Unnatural Selection Quest "Mission 2: All Around the World"
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("The skull have not seen all yet!", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
