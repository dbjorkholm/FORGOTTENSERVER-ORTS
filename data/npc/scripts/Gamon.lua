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
	if(msgcontains(msg, "wooden stake")) then
		npcHandler:say("Making a stake from a chair? Are you insane??! I won't waste my chairs on you for free! You will have to pay for it, but since I consider your plan a blasphemy, it will cost 5000 gold pieces. Okay?", cid)
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if player:getMoney() >= 5000 then
				if player:getStorageValue(87) == 1 then
					player:setStorageValue(87, 2)
				end
				player:removeMoney(5000)
				player:addItem(5941, 1)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
