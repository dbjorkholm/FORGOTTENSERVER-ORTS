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
	if(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and player:getStorageValue(9920) == 1 and player:getStorageValue(9921) < 1 then
		npcHandler:say({"Lost. Hidden. The keys are shadow names. Find them, they will talk to me and reveal what is hidden. Will you go on that quest?"}, cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 and player:getStorageValue(9920) == 1 then
		npcHandler:say({"Then into the vampire crypts, deep down, you must go. ...",
			"There... three graves where the shadows swirl, unseen. The first one: name the colour of the silent gong. Then ...",
			"The second: the name that is silent now in the halls of Darkstone ...",
			"The third: the lost beauty of Dunesea. It must be remembered, the shadows command it. Go now."}, cid)
		player:setStorageValue(9921, 1)
		npcHandler.topic[cid] = 0
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and player:getStorageValue(9924) == 1 and player:getStorageValue(9925) < 1 then
		npcHandler:say({"Yes. Have you gone there and found what you sought?"}, cid)
		npcHandler.topic[cid] = 2
	elseif(msgcontains(msg, 'yes')) and npcHandler.topic[cid] == 2 and player:getStorageValue(9924) == 1 and player:getStorageValue(9925) < 1 then
		npcHandler:say({"Tell me. Begin with the colour."}, cid)
		npcHandler.topic[cid] = 3
	elseif(msgcontains(msg, 'bronze')) and npcHandler.topic[cid] == 3 and player:getStorageValue(9924) == 1 and player:getStorageValue(9925) < 1 then
		npcHandler:say({"Yes. The shadows say this is true. The beauty of House Dunesea, name it."}, cid)
		npcHandler.topic[cid] = 4	
	elseif(msgcontains(msg, 'floating')) and npcHandler.topic[cid] == 4 and player:getStorageValue(9924) == 1 and player:getStorageValue(9925) < 1 then
		npcHandler:say({"The floating gardens. Too beautiful to lie asleep in the memory of men. Yes. The name that is no more in Darkstone?"}, cid)
		npcHandler.topic[cid] = 5	
	elseif(msgcontains(msg, 'Takesha Antishu')) and npcHandler.topic[cid] == 5 and player:getStorageValue(9924) == 1 and player:getStorageValue(9925) < 1 then
		npcHandler:say({"Ah, the Lady of Darkstone. You have done well to remember her name. ...",
			"Now, the shadows say the thing you seek lies next to Akab, the Quarrelsome. ...",
			"No coal is burned in his honour. Find his resting place and dig near it. Now go."}, cid)
		player:setStorageValue(9925, 1)
		npcHandler.topic[cid] = 0	
	end
	return true	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
