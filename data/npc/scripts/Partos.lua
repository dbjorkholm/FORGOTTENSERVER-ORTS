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
	-- Mission 1 - The Supply Thief 
	if(msgcontains(msg, "prison")) then
		if player:getStorageValue(GreenDjinn.MissionStart+1) == 2 then
			npcHandler:say("You mean that's a JAIL? They told me it's the finest hotel in town! THAT explains the lousy roomservice!", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "ankrahmun")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say({"Yes, I've lived in Ankrahmun for quite some time. Ahh, good old times! ...", "Unfortunately I had to relocate. <sigh> ...", "Business reasons - you know."}, cid, 0, 1, 3000)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "supplies")) then
		if(npcHandler.topic[cid] == 2) then
			npcHandler:say({"What!? I bet, Baa'leal sent you! ...", "I won't tell you anything! Shove off!"}, cid, 0, 1, 2000)
			player:setStorageValue(GreenDjinn.MissionStart+1, 3)
			npcHandler.topic[cid] = 0
		end
	end
	-- Mission 1 - The Supply Thief 
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
