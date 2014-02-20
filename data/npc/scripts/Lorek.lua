local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
		
		keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard he is some scary magician or so."})

        
        
        -- OTServ event handling functions start
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        -- OTServ event handling functions end
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'east'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to the east end of Port Hope for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32679, y=32777, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe another time.'})

        local travelNode = keywordHandler:addKeyword({'center'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to the centre of Port Hope for free?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=32628, y=32771, z=7} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe another time.'})
			
local talkState = {}
local pos = {}
local darama = {x=32987, y=32729, z=7}
local chor = {x=32968, y=32799, z=7}
local banuta = {x=32826, y=32631, z=7}

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   	   	
	  if(getPlayerRank(cid) >= 3 ) then	 -- 3 = RANK_RANGER in KillingInTheNameOfQuest.lua on /data/lib/
		if (msgcontains(msg, 'darama')) then
			npcHandler:say('Do you seek a passage to Darama?', cid)
			talkState[talkUser] = 1
		elseif (msgcontains(msg, 'chor')) then
			npcHandler:say('Do you seek a passage to Chor?', cid)
			talkState[talkUser] = 2
		elseif (msgcontains(msg, 'banuta')) then
			npcHandler:say('Do you seek a passage to Banuta?', cid)
			talkState[talkUser] = 3
		end
		
		if (msgcontains(msg, 'yes')) then
			if (talkState[talkUser] == 1) then
				pos = darama
			elseif(talkState[talkUser] == 2) then
				pos = chor
			elseif(talkState[talkUser] == 3) then
				pos = banuta
			end
			doTeleportThing(cid, pos)
			doSendMagicEffect(pos, CONST_ME_TELEPORT)
		end
	 
	else
	npcHandler:say('Sorry, you are not a Hunters.', cid)
	end
	return true
end      
		npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
        npcHandler:addModule(FocusModule:new())