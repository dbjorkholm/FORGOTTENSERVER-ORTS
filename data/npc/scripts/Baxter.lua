local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local random_texts = {
	'People of Thais, bring honour to your king by fighting in the orc war!',
	'The orcs are preparing for war!!!'
}

local rnd_sounds = 0
function onThink()
	if rnd_sounds < os.time() then
		rnd_sounds = (os.time() + 10)
		if math.random(100) < 25  then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

npcHandler:addModule(FocusModule:new())
