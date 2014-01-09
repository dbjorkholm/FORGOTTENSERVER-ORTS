local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local renown = {}
 
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)			
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)			
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)		
end
function onThink()
	npcHandler:onThink()					
end

local function getMoneyCount(s)
		local b, e = s:find("%d+")
		return b and e and math.min(4294967295, tonumber(s:sub(b, e))) or -1
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "looking")) then
		if(getPlayerStorageValue(cid, 900) >= 14) then
			npcHandler:say("Our relations improve with every mission you undertake on our behalf. Another way to improve your relations with us gnomes is to trade in minor crystal tokens. ...", cid)
			npcHandler:say("Your renown amongst us gnomes is currently ".. getPlayerStorageValue(cid, 921) .. ". Do you want to improve your standing by sacrificing tokens? One token will raise your renown by 5 points. ", cid)
			talkState[talkUser] = 1
		end
	elseif(talkState[talkUser] == 2) then
		if(getMoneyCount(msg) > 0) then
			npcHandler:say("Do you realy want to trade " .. getMoneyCount(msg) .. " minor tokens for " .. getMoneyCount(msg) * 5 .. " renown?", cid)
			renown[talkUser] = getMoneyCount(msg)
			talkState[talkUser] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("How many tokens do you want to trade?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 3) then
			if(getPlayerItemCount(cid, 18422) >= renown[talkUser]) then
				doPlayerRemoveItem(cid, 18422, renown[talkUser])
				setPlayerStorageValue(cid, 921, getPlayerStorageValue(cid, 921) + renown[talkUser] * 5)
			else
				npcHandler:say("You don't have theese many crystals.", cid)
			end
			talkState[talkUser] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())