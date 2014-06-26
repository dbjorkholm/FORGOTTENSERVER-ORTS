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

	if(msgcontains(msg, "fine vase")) then
		if(getPlayerStorageValue(cid, Rashid.MissionStart+3) == 1) then
			npcHandler:say("Rashid sent you, I suppose. Before I sell you that vase, one word of advice. ...", cid)
			npcHandler:say("Make room in your backpack so that I can place the vase carefully inside it. If it falls to the floor, it will most likely shatter or break if you try to pick it up again. ...", cid)
			npcHandler:say("This vase it not meant to be touched by human hands, so just keep your hands off it. Are you ready to buy that vase for 1000 gold?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if(getPlayerMoney(cid) >= 1000) then
				npcHandler:say("Here it is.", cid)
				setPlayerStorageValue(cid, Rashid.MissionStart+3, 2)
				doPlayerAddItem(cid, 8760, 1)
				doPlayerRemoveMoney(cid, 1000)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have enought money.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())