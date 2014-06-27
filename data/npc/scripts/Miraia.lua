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
	if(msgcontains(msg, "scarab cheese")) then
		if player:getStorageValue(Rashid.MissionStart+2) == 1 then
			npcHandler:say("Let me cover my nose before I get this for you... Would you REALLY like to buy scarab cheese for 100 gold?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Rashid.MissionStart+2) == 2 then
			npcHandler:say("Oh the last cheese molded? Would you like to buy another one for 100 gold?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if player:getMoney() >= 100 then
				npcHandler:say("Here it is.", cid)
				player:setStorageValue(Rashid.MissionStart+2, 2)
				player:addItem(8112, 1)
				player:removeMoney(100)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have enough money.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
