local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, "chocolate cake") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.SweetAsChocolateCake) == 1 and player:getItemCount(8847) >= 1 then
			npcHandler:say("Is that for me?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.hiddenCityOfBeregar.SweetAsChocolateCake) == 2 then
			npcHandler:say("So did you tell her that the cake came from me?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.SweetAsChocolateCake, 1)
			player:removeItem(8847, 1)
			npcHandler:say("Err, thanks. I doubt it's from you. Who sent it?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "Frafnar") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("Oh, Frafnar. That's so nice of him. I gotta invite him for a beer.", cid)
			player:setStorageValue(Storage.hiddenCityOfBeregar.SweetAsChocolateCake, 2)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "See you my friend.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you my friend.")
npcHandler:setMessage(MESSAGE_GREET, "Are you talking to me? Well, go on chatting but don't expect an answer.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
