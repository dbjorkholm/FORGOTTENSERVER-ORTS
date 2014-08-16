local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end

function onThink()
	local npc = Npc()
	local outfit = npc:getOutfit()
	npc:setOutfit({lookType = (outfit.lookType == 80 and 51 or 80)})

	npcHandler:onThink()
end

npcHandler:addModule(FocusModule:new())