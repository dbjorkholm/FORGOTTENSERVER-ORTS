local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'Precisely.',
	'So my initial calculations had been correct!',
	'Looks like I have to find another way then.',
	'Hm, I need to recapitulate my equipment...'
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

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! You're late, do you have no concept of time? My mission is of utmost importance. If you are not interested in helping me, you might as well just leave.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Yes yes. Goodbye |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Yes yes. Goodbye |PLAYERNAME|.")

npcHandler:addModule(FocusModule:new())
