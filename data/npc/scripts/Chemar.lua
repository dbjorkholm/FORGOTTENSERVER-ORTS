local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local voices = {
	'Ask me if you need letters or parcels. I\'ll deliver them via airmail, of course!',
	'Feel the wind in your hair during one of my carpet rides!'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, 'farmine') then
		if Player(cid):getStorageValue(Storage.TheNewFrontier.Mission10) ~= 1 then
			npcHandler:say('Never heard about a place like this.', cid)
			return true
		end

		npcHandler:say('Do you seek a ride to Farmine for 60 gold?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 0
		local player = Player(cid)
		if not player:removeMoney(60) then
			npcHandler:say('You don\'t have enough money.', cid)
			return true
		end

		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		local destination = Position(32983, 31539, 1)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		npcHandler:say('Set the sails!', cid)
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler:say('You shouldn\'t miss the experience.', cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Edron for 40 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 40, destination = {x=33193, y=31784, z=3} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Svargrond for 60 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32253, y=31097, z=4} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'femor hills'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Femor Hills for 60 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32536, y=31837, z=4} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'hills'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to the Femor Hills for 60 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32536, y=31837, z=4} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local travelNode = keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Kazordoon for 80 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 80, destination = {x=32588, y=31941, z=0} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

npcHandler:setMessage(MESSAGE_GREET, 'Daraman\'s blessings, traveller |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'It was a pleasure to help you, |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'It was a pleasure to help you, |PLAYERNAME|.')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
