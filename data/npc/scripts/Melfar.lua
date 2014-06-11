dofile('data/lib/StorageValues.lua')
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
	elseif(msgcontains(msg, "mission")) then
		if(player:getStorageValue(TheNewFrontier.Questline) == 4) then
			npcHandler:say(
						{
						"Ha! Men and wood you say? Well, I might be able to relocate some of our miners to the base. Acquiring wood is an entirely different matter though. ... ",
						"I can't spare any men for woodcutting right now but I have an unusual idea that might help. ... ",
						"As you might know, this area is troubled by giant beavers. Once a year, the miners decide to have some fun, so they lure the beavers and jump on them to have some sort of rodeo. ... ",
						"However, I happen to have some beaver bait left from the last year's competition. ... ",
						"If you place it on trees on some strategic locations, we could let the beavers do the work and later on, I'll send men to get the fallen trees. ... ",
						"Does this sound like something you can handle? "
						}, player, true)
			npcHandler.topic[cid] = 1
		elseif(player:getStorageValue(TheNewFrontier.Questline) == 6) then
			npcHandler:say("Yes, I can hear them even from here. It has to be a legion of beavers! I'll send the men to get the wood as soon as their gnawing frenzy has settled! You can report to Ongulf that men and wood will be on their way!", player)
			player:setStorageValue(TheNewFrontier.Questline, 7)
			player:setStorageValue(TheNewFrontier.Mission02, 6) --Questlog, The New Frontier Quest "Mission 02: From Kazordoon With Love"
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say(	
						{
							"So take this beaver bait. It will work best on dwarf trees. I'll mark the three trees on your map. Here .. here .. and here! So now mark those trees with the beaver bait. ... ",
							"If you're unlucky enough to meet one of the giant beavers, try to stay calm. Don't do any hectic moves, don't yell, don't draw any weapon, and if you should carry anything wooden on you, throw it away as far as you can. "
						}, player, true)
			player:setStorageValue(TheNewFrontier.Questline, 5)
			player:setStorageValue(TheNewFrontier.Mission02, 2) --Questlog, The New Frontier Quest "Mission 02: From Kazordoon With Love"
			player:addItem(11100, 1)
			player:addMapMark({x = 32474, y = 31947, z = 7}, 2, "Tree 1")
			player:addMapMark({x = 32515, y = 31927, z = 7}, 2, "Tree 2")
			player:addMapMark({x = 32458, y = 31997, z = 7}, 2, "Tree 3")
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then 
			if player:removeMoney(100) then
				player:addItem(11100, 1)	
				npcHandler:say("Here you go.", player)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You dont have enough of gold coins.", player)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, "buy flask") or msgcontains(msg, "flask") then
		if player:getStorageValue(TheNewFrontier.Questline) == 5 then
			npcHandler:say("You want to buy a Flask with Beaver Bait for 100 gold coins?", player)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Im out of stock.", player)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
