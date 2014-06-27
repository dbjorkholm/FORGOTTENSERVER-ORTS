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
	if(msgcontains(msg, "package for rashid")) then
		if player:getStorageValue(Rashid.MissionStart+1) >= 1 and player:getStorageValue(Rashid.MissionStart+1) < 3 then
			npcHandler:say("So you're the delivery boy? Go ahead, but I warn you, it's quite heavy. You can take it from the box over there.", cid)
			player:setStorageValue(Rashid.MissionStart+1, player:getStorageValue(Rashid.MissionStart+1) + 1)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
