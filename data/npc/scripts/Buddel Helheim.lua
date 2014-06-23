local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end
    
--************************************************************Travel************************************************************************************************************
 
	  
if luaFlags.freeBoats then


	local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me 0 gold and I bring you to Svargrond. Alright?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=32255, y=31197, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'SHIP AHOY! I AM BUDDEL THE ..... did you say no??? Alright.'})
		
else


	local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me 50 gold and I bring you to Svargrond. Alright?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 50, destination = {x=32255, y=31197, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'SHIP AHOY! I AM BUDDEL THE ..... did you say no??? Alright.'})
		
end

--***********************************************************Modules and Callbacks*******************************************************************************************************

       

 npcHandler:addModule(FocusModule:new())
 
 