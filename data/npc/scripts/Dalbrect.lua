local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Dalbrect Windtrouser, of the once proud windtrouser family."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am merely a humble fisher now that nothing is left of my noble legacy."})
keywordHandler:addKeyword({'legacy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but fate turned against us and threw us into poverty."})
keywordHandler:addKeyword({'poverty'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that project."})
keywordHandler:addKeyword({'fate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that project."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our family fortune was lost when the colonization of those cursed lands failed. Now nothing is left of our fame or our fortune. If I only had something as a reminder of those better times. <sigh>"})
keywordHandler:addKeyword({'brooch'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What? You want me to examine a brooch?"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To think my family used to belong to the local nobility! And now those arrogant women are in charge!"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have only sailed to the isle of the kings once or twice. I dare not anger the monks by bringing travellers there without their permission."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is my only pride and joy."})

 --************************************************************Travel************************************************************************************************************
if luaFlags.freeBoats then
	local travelNode = keywordHandler:addKeyword({'isle of the kings'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to the isle of the kings for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x = 32190, y = 31957, z = 6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
else
	local travelNode = keywordHandler:addKeyword({'isle of the kings'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to the isle of the kings for 10 gold coins?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 10, destination = {x = 32190, y = 31957, z = 6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

end
--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. You are welcome.")
npcHandler:setMessage(MESSAGE_GREET, "Be greeted, traveler.")

npcHandler:addModule(FocusModule:new())
