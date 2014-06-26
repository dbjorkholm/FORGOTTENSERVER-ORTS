local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end

 --************************************************************Keywords************************************************************************************************************

keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can sail you to {Vengoth} anytime.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
 
 --************************************************************Travel************************************************************************************************************

if luaFlags.freeBoats then
 
	local travelNode = keywordHandler:addKeyword({'Vengoth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to travel to Vengoth for free?"})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x = 32858, y = 31549, z = 7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

else


	local travelNode = keywordHandler:addKeyword({'Vengoth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to travel to Vengoth for 100 gold?"})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 100, destination = {x = 32858, y = 31549, z = 7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

end

--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:setMessage(MESSAGE_GREET, "Can I interest you in a trip to {Vengoth}?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

