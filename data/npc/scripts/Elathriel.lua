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
	if msgcontains(msg, "key") then
		npcHandler:say("If you are that curious, do you want to buy a key for 5000 gold? Don't blame me if you get sucked in.", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			local player = Player(cid)
			if player:getMoney() >= 5000 then
				npcHandler:say("Here it is.", cid)
				local key = player:addItem(2089, 1)
				if key then
					key:setActionId(3012)
				end
				player:removeMoney(5000)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Be greeted |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Asha Thrazi, stranger.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Asha Thrazi, stranger.")
npcHandler:addModule(FocusModule:new())
