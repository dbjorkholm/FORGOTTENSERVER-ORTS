local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 5)
		if(math.random(1, 100) < 25) then
			selfSay('Chchch.')
		end
	end
	npcHandler:onThink()
end

keywordHandler:addKeyword({'acorn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Chh? Chhh?? <though you don't understand squirrelish, that one seems really excited>"})

npcHandler:addModule(FocusModule:new())
