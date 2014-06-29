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
	elseif msgcontains(msg, "sniffler") then
		if player:getStorageValue(Storage.TheIceIslands.Questline) == 1 then
			npcHandler:say("!", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "meat") then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(2666) >= 1 then
				player:removeItem(2666, 1)
				npcHandler:say("<munch>", cid)
				player:setStorageValue(Storage.TheIceIslands.Questline, 2)
				player:setStorageValue(Storage.TheIceIslands.Mission01, 2) -- Questlog The Ice Islands Quest, Befriending the Musher
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())