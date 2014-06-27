local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)
	if(msgcontains(msg, "mission")) then
		if player:getStorageValue(900) >= 16 and player:getStorageValue(900) < 17 then
			npcHandler:say("For your rank there are two missions available: matchmaker and golem repair. You can undertake each mission, but you can turn in a specific mission only once every 20 hours. ", cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(900) >= 17 then
			npcHandler:say("For your rank there are four missions available: matchmaker, golem repair, spore gathering and grindstone hunt. You can undertake each mission, but you can turn in a specific mission only once every 20 hours.", cid)
			npcHandler.topic[cid] = 0
		end
	--  Matchmaker
	elseif(msgcontains(msg, "matchmaker")) then
		if player:getStorageValue(942) < 1 and player:getStorageValue(944) < os.time() and player:getStorageValue(900) >= 16 then
			npcHandler:say("You will have to find a lonely crystal a perfect match. I don't understand the specifics but the gnomes told me that even crystals need a mate to produce offspring. ... ", cid)
			npcHandler:say("Be that as it may, in this package you'll find a crystal. Take it out of the package and go to the crystal caves to find it a mate. Just look out for huge red crystals and try your luck. ... ", cid)
			npcHandler:say("They should look like one of those seen in your soul melody test. You will find them in the crystal grounds. Report back to me when you are done. ", cid)
			player:setStorageValue(942, 1)
			player:setStorageValue(943, 0)
			player:addItem(18313, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2) then
			if player:getStorageValue(943) == 1 and player:getItemCount(18312) >= 1 then
				player:removeItem(18312, 1)
				player:setStorageValue(921, player:getStorageValue(921) + 10)
				player:addItem(18422, 2)
				player:addItem(18215, 1)
				player:setStorageValue(942, 0)
				player:setStorageValue(944, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. player:getName() .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Matchmaker
	
	-- Golem Repair
	elseif(msgcontains(msg, "repair")) then
		if player:getStorageValue(945) < 1 and player:getStorageValue(947) < os.time() and player:getStorageValue(900) >= 16 then
			npcHandler:say("Our gnomish crystal golems sometimes go nuts. A recent earthquake has disrupted the entire production of a golem factory. ... ", cid)
			npcHandler:say("I'm no expert on how those golems work, but it seems that when the crystals of the golems get out of harmony, they do as they please and even sometimes become violent. The violent ones are lost. ... ", cid)
			npcHandler:say("Don't bother with them, though you may decide to kill some to get rid of them. The others can be repaired, but to recall them to the workshops, the golems have to be put into a specific resonance. ... ", cid)
			npcHandler:say("Use the bell I gave you on the golems, so the gnomes can recall them to their workshops. Getting four of them should be enough for now. Report back when you are ready. ", cid)
			player:setStorageValue(945, 1)
			player:setStorageValue(946, 0)
			player:addItem(18343, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2) then
			if player:getStorageValue(946) == 4 and player:getItemCount(18343) >= 1 then
				player:removeItem(18343, 1)
				player:setStorageValue(921, player:getStorageValue(921) + 10)
				player:addItem(18422, 2)
				player:addItem(18215, 1)
				player:setStorageValue(945, 0)
				player:setStorageValue(947, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. player:getName() .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Golem Repair
	
	-- Spore Gathering
	elseif(msgcontains(msg, "spore")) then
		if player:getStorageValue(948) < 1 and player:getStorageValue(950) < os.time() and player:getStorageValue(900) >= 17 then
			npcHandler:say("We gnomes want you to gather a special collection of spores. All you have to do is use a puffball mushroom and use the spore gathering kit I gave you to gather the spores. ... ", cid)
			npcHandler:say("There is a catch though. You need to collect different spores in a specific sequence to fill your gathering kit. If you mix the spores in the wrong way, you ruin your collection and have to start over. ... ", cid)
			npcHandler:say("You have to gather them in this sequence: red, green, blue and yellow. You can see on your kit what is required next. ", cid)
			player:setStorageValue(948, 1)
			player:setStorageValue(949, 0)
			player:addItem(18328, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 2) then
			if player:getStorageValue(949) == 5 and player:getItemCount(18332) >= 1 then
				player:removeItem(18332, 1)
				player:setStorageValue(921, player:getStorageValue(921) + 10)
				player:addItem(18422, 2)
				player:addItem(18215, 1)
				player:setStorageValue(948, 0)
				player:setStorageValue(950, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. player:getName() .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Spore Gathering
	
	-- Grindstone Hunt
	elseif(msgcontains(msg, "grindstone")) then
		if player:getStorageValue(951) < 1 and player:getStorageValue(953) < os.time() and player:getStorageValue(900) >= 17 then
			npcHandler:say("We gnomes need some special grindstones to cut and polish specific crystals. The thing is, they can only be found in a quite dangerous lava cave full of vile monsters. You'll reach it via the hot spot teleporter. ... ", cid)
			npcHandler:say("It will be your task to get one such grindstone and bring it back to me.", cid)
			player:setStorageValue(951, 1)
			player:setStorageValue(952, 0)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 2) then
			if player:getStorageValue(952) == 1 and player:getItemCount(18337) >= 1 then
				player:removeItem(18337, 1)
				player:setStorageValue(921, player:getStorageValue(921) + 10)
				player:addItem(18422, 2)
				player:addItem(18215, 1)
				player:setStorageValue(951, 0)
				player:setStorageValue(953, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. player:getName() .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Grindstone Hunt

	elseif(msgcontains(msg, "report")) then
		if player:getStorageValue(900) >= 116 and player:getStorageValue(900) < 17 then
			npcHandler:say("Which mission do you want to report: {crystal keeper}, {spark hunting}?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(900) >= 17 then
			npcHandler:say("Which mission do you want to report: {crystal keeper}, {spark hunting}, {extermination} or {mushroom digging}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
