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
	if(msgcontains(msg, "measurements")) then
		if player:getStorageValue(250) == 32 then
			npcHandler:say("Oh no! I knew that day would come! I am slightly above the allowed weight and if you can't supply me with some grapes to slim down I will get fired. Do you happen to have some grapes with you? ", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if player:getItemCount(2681) >= 1 then
			player:removeItem(2544, player:getItemCount(2681))
			npcHandler:say("Oh thank you! Thank you so much! So listen ... <whispers her measurements> ", cid)
			player:setStorageValue(250, 33)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
