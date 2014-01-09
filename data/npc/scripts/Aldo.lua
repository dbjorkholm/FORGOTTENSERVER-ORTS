local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, 'soft') or msgcontains(msg, 'boots')) then
		selfSay('Do you want to repair your worn soft boots for 10000 gold coins?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(doPlayerRemoveItem(cid, 6530, 1)) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				doPlayerAddItem(cid, 6132, 1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		elseif(doPlayerRemoveItem(cid, 10021, 1)) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				doPlayerAddItem(cid, 6132, 1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		elseif(doPlayerRemoveItem(cid,6132, 1)) then
			if(doPlayerRemoveMoney(cid, 10000)) then
				doPlayerAddItem(cid, 6132, 1)
				selfSay('Here you are.', cid)
			else
				selfSay('Sorry, you don\'t have enough gold.', cid)
			end
		else
			selfSay('Sorry, you don\'t have the item.', cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
		talkState[talkUser] = 0
		selfSay('Ok then.', cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())