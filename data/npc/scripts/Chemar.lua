local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end

 --************************************************************Travel************************************************************************************************************

 if luaFlags.freeMagicCarpet then
		
	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Edron for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33193, y=31784, z=3} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
		   
	travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Svargrond for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32253, y=31097, z=4} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
		   
	travelNode = keywordHandler:addKeyword({'femor hills'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Femor Hills for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32536, y=31837, z=4} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
			
	travelNode = keywordHandler:addKeyword({'hills'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Femor Hills for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32536, y=31837, z=4} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
			
	travelNode = keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Kazordoon for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32588, y=31941, z=0} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

	travelNode = keywordHandler:addKeyword({'farmine'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Farmine for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32983, y=31539, z=1} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

	
else


	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Edron for 40 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 40, destination = {x=33193, y=31784, z=3} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
		   
	travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Svargrond for 60 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32253, y=31097, z=4} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
		   
	travelNode = keywordHandler:addKeyword({'femor hills'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Femor Hills for 60 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32536, y=31837, z=4} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
			
	travelNode = keywordHandler:addKeyword({'hills'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Femor Hills for 60 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32536, y=31837, z=4} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
			
	travelNode = keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Kazordoon for 80 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 80, destination = {x=32588, y=31941, z=0} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

	travelNode = keywordHandler:addKeyword({'farmine'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Farmine for 60 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32983, y=31539, z=1} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})


end

--***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:addModule(FocusModule:new())
