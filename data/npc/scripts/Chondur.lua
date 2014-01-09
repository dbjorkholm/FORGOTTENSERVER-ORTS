local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
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

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "wooden stake")) then
		if(getPlayerStorageValue(cid, 87) == 12 and talkState[talkUser] < 1) then
			if(getPlayerItemCount(cid, 5941) >= 1) then
				if(getPlayerStorageValue(cid, 88) + 7 * 24 * 60 * 60 < os.time()) then
					npcHandler:say("Ten prayers for a blessed stake? Don't tell me they made you travel whole Tibia for it! Listen, child, if you bring me a wooden stake, I'll bless it for you. <chuckles>", cid)
					talkState[talkUser] = 1
				else
					npcHandler:say("Ssorry I'm still exhausted from the last ritual. come back later and try again.", cid)
					talkState[talkUser] = 0
				end
			end
		elseif(talkState[talkUser] == 1) then
			if(getPlayerItemCount(cid, 5941) >= 1) then
				npcHandler:say("Would you like to receive a spiritual prayer to bless your stake?", cid)
				talkState[talkUser] = 2
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 2) then
			if(getPlayerItemCount(cid, 5941) >= 1) then
				setPlayerStorageValue(cid, 88, os.time())
				npcHandler:say("<mumblemumble> Sha Kesh Mar!", cid)
				doPlayerRemoveItem(cid, 5941, 1)
				doPlayerAddItem(cid, 5942, 1)
				talkState[talkUser] = 0
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())