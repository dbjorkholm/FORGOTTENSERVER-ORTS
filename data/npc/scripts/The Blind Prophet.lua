local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
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

function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(12120) <= 18 then
		npcHandler:setMessage(MESSAGE_GREET, "Oh! Hello! Hello!")
	elseif player:getStorageValue(12120) >= 19 then
		npcHandler:setMessage(MESSAGE_GREET, "Be greeted, friend of the apes.")
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "transport") then
		if player:getStorageValue(12120) >= 19 then
			npcHandler:say("You want me to transport you to forbidden land?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("You don't have access to forbidden land.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 1 then
		if  msgcontains(msg, 'yes') then
			npcHandler:say("Take care!", cid)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x=33025, y=32580, z=6})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
		if  msgcontains(msg, 'no') then
			npcHandler:say("Then no!", cid)
		end
	end
	return true
end
		
		

		
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
