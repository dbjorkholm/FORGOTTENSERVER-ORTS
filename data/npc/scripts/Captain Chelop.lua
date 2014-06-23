local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end



keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can bring you back to {Thais} if you are weary or you can stay and fight. What shall it be?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Chelop and I am a captain of this {inquisition} ship."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Can't you see? I'm captain of the Pesadilla, the proud {inquisition} ship which anchors here."})
keywordHandler:addKeyword({'inquisition'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "By edict of the honorable Henricus himself, we are ordered to give passage to all recruits of the Roshamuul mission for a small fee."})
keywordHandler:addKeyword({'Roshamuul'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This is the island you are currently on, just in case you forgot."})

 --************************************************************Travel************************************************************************************************************

local travelNode = keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Thais?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32310, y=32210, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = ' By direct edict of the honorable Henricus himself... well, you know.'})

--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:addModule(FocusModule:new())