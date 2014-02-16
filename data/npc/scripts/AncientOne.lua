local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end


-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({'coffin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Uahaha, so you know the secret word of the ancients buhuhuhuhaha... are you realy ready to hear this?'})
	travelNode:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = false, text = 'The way is that to every single letter add +1... A is B, B is C.'})
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'I will be waiting for you.'})

-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())