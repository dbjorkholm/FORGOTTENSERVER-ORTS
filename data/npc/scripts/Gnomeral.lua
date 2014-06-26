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

	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 900) >= 16 and getPlayerStorageValue(cid, 900) < 17) then
			npcHandler:say("For your rank there are two missions available: matchmaker and golem repair. You can undertake each mission, but you can turn in a specific mission only once every 20 hours. ", cid)
			npcHandler.topic[cid] = 0
		elseif(getPlayerStorageValue(cid, 900) >= 17) then
			npcHandler:say("For your rank there are four missions available: matchmaker, golem repair, spore gathering and grindstone hunt. You can undertake each mission, but you can turn in a specific mission only once every 20 hours.", cid)
			npcHandler.topic[cid] = 0
		end
	--  Matchmaker
	elseif(msgcontains(msg, "matchmaker")) then
		if(getPlayerStorageValue(cid, 942) < 1 and getPlayerStorageValue(cid, 944) < os.time() and getPlayerStorageValue(cid, 900) >= 16) then
			npcHandler:say("You will have to find a lonely crystal a perfect match. I don't understand the specifics but the gnomes told me that even crystals need a mate to produce offspring. ... ", cid)
			npcHandler:say("Be that as it may, in this package you'll find a crystal. Take it out of the package and go to the crystal caves to find it a mate. Just look out for huge red crystals and try your luck. ... ", cid)
			npcHandler:say("They should look like one of those seen in your soul melody test. You will find them in the crystal grounds. Report back to me when you are done. ", cid)
			setPlayerStorageValue(cid, 942, 1)
			setPlayerStorageValue(cid, 943, 0)
			doPlayerAddItem(cid, 18313, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2) then
			if(getPlayerStorageValue(cid, 943) == 1 and getPlayerItemCount(cid, 18312) >= 1) then
				doPlayerRemoveItem(cid, 18312, 1)
				setPlayerStorageValue(cid, 921, getPlayerStorageValue(cid, 921) + 10)
				doPlayerAddItem(cid, 18422, 2)
				doPlayerAddItem(cid, 18215, 1)
				setPlayerStorageValue(cid, 942, 0)
				setPlayerStorageValue(cid, 944, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. getPlayerName(cid) .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Matchmaker
	
	-- Golem Repair
	elseif(msgcontains(msg, "repair")) then
		if(getPlayerStorageValue(cid, 945) < 1 and getPlayerStorageValue(cid, 947) < os.time() and getPlayerStorageValue(cid, 900) >= 16) then
			npcHandler:say("Our gnomish crystal golems sometimes go nuts. A recent earthquake has disrupted the entire production of a golem factory. ... ", cid)
			npcHandler:say("I'm no expert on how those golems work, but it seems that when the crystals of the golems get out of harmony, they do as they please and even sometimes become violent. The violent ones are lost. ... ", cid)
			npcHandler:say("Don't bother with them, though you may decide to kill some to get rid of them. The others can be repaired, but to recall them to the workshops, the golems have to be put into a specific resonance. ... ", cid)
			npcHandler:say("Use the bell I gave you on the golems, so the gnomes can recall them to their workshops. Getting four of them should be enough for now. Report back when you are ready. ", cid)
			setPlayerStorageValue(cid, 945, 1)
			setPlayerStorageValue(cid, 946, 0)
			doPlayerAddItem(cid, 18343, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 1 or npcHandler.topic[cid] == 2) then
			if(getPlayerStorageValue(cid, 946) == 4 and getPlayerItemCount(cid, 18343) >= 1) then
				doPlayerRemoveItem(cid, 18343, 1)
				setPlayerStorageValue(cid, 921, getPlayerStorageValue(cid, 921) + 10)
				doPlayerAddItem(cid, 18422, 2)
				doPlayerAddItem(cid, 18215, 1)
				setPlayerStorageValue(cid, 945, 0)
				setPlayerStorageValue(cid, 947, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. getPlayerName(cid) .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Golem Repair
	
	-- Spore Gathering
	elseif(msgcontains(msg, "spore")) then
		if(getPlayerStorageValue(cid, 948) < 1 and getPlayerStorageValue(cid, 950) < os.time() and getPlayerStorageValue(cid, 900) >= 17) then
			npcHandler:say("We gnomes want you to gather a special collection of spores. All you have to do is use a puffball mushroom and use the spore gathering kit I gave you to gather the spores. ... ", cid)
			npcHandler:say("There is a catch though. You need to collect different spores in a specific sequence to fill your gathering kit. If you mix the spores in the wrong way, you ruin your collection and have to start over. ... ", cid)
			npcHandler:say("You have to gather them in this sequence: red, green, blue and yellow. You can see on your kit what is required next. ", cid)
			setPlayerStorageValue(cid, 948, 1)
			setPlayerStorageValue(cid, 949, 0)
			doPlayerAddItem(cid, 18328, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 2) then
			if(getPlayerStorageValue(cid, 949) == 5 and getPlayerItemCount(cid, 18332) >= 1) then
				doPlayerRemoveItem(cid, 18332, 1)
				setPlayerStorageValue(cid, 921, getPlayerStorageValue(cid, 921) + 10)
				doPlayerAddItem(cid, 18422, 2)
				doPlayerAddItem(cid, 18215, 1)
				setPlayerStorageValue(cid, 948, 0)
				setPlayerStorageValue(cid, 950, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. getPlayerName(cid) .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Spore Gathering
	
	-- Grindstone Hunt
	elseif(msgcontains(msg, "grindstone")) then
		if(getPlayerStorageValue(cid, 951) < 1 and getPlayerStorageValue(cid, 953) < os.time() and getPlayerStorageValue(cid, 900) >= 17) then
			npcHandler:say("We gnomes need some special grindstones to cut and polish specific crystals. The thing is, they can only be found in a quite dangerous lava cave full of vile monsters. You'll reach it via the hot spot teleporter. ... ", cid)
			npcHandler:say("It will be your task to get one such grindstone and bring it back to me.", cid)
			setPlayerStorageValue(cid, 951, 1)
			setPlayerStorageValue(cid, 952, 0)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 2) then
			if(getPlayerStorageValue(cid, 952) == 1 and getPlayerItemCount(cid, 18337) >= 1) then
				doPlayerRemoveItem(cid, 18337, 1)
				setPlayerStorageValue(cid, 921, getPlayerStorageValue(cid, 921) + 10)
				doPlayerAddItem(cid, 18422, 2)
				doPlayerAddItem(cid, 18215, 1)
				setPlayerStorageValue(cid, 951, 0)
				setPlayerStorageValue(cid, 953, os.time() + 20 * 60 * 1000)
				npcHandler:say("Gnomo arigato " .. getPlayerName(cid) .. "! You did well. That will help us a lot. Take your tokens and this gnomish supply package as a reward. ", cid)
				doPlayerGnomishRank(cid)
				npcHandler.topic[cid] = 0
			end
		end
	-- Grindstone Hunt
	
	elseif(msgcontains(msg, "report")) then
		if(getPlayerStorageValue(cid, 900) >= 116 and getPlayerStorageValue(cid, 900) < 17) then
			npcHandler:say("Which mission do you want to report: {crystal keeper}, {spark hunting}?", cid)
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, 900) >= 17) then
			npcHandler:say("Which mission do you want to report: {crystal keeper}, {spark hunting}, {extermination} or {mushroom digging}?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())