local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local rnd_sounds = 0

function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 10)
		if(math.random(100) < 20) then
			Npc():say('Behave yourself as long as you are in Carlin, commoner!', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

npcHandler:setMessage(MESSAGE_GREET, "LONG LIVE THE QUEEN!")
npcHandler:setMessage(MESSAGE_FAREWELL, "LONG LIVE THE QUEEN!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "LONG LIVE THE QUEEN!")
npcHandler:addModule(FocusModule:new())
