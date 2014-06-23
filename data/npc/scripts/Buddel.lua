local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end
    
--************************************************************Travel************************************************************************************************************
 
	  
if luaFlags.freeBoats then
         

	local travelNode = keywordHandler:addKeyword({'okolnir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me nothing and I bring you to Okolnir home of the frost dragons. Alright?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32225, y=31381, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'SHIP AHOY! I AM BUDDEL THE ..... did you say no??? Alright.'})
	
	travelNode = keywordHandler:addKeyword({'helheim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me nothing and I bring you to Helheim. kay?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32462, y=31174, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
	
	travelNode = keywordHandler:addKeyword({'tyrsung'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me nothing and I bring you to Tyrsung where the Venoran hunters have their settlement. Alright?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32333, y=31227, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
		
	travelNode = keywordHandler:addKeyword({'camp'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me nothing and I bring you to the south of Hrodmir where the camps of the barbarians are located. kay?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32154, y=31375, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

		
		
else

	local travelNode = keywordHandler:addKeyword({'okolnir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me 50 gold and I bring you to Okolnir home of the frost dragons. Alright?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=32225, y=31381, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'SHIP AHOY! I AM BUDDEL THE ..... did you say no??? Alright.'})
	
	travelNode = keywordHandler:addKeyword({'helheim'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me 50 gold and I bring you to Helheim. kay?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=32462, y=31174, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
	
	travelNode = keywordHandler:addKeyword({'tyrsung'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me 50 gold and I bring you to Tyrsung where the Venoran hunters have their settlement. Alright?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=32333, y=31227, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
		
	travelNode = keywordHandler:addKeyword({'camp'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Give me 50 gold and I bring you to the south of Hrodmir where the camps of the barbarians are located. kay?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 50, destination = {x=32154, y=31375, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})


end

--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:addModule(FocusModule:new())