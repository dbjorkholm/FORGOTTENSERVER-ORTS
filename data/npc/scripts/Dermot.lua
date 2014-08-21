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
	if msgcontains(msg, "present") then
		if player:getStorageValue(Storage.postman.Mission05) == 2 then
			npcHandler:say("You have a present for me?? Realy?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "key") then
		npcHandler:say("Do you want to buy the dungeon key for 2000 gold?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(2331) > 0 then
				player:removeItem(2331, 1)
				npcHandler:say("Thank you very much!", cid)
				player:setStorageValue(Storage.postman.Mission05, 3)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:getMoney() >= 2000 then
				npcHandler:say("Here it is.", cid)
				local key = player:addItem(2087, 1)
				if key then
					key:setActionId(3940)
				end
				player:removeMoney(2000)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello, traveller |PLAYERNAME|. How can I help you?")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you again.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you again.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
