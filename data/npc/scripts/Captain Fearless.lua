local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)          npcHandler:onCreatureAppear(cid)               end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)       end

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


local function getDarashiaGhostPosition(cid)
	local position = math.random(10) == 1 and Position(33324, 32173, 6) or Position(33289, 32481, 6)
	return position
end

local travelNode = keywordHandler:addKeyword({'darashia'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Darashia for %s?', cost = 60, discount = TravelLib.postmanDiscount})
	local childTravelNode = travelNode:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I warn you! This route is haunted by a ghostship. Do you really want to go there?'})
		childTravelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, discount = TravelLib.postmanDiscount, destination = getDarashiaGhostPosition})
		childTravelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'thais'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Thais for %s?', cost = 170, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 170, discount = TravelLib.postmanDiscount, destination = {x=32310, y=32210, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'carlin'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Carlin for %s?', cost = 130, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 130, discount = TravelLib.postmanDiscount, destination = {x=32387, y=31820, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'gray island'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Gray Island for %s?', cost = 150, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, destination = {x=33196, y=31984, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'ab\'dendriel'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Ab\'Dendriel for %s?', cost = 90, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 90, discount = TravelLib.postmanDiscount, destination = {x=32734, y=31668, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'edron'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Edron for %s?', cost = 40, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 40, discount = TravelLib.postmanDiscount, destination = {x=33173, y=31764, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'port hope'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Port Hope for %s?', cost = 160, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, discount = TravelLib.postmanDiscount, destination = {x=32527, y=32784, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'svargrond'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Svargrond for %s?', cost = 150, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, discount = TravelLib.postmanDiscount, destination = {x=32341, y=31108, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'liberty bay'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Liberty Bay for %s?', cost = 180, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 180, discount = TravelLib.postmanDiscount, destination = {x=32285, y=32892, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'yalahar'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Yalahar for %s?', cost = 185, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 185, discount = TravelLib.postmanDiscount, destination = {x=32816, y=31272, z=6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})

travelNode = keywordHandler:addKeyword({'ankrahmun'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Ankrahmun for %s?', cost = 150, discount = TravelLib.postmanDiscount})
	travelNode:addChildKeyword({'yes'}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, discount = TravelLib.postmanDiscount, destination = {x=33092, y=32883, z=6} })
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
