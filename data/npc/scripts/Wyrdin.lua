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
		if(player:getStorageValue(30) < 1 and player:getStorageValue(120) == 7 and player:getStorageValue(121) >= 5) then
			npcHandler:say({"There is indeed something that needs our attention. In the far north, a new city named Yalahar was discovered. It seems to be incredibly huge. ...",
							"According to travelers, it's a city of glory and wonders. We need to learn as much as we can about this city and its inhabitants. ...",
							"Gladly the explorer's society already sent a representative there. Still, we need someone to bring us the information he was able to gather until now. ...",
							"Please look for the explorer's society's captain Maximilian in Liberty Bay. Ask him for a passage to Yalahar. There visit Timothy of the explorer's society and get his research notes. ...",
							"It might be a good idea to explore the city a bit on your own before you deliver the notes here, but please make sure you don't lose them. "}, cid)
			player:setStorageValue(30, 1)
			npcHandler.topic[cid] = 0
		elseif(player:getStorageValue(30) == 2) then
			npcHandler:say("Did you bring the papers I asked you for?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then	
		if(npcHandler.topic[cid] == 1) then
			if(getPlayerItemCount(cid, 10090) >= 1) then
				doPlayerRemoveItem(cid, 10090, 1)
				player:setStorageValue(30, 3)
				npcHandler:say("Oh marvellous, please excuse me. I need to read this text immediately. Here, take this small reward of 500 gold pieces for your efforts.", cid)
				doPlayerAddMoney(cid, 500)
				npcHandler.topic[cid] = 0
			end
		end
	--The New Frontier
	elseif(msgcontains(msg, "farmine")) then
		if(player:getStorageValue(1015) == 15) then
			npcHandler:say("I've heard some odd rumours about this new dwarven outpost. But tell me, what has the Edron academy to do with Farmine?", cid)
			npcHandler.topic[cid] = 30
		end
	elseif(msgcontains(msg, "plea")) then
		if(npcHandler.topic[cid] == 30) then
			if(player:getStorageValue(1020) < 1) then
				npcHandler:say("Hm, you are right, we are at the forefront of knowledge and innovation. Our dwarven friends could learn much from one of our representatives.", cid)
				player:setStorageValue(1020, 1)
				player:setStorageValue(12135, player:getStorageValue(12135) + 1) --Questlog, The New Frontier Quest "Mission 05: Getting Things Busy"
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())