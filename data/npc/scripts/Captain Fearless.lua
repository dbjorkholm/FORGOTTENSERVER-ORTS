local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say('Passages to Thais, Carlin, Ab\'Dendriel, Port Hope, Edron, Darashia, Liberty Bay, Svargrond, Gray Island, Yalahar and Ankrahmun.', TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	if msgcontains(msg, 'darashia') then
		npcHandler:say('Do you seek a passage to Darashia for 60 gold?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('I warn you! This route is haunted by a ghostship. Do you really want to go there?',cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler.topic[cid] = 0
			local player = Player(cid)
			if not player:removeMoney(60) then
				npcHandler:say('You don\'t have enough money.', cid)
				return true
			end
			
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local position = math.random(10) == 1 and Position(33324, 32173, 6) or Position(33289, 32481, 6)
			player:teleportTo(position)
			position:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say('Set the sails!', cid)
		end
	end
	return true
end

local travelNode = keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Thais for 170 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 170, destination = {x=32310, y=32210, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Carlin for 130 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 130, destination = {x=32387, y=31820, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'gray island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Gray Island for 150 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, destination = {x=33196, y=31984, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'ab\'dendriel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Ab\'Dendriel for 90 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 90, destination = {x=32734, y=31668, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Edron for 40 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 40, destination = {x=33173, y=31764, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Port Hope for 160 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, destination = {x=32527, y=32784, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Svargrond for 150 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, destination = {x=32341, y=31108, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'liberty bay'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Liberty Bay for 180 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 180, destination = {x=32285, y=32892, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'yalahar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Yalahar for 185 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 185, destination = {x=32816, y=31272, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

local travelNode = keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Ankrahmun for 150 gold?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, destination = {x=33092, y=32883, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Thais}, {Carlin}, {Ab\'Dendriel}, {Port Hope}, {Edron}, {Darashia}, {Liberty Bay}, {Svargrond}, {Yalahar}, {Gray Island} or {Ankrahmun}?'})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Where do you want to go? To {Thais}, {Carlin}, {Ab\'Dendriel}, {Port Hope}, {Edron}, {Darashia}, {Liberty Bay}, {Svargrond}, {Yalahar}, {Gray Island} or {Ankrahmun}?'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the captain of this ship.'})
keywordHandler:addKeyword({'venore'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'This is Venore. Where do you want to go?'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My name is Captain Fearless from the Royal Tibia Line.'})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Welcome on board, |PLAYERNAME|. Where can I {sail} you today?')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye. Recommend us if you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye then.')
npcHandler:addModule(FocusModule:new())
