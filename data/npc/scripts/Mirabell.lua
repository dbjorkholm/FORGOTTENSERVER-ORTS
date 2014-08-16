local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("The Horn of Plenty is always open for tired adventurers.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Horn of Plenty, |PLAYERNAME|. Sit down, have a {drink} or some {food}!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Come back soon, traveller.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Come back soon, traveller.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, take a look at my tasty offers.")

npcHandler:addModule(FocusModule:new())
