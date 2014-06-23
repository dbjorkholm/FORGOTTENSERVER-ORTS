local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known all over the world as Captain Sinbeard"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can transport everything you want."})
keywordHandler:addKeyword({'passanger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We would like to welcome you on board."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Liberty Bay, Yalahar, Gray Island,Port Hope or Edron?"})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Liberty Bay, Yalahar, Gray Island,Port Hope or Edron?"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text ="Where do you want to go? To Darashia, Venore, Liberty Bay, Yalahar, Gray Island,Port Hope or Edron?"})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Liberty Bay, Yalahar, Gray Island,Port Hope or Edron?"})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Liberty Bay, Yalahar, Gray Island,Port Hope or Edron?"})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Liberty Bay, Yalahar, Gray Island,Port Hope or Edron?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Liberty Bay, Yalahar, Gray Island,Port Hope or Edron?"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})
        

 --************************************************************Travel************************************************************************************************************

 if luaFlags.freeBoats then

        
	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Edron for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33173, y=31764, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
		
	travelNode = keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Venore for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32954, y=32022, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
	
	travelNode = keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Port Hope for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32527, y=32784, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

	travelNode = keywordHandler:addKeyword({'liberty bay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Liberty Bay for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32285, y=32892, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
	
	travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Darashia for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33289, y=32480, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

	travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Yalahar for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32816, y=31272, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})	
		
	travelNode = keywordHandler:addKeyword({'gray island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Gray Island for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33196, y=31984, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
				
else


	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Edron for 160 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, destination = {x=33173, y=31764, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
		
	travelNode = keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Venore for 150 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, destination = {x=32954, y=32022, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
	
	travelNode = keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Port Hope for 80 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 80, destination = {x=32527, y=32784, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

	travelNode = keywordHandler:addKeyword({'liberty bay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Liberty Bay for 90 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 90, destination = {x=32285, y=32892, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
	
	travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Darashia for 100 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 100, destination = {x=33289, y=32480, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

	travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Yalahar for 230 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 230, destination = {x=32816, y=31272, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})	
		
	travelNode = keywordHandler:addKeyword({'gray island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to sail to Gray Island for 150 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, destination = {x=33196, y=31984, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
		
end

--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:addModule(FocusModule:new())