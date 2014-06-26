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

	if(msgcontains(msg, 'soft') or msgcontains(msg, 'boots')) then
		selfSay('Do you want to repair your worn soft boots for 10000 gold coins?', cid)
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1) then
		if(getPlayerItemCount(cid, 10021) == 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				doPlayerRemoveItem(cid, 10021, 1)
				doPlayerAddItem(cid, 6132, 1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		elseif(getPlayerItemCount(cid, 10021) == 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				doPlayerRemoveItem(cid, 10021, 1)
				doPlayerAddItem(cid, 6132, 1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		elseif(getPlayerItemCount(cid,6132) == 1) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				doPlayerRemoveItem(cid,6132, 1)
				doPlayerAddItem(cid, 6132, 1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have the item.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif(msgcontains(msg, 'no') and npcHandler.topic[cid] == 1) then
		npcHandler.topic[cid] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
