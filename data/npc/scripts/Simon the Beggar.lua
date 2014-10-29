local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'Alms! Alms for the poor!',
	'Sir, Ma\'am, have a gold coin to spare?',
	'I need help! Please help me!'
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

function BeggarFirst(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if player:isPremium() then
		if player:getStorageValue(Storage.OutfitQuest.BeggarFirstAddon) == -1 then
			if player:getItemCount(5883) >= 100 and player:getMoney() >= 20000 then
				if player:removeItem(5883, 100) and player:removeMoney(20000) then
					npcHandler:say("Ah, right! The beggar beard or beggar dress! Here you go.", cid)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:setStorageValue(Storage.OutfitQuest.BeggarFirstAddon, 1)
					player:addOutfitAddon(153, 1)
					player:addOutfitAddon(157, 1)
				end
			else
				npcHandler:say("You do not have all the required items.", cid)
			end
		else
			npcHandler:say("It seems you already have this addon, don't you try to mock me son!", cid)
		end
	end
end

function BeggarSecond(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if player:isPremium() then
		if player:getStorageValue(Storage.OutfitQuest.BeggarSecondAddon) == -1 then
			if player:getItemCount(6107) >= 1 then
				if player:removeItem(6107, 1) then
					npcHandler:say("Ah, right! The beggar staff! Here you go.", cid)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:setStorageValue(Storage.OutfitQuest.BeggarSecondAddon, 1)
					player:addOutfitAddon(153, 2)
					player:addOutfitAddon(157, 2)
				end
			else
				npcHandler:say("You do not have all the required items.", cid)
			end
		else
			npcHandler:say("It seems you already have this addon, don't you try to mock me son!", cid)
		end
	end
end

function key(cid, message, keywords, parameters, node)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if player:getMoney() >= 800 then
		if player:removeMoney(800) then
			npcHandler:say("Here, take the key!", cid)
			local key = player:addItem(2087, 1)
			if key then
				key:setActionId(3940)
			end
		end
	else
		npcHandler:say("You don't have enough money for the key!", cid)
	end
end

node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, text = 'For the small fee of 20000 gold pieces I will help you mix this potion. Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...Do we have a deal?'})
node1:addChildKeyword({'yes'}, BeggarFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'dress'}, StdModule.say, {npcHandler = npcHandler, text = 'For the small fee of 20000 gold pieces I will help you mix this potion. Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...Do we have a deal?'})
node2:addChildKeyword({'yes'}, BeggarFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'staff'}, StdModule.say, {npcHandler = npcHandler, text = 'To get beggar staff you need to give me simon the beggar\'s staff. Do you have it with you?'})
node3:addChildKeyword({'yes'}, BeggarSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, text = 'To get the fibula key you need to give me 800 gold coins, do you have them with you?'})
node4:addChildKeyword({'yes'}, key, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. I am a poor man. Please help me.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Have a nice day.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Have a nice day.")

npcHandler:addModule(FocusModule:new())
