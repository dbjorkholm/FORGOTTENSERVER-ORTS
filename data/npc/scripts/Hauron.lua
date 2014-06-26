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

	if(msgcontains(msg, "fighting spirit") then
		npcHandler:say("I need two royal helmets to extract one container of fighting spirit. Would you like me to perform the extraction?", cid)
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, "yes") then
		if(npcHandler.topic[cid] == 1) then
			if(getPlayerItemCount(cid, 2498) >= 2) then
				npcHandler:say("Al Adhra Zubana Akras!", cid)
				doPlayerAddItem(cid, 5884, 1)
				doPlayerRemoveItem(cid, 2498, 2)
			else
				npcHandler:say("You don't have two royal helmets.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())