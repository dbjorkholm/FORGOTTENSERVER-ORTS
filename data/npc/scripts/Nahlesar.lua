local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
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
	local npc = getNpcCid()
	if (getCreatureOutfit(npc).lookType == 80) then
     		doCreatureChangeOutfit(npc, {lookType = 51})
	else 
     		doCreatureChangeOutfit(npc, {lookType = 80})  
	end
	npcHandler:onThink()	
	return true				
end

npcHandler:addModule(FocusModule:new())