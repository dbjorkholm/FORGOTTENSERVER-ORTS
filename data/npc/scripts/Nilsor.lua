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
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 121) == 20) then
			npcHandler:say("I am in dire need of help. A plague has befallen my dogs. I even called a druid of Carlin for help but all he could do was to recommend some strong medicine ...", cid)
			npcHandler:say("The thing is the ingredients of the medicine are extremely rare and some only exist in far away and distant lands. If you could help me collecting the ingredients, I would be eternally grateful ...", cid)
			npcHandler:say("Are you willing to help me?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 121) == 28) then
			npcHandler:say("Thank you. Now I have all necessary ingredients. As a reward I grant you the use of our dog sled, which is located to the east of here. ...", cid)
			npcHandler:say("The dogs can be a bit moody, but if you always carry some ham with you there shouldnt be any problems. Oh, and Hjaern might have a mission for you. So maybe you go and talk to him.", cid)
			setPlayerStorageValue(cid, 121, 29)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "waterskin")) then
		npcHandler:say("Do you want to buy a waterskin for 25 gold?", cid)
		talkState[talkUser] = 2
	
	elseif(msgcontains(msg, "cactus")) then
		if(getPlayerStorageValue(cid, 121) == 21) then
			npcHandler:say("You will find this kind of cactus at places that are called deserts. Only an ordinary kitchen knife will be precise enough to produce the ingredient weneed. Do you have a part of that cactus with you?", cid)
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, "water")) then
		if(getPlayerStorageValue(cid, 121) == 22) then
			npcHandler:say("You will need a specially prepared waterskin to collect the water. You can buy one from me ...", cid)
			npcHandler:say("Use it on a geyser that is NOT active. The water of active geysers is far too hot. You can find inactive geysers on Okolnir. Do you have somegeyser water with you?", cid)
			talkState[talkUser] = 4
		end
	elseif(msgcontains(msg, "sulphur")) then
		if(getPlayerStorageValue(cid, 121) == 23) then
			npcHandler:say("I need fine sulphur of an inactive lava hole. No other sulphur will do. Use an ordinary kitchen spoon on an inactive lava hole. Do you have fine sulphurwith you?", cid)
			talkState[talkUser] = 5
		end
	elseif(msgcontains(msg, "herb")) then
		if(getPlayerStorageValue(cid, 121) == 24) then
			npcHandler:say("The frostbite herb is a local plant but its quite rare. You can find it on mountain peaks. You will need to cut it with a fine kitchen knife. Do you have a frostbite herb with you?", cid)
			talkState[talkUser] = 6
		end
	elseif(msgcontains(msg, "blossom")) then
		if(getPlayerStorageValue(cid, 121) == 25) then
			npcHandler:say("The purple kiss is a plant that grows in a place called jungle. You will have to use a kitchen knife to harvest its blossom. Do you have a blossom of a purple kiss with you?", cid)
			talkState[talkUser] = 7
		end
	elseif(msgcontains(msg, "hydra tongue")) then
		if(getPlayerStorageValue(cid, 121) == 26) then
			npcHandler:say("The hydra tongue is a common pest plant in warmer regions. You might find one in a shop. Do you have a hydra tongue with you?", cid)
			talkState[talkUser] = 8
		end
	elseif(msgcontains(msg, "spores")) then
		if(getPlayerStorageValue(cid, 121) == 27) then
			npcHandler:say("The giant glimmercap mushroom exists in caves and other preferably warm and humid places. Use an ordinary kitchen spoon on a mushroom to collectits spores. Do you have the glimmercap spores?", cid)
			talkState[talkUser] = 9
		end

	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("A thousand thanks in advance. I need no less than 7 ingredients for the cure. You can ask me about each specifically ...", cid)
			npcHandler:say("I need a part of the sun adorer cactus, a vial of geyser water, sulphur of a lava hole, a frostbite herb, a blossom of a purple kiss, a hydra tongue and spores of a giant glimmercap mushroom ...", cid)
			npcHandler:say("Turn them in individually by talking about them to me. As soon as I obtained them all, talk to me about the medicine. ", cid)
			setPlayerStorageValue(cid, 121, 21)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 2) then
			if(getPlayerMoney(cid) >= 25) then
				doPlayerRemoveMoney(cid, 25)
				npcHandler:say("Here you are. A waterskin!", cid)
				doPlayerAddItem(cid, 7246, 1)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
			
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 7245) >= 1) then
				doPlayerRemoveItem(cid, 7245, 1)
				npcHandler:say("Thank you for this ingredient.", cid)
				setPlayerStorageValue(cid, 121, 22)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 4) then
			if(getPlayerItemCount(cid, 7246) >= 1) then
				doPlayerRemoveItem(cid, 7246, 1)
				npcHandler:say("Thank you for this ingredient.", cid)
				setPlayerStorageValue(cid, 121, 23)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 5) then
			if(getPlayerItemCount(cid, 8301) >= 1) then
				doPlayerRemoveItem(cid, 8301, 1)
				npcHandler:say("Thank you for this ingredient.", cid)
				setPlayerStorageValue(cid, 121, 24)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 6) then
			if(getPlayerItemCount(cid, 7248) >= 1) then
				doPlayerRemoveItem(cid, 7248, 1)
				npcHandler:say("Thank you for this ingredient.", cid)
				setPlayerStorageValue(cid, 121, 25)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 7) then
			if(getPlayerItemCount(cid, 7249) >= 1) then
				doPlayerRemoveItem(cid, 7249, 1)
				npcHandler:say("Thank you for this ingredient.", cid)
				setPlayerStorageValue(cid, 121, 26)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 8) then
			if(getPlayerItemCount(cid, 7250) >= 1) then
				doPlayerRemoveItem(cid, 7250, 1)
				npcHandler:say("Thank you for this ingredient.", cid)
				setPlayerStorageValue(cid, 121, 27)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 9) then
			if(getPlayerItemCount(cid, 7247) >= 1) then
				doPlayerRemoveItem(cid, 7247, 1)
				npcHandler:say("Thank you for this ingredient.", cid)
				setPlayerStorageValue(cid, 121, 28)
			else
				npcHandler:say("Come back when you have the money.", cid)
			end
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())