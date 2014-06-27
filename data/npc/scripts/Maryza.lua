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
	if(msgcontains(msg, "cookbook")) then
		if player:getStorageValue(BlueDjinn.MissionStart+1) == 1 then
			npcHandler:say("Would you like to buy a cookbook for 150 gold?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if player:getMoney() >= 150 then
				npcHandler:say("Here it is.", cid)
				player:setStorageValue(BlueDjinn.MissionStart+1, 2)
				player:addItem(2347, 1)
				player:removeMoney(150)
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
