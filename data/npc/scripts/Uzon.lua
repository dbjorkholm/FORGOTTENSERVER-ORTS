local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 5)
		if(math.random(100) < 25) then
			Npc():say("Feel the wind in your hair during one of my carpet rides!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

	keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Uzon Ibn Kalith."})
	keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a licensed Darashian carpetpilot. I can bring you to Darashia or Edron."})
	keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
	keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
	keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, there is so much to tell about Daraman. You better travel to Darama to learn about his teachings."})
	keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would never transport this one."})
	keywordHandler:addKeyword({'drefia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So you heared about haunted Drefia? Many adventures travel there to test their skills against the undead: vampires, mummies, and ghosts."})
	keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some people claim it is hidden somewhere under the endless sands of the devourer desert in Darama."})
	keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is noisy and overcroweded. That's why I like Darashia more."})
	keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have seen almost every place on the continent."})
	keywordHandler:addKeyword({'continent'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I could retell the tales of my travels for hours. Sadly another flight is scheduled soon."})
	keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just another Thais but with women to lead them."})
	keywordHandler:addKeyword({'flying'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy flying carpets only in Darashia."})
	keywordHandler:addKeyword({'fly'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I transport travellers to the continent of Darama for a small fee. So many want to see the wonders of the desert and learn the secrets of Darama."})
	keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
	keywordHandler:addKeyword({'rumors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
	keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
	keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
	keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
	keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})

	local travelNode = keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Darashia on Darama for 60 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=33270, y=32441, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

	local travelNode = keywordHandler:addKeyword({'svargrond'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Svargrond for 60 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 60, destination = {x=32253, y=31097, z=4} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Edron for 60 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 60, cost = 0, destination = {x = 33175, y = 31764, z = 6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

	local travelNode = keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Kazordoon for 80 gold?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 80, destination = {x=33193, y=31784, z=3} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "eclipse") then
		if player:getStorageValue(Storage.TheInquisition.Questline) == 4 then
			npcHandler:say('Oh no, so the time has come? Do you really want me to fly you to this unholy place?', cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "farmine") then
		if player:getStorageValue(Storage.TheNewFrontier.Mission10) == 1 then
			npcHandler:say("Do you seek a ride to Farmine for 60 gold?", cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Never heard about a place like this.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then	
			npcHandler:say('Hold on!', cid)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32659, y = 31915, z = 0}, false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		elseif npcHandler.topic[cid] == 2 then
			if player:removeMoney(60) then
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:teleportTo(Position(32983, 31539, 1), false)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				npcHandler:say("Hold on!", cid)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] > 0 then
		npcHandler:say("You shouldn't miss the experience.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Daraman's blessings, traveller |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Daraman's blessings")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Daraman's blessings")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
