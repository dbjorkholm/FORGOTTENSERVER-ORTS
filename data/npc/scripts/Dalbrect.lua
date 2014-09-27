local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local travelNode = keywordHandler:addKeyword({'isle of the kings'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to the isle of the kings for 10 gold coins?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 10, destination = {x = 32190, y = 31957, z = 6} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'We would like to serve you some time.'})
	
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	if msgcontains(msg, 'brooch') then
		if player:getStorageValue(Storage.WhiteRavenMonasteryQuest.Passage) == 1 then
			npcHandler:say('You have recovered my brooch! I shall forever be in your debt, my friend!', cid)
			return true
		end

		npcHandler:say('What? You want me to examine a brooch?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'passage') then
		if player:getStorageValue(Storage.WhiteRavenMonasteryQuest.Passage) ~= 1 then
			npcHandler:say('I have only sailed to the isle of the kings once or twice. I dare not anger the monks by bringing travellers there without their permission.', cid)
			return true
		end

		npcHandler:say('Since you are my friend now I will sail you to the isle of the kings for 10 gold. Is that okay for you?', cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(2318) == 0 then
				npcHandler:say('What are you talking about? I am too poor to be interested in jewelry.', cid)
				npcHandler.topic[cid] = 0
				return true
			end

			npcHandler:say('Can it be? I recognise my family\'s arms! You have found a treasure indeed! I am poor and all I can offer you is my friendship, but ... please ... give that brooch to me?', cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler.topic[cid] = 0
			if not player:removeItem(2318, 1) then
				npcHandler:say('I should have known better than to ask for an act of kindness in this cruel, selfish, world!', cid)
				return true
			end

			npcHandler:say('Thank you! I shall consider you my friend from now on! Just let me know if you {need} something!', cid)
			player:setStorageValue(Storage.WhiteRavenMonasteryQuest.Passage, 1)
			player:setStorageValue(Storage.WhiteRavenMonasteryQuest.QuestLog, 1) -- Quest log
		elseif npcHandler.topic[cid] == 3 then
			npcHandler.topic[cid] = 0
			if not player:removeMoney(10) then
				npcHandler:say('You don\'t have enough money.', cid)
				return true
			end

			local destination = Position(32190, 31957, 6)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:say('Have a nice trip!', cid)
		end
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Then stop being a fool. I am poor and I have to work the whole day through!', cid)
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say('I should have known better than to ask for an act of kindness in this cruel, selfish, world!', cid)
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say('Well, I\'ll be here if you change your mind.', cid)
		end
		npcHandler.topic[cid] = 0
	end
	return true
end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Dalbrect Windtrouser, of the once proud Windtrouser family."})
keywordHandler:addKeyword({'hut'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am merely a humble fisher now that nothing is left of my noble {legacy}."})
keywordHandler:addKeyword({'legacy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Once my family was once noble and wealthy, but {fate} turned against us and threw us into poverty."})
keywordHandler:addKeyword({'poverty'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that {project}."})
keywordHandler:addKeyword({'fate'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "When Carlin tried to colonize the region now known as the ghostlands, my ancestors put their fortune in that {project}."})
keywordHandler:addKeyword({'ghostlands'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our family fortune was lost when the colonization of those cursed lands failed. Now nothing is left of our fame or our fortune. If I only had something as a reminder of those better times. <sigh>"})
keywordHandler:addKeyword({'project'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Our family fortune was lost when the colonization of those cursed lands failed. Now nothing is left of our fame or our fortune. If I only had something as a reminder of those better times. <sigh>"})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To think my family used to belong to the local nobility! And now those arrogant women are in charge!"})
keywordHandler:addKeyword({'need'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "There is little I can offer you but a trip with my boat. Are you looking for a {passage} to the isle of kings perhaps?"})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is my only pride and joy."})

npcHandler:setMessage(MESSAGE_GREET, "Be greeted, traveller |PLAYERNAME|. Welcome to my {hut}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. You are welcome.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
