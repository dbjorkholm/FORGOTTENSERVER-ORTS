local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'*mumbles*',
	'That astronomer of the academy simply has no idea what he is dealing with...',
	'Some secrets should better be left uncovered.',
	'Ha, ha... *mumbles* Hmm.'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

npcHandler:setMessage(MESSAGE_GREET, "What do you want? Listen to the old madman? If you have nothing to spare, leave me alone.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yes, whatever.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Yes, whatever.")

npcHandler:addModule(FocusModule:new())
