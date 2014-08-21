local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'Come chat with ol\' Bozo!',
	'Do you know the one with the dragon? Where - and then ... hahahaha! Oh no, I guess I ruined it.',
	'The fools\' guild? Are you serious? No, of course not! Hahaha!',
	'Welcome, welcome, step closer!'
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

npcHandler:setMessage(MESSAGE_GREET, "Hi there, how's it hanging, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "A joke a day keeps the ghouls away!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "A joke a day keeps the ghouls away!")

npcHandler:addModule(FocusModule:new())
