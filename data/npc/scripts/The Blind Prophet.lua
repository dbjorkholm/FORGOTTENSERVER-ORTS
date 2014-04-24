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
	local travelNode = keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You want me to transport you to forbidden land?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33025, y=32580, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Take care! '})

        keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me put name away name long ago. Now only blind prophet of ape people are.'})
        keywordHandler:addKeyword({'blind prophet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me is who in dreams speak to holy banana. Me divine the will of banana.'})
        keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me {prophet} and {guardian} is.'})
        keywordHandler:addKeyword({'prophet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me is who in dreams speak to holy banana. Me divine the will of banana.'})
        keywordHandler:addKeyword({'guardian'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me guard the forbidden land behind the great palisade. If any want to enter, he must ask me for transport.'})
        keywordHandler:addKeyword({'forbidden land'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me guard the forbidden land behind the great palisade. If any want to enter, he must ask me for transport.'})
	keywordHandler:addKeyword({'hairycles'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Good ape he is. Has to work hard to make other apes listen but you helped a lot.'})
	keywordHandler:addKeyword({'bong'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ' Our holy ancestor he is. Big as mountain. Lizards say they built palisade to keep him but we not believe ... We think Bong palisade built to have peace from pesky lizards. We respect peace of Bong, keep people away from forbidden land.'})
        keywordHandler:addKeyword({'Lizards'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ' The lizards evil and vengeful are. Ape people on guard must be.'})
        keywordHandler:addKeyword({'ape'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Our people a lot to learn have. One day we might live in peace with you hairless apes, who knows.'})
        keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me not know. Me seldom have visions of not banana related objects.'})
        keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Hairless apes strange people are. '})
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
