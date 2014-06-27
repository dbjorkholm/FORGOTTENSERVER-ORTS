local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function SimonBeggarStaffStorage(cid, message, keywords, parameters, node)
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if player:getStorageValue(60134) == -1 then
		player:setStorageValue(60134, 1)
		npcHandler:say("Good! Come back to me once you have retrieved my staff. Good luck.", cid)
	else
		npcHandler:say("I alrealy give you information about mine staff.", cid)
	end
end

function BeggarFirst(cid, message, keywords, parameters, node)
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if configManager.getBoolean(configKeys.FREE_PREMIUM) or isPremium(cid) == true then
		if player:getStorageValue(22029) == -1 then
			if player:getItemCount(5883) >= 100 and player:getMoney() >= 20000 then
				if player:removeItem(5883, 100) and player:removeMoney(20000) then
					npcHandler:say("Ah, right! The beggar beard or beggar dress! Here you go.", cid)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:setStorageValue(22029, 1)
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
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if configManager.getBoolean(configKeys.FREE_PREMIUM) or isPremium(cid) == true then
		if player:getStorageValue(22030) == -1 then	
			if player:getItemCount(6107) >= 1 then
				if player:removeItem(6107, 1) then
					npcHandler:say("Ah, right! The Beggar Staff! Here you go.", cid)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
					player:setStorageValue(22030, 1)
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
	local player = Player(cid)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if player:getMoney() >= 800 then
		if player:removeItem(800) then
			npcHandler:say("Here, take the key!", cid)
			local key = player:addItem(2087, 1)
			key:setActionId(3940)
		end
	else
		npcHandler:say("You don't have enough money for the key!", cid)
	end
end

node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'For the small fee of 20000 gold pieces I will help you mix this potion. Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...Do we have a deal?'})
node1:addChildKeyword({'yes'}, BeggarFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'dress'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'For the small fee of 20000 gold pieces I will help you mix this potion. Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...Do we have a deal?'})
node2:addChildKeyword({'yes'}, BeggarFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'staff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get beggar staff you need to give me simon the beggar\'s staff. Do you have it with you?'})
node3:addChildKeyword({'yes'}, BeggarSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get the fibula key you need to give me 800 gold coins, do you have them with you?'})
node4:addChildKeyword({'yes'}, key, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())
