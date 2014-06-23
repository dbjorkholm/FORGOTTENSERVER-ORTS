local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

npcHandler:setMessage(MESSAGE_GREET, "MIND YOUR MANNERS COMMONER! Address the queen with her title!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE QUEEN!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "LONG LIVE THE QUEEN!")

npcHandler:addModule(FocusModule:new())
