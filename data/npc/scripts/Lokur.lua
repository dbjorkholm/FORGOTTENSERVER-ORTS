local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}
local pin = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)   end
local rnd_sounds = 0
function onThink()
	if(rnd_sounds < os.time()) then
		rnd_sounds = (os.time() + 5)
		if(math.random(100) < 25) then
			Npc():say("It's a wise idea to store your money in your bank account.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function greetCallback(cid)
	count[cid], transfer[cid], pin[cid] = nil, nil, nil
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
---------------------------- help ------------------------
	if msgcontains(msg, 'advanced') then
		selfSay("Your bank account will be used automatically when you want to {rent} a house or place an offer on an item on the {market}. Let me know if you want to know about how either one works.", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'help') or msgcontains(msg, 'functions') then
		selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'bank') then
		selfSay("We can {change} money for you. You can also access your {bank account}.", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'bank account') then
		npcHandler:say({'Every Tibian has one. The big advantage is that you can access your money in every branch of the Tibian Bank! ...',
		'Would you like to know more about the {basic} functions of your bank account, the {advanced} functions, or are you already bored, perhaps?'}, cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'basic') then
		selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'job') then
		selfSay("I work in this bank. I can change money for you and help you with your bank account.", cid)
		npcHandler.topic[cid] = 0
		return true
---------------------------- balance ---------------------
	elseif msgcontains(msg, 'balance') then
		npcHandler.topic[cid] = 0
		local player = Player(cid)
		if player:getBankBalance() >= 100000000 then
			selfSay("I think you must be one of the richest inhabitants in the world! Your account balance is " .. player:getBankBalance() .. " gold.", cid)
			return true
		elseif player:getBankBalance() >= 10000000 then
			selfSay("You have made ten millions and it still grows! Your account balance is " .. player:getBankBalance() .. " gold.", cid)
			return true
		elseif player:getBankBalance() >= 1000000 then
			selfSay("Wow, you have reached the magic number of a million gp!!! Your account balance is " .. player:getBankBalance() .. " gold!", cid)
			return true
		elseif player:getBankBalance() >= 100000 then
			selfSay("You certainly have made a pretty penny. Your account balance is " .. player:getBankBalance() .. " gold.", cid)
			return true
		else
			selfSay("Your account balance is " .. player:getBankBalance() .. " gold.", cid)
			return true
		end
---------------------------- deposit ---------------------
	elseif msgcontains(msg, 'deposit') then
		local player = Player(cid)
		count[cid] = player:getMoney()
		if count[cid] < 1 then
			selfSay("You do not have enough gold.", cid)
			npcHandler.topic[cid] = 0
			return false
		end

		if msgcontains(msg, 'all') then
			count[cid] = player:getMoney()
			selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
			npcHandler.topic[cid] = 2
			return true
		else
			if string.match(msg,"%d+") then
				count[cid] = getMoneyCount(msg)
				if count[cid] < 1 then
					selfSay("You do not have enough gold.", cid)
					npcHandler.topic[cid] = 0
					return false
				end

				selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
				npcHandler.topic[cid] = 2
				return true
			else
				selfSay("Please tell me how much gold it is you would like to deposit.", cid)
				npcHandler.topic[cid] = 1
				return true
			end      
		end

		if not isValidMoney(count[cid]) then
			selfSay("Sorry, but you can't deposit that much.", cid)
			npcHandler.topic[cid] = 0
			return false
		end
	elseif npcHandler.topic[cid] == 1 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
			npcHandler.topic[cid] = 2
			return true
		else
			selfSay("You do not have enough gold.", cid)
			npcHandler.topic[cid] = 0
			return true
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:getMoney() >= tonumber(count[cid]) then
				player:depositMoney(count[cid])
				selfSay("Alright, we have added the amount of " .. count[cid] .. " gold to your {balance}. You can {withdraw} your money anytime you want to.", cid)
			else
				selfSay("You do not have enough gold.", cid)
			end
		elseif msgcontains(msg, 'no') then
			selfSay("As you wish. Is there something else I can do for you?", cid)
		end
		npcHandler.topic[cid] = 0
		return true
---------------------------- withdraw --------------------
	elseif msgcontains(msg, 'withdraw') then
		if string.match(msg,"%d+") then
			count[cid] = getMoneyCount(msg)
			if isValidMoney(count[cid]) then
				selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
				npcHandler.topic[cid] = 7
			else
				selfSay("There is not enough gold on your account.", cid)
				npcHandler.topic[cid] = 0
			end
			return true
		else
			selfSay("Please tell me how much gold you would like to withdraw.", cid)
			npcHandler.topic[cid] = 6
			return true
		end
	elseif npcHandler.topic[cid] == 6 then
		count[cid] = getMoneyCount(msg)
		if isValidMoney(count[cid]) then
			selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
			npcHandler.topic[cid] = 7
		else
			selfSay("There is not enough gold on your account.", cid)
			npcHandler.topic[cid] = 0
		end
		return true
	elseif npcHandler.topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if not player:withdrawMoney(count[cid]) then
				selfSay("There is not enough gold on your account.", cid)
				npcHandler.topic[cid] = 0
			else
				selfSay("Here you are, " .. count[cid] .. " gold. Please let me know if there is something else I can do for you.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif msgcontains(msg, 'no') then
			selfSay("The customer is king! Come back anytime you want to if you wish to {withdraw} your money.", cid)
			npcHandler.topic[cid] = 0
		end
		return true
---------------------------- transfer --------------------
	elseif msgcontains(msg, 'transfer') then
		selfSay("Please tell me the amount of gold you would like to transfer.", cid)
		npcHandler.topic[cid] = 11
	elseif npcHandler.topic[cid] == 11 then
		count[cid] = getMoneyCount(msg)
		if Player(cid):getBankBalance() < count[cid] then
			selfSay("There is not enough gold on your account.", cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if isValidMoney(count[cid]) then
			selfSay("Who would you like transfer " .. count[cid] .. " gold to?", cid)
			npcHandler.topic[cid] = 12
		else
			selfSay("There is not enough gold on your account.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 12 then
		transfer[cid] = msg
		if Player(cid):getName() == transfer[cid] then
			selfSay("Fill in this field with person who receives your gold!", cid)
			npcHandler.topic[cid] = 0
			return true
		end

		if playerExists(transfer[cid]) then
			selfSay("So you would like to transfer " .. count[cid] .. " gold to " .. transfer[cid] .. "?", cid)
			npcHandler.topic[cid] = 13
		else
			selfSay("This player does not exist.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 13 then
		if msgcontains(msg, 'yes') then
			if not Player(cid):transferMoneyTo(transfer[cid], count[cid]) then
				selfSay("You cannot transfer money to this account.", cid)
			else
				selfSay("Very well. You have transferred " .. count[cid] .. " gold to " .. transfer[cid] ..".", cid)
				transfer[cid] = nil
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Alright, is there something else I can do for you?", cid)
		end
		npcHandler.topic[cid] = 0
---------------------------- money exchange --------------
	elseif msgcontains(msg, 'change gold') then
		selfSay("How many platinum coins would you like to get?", cid)
		npcHandler.topic[cid] = 14
	elseif npcHandler.topic[cid] == 14 then
		if getMoneyCount(msg) < 1 then
			selfSay("Sorry, you do not have enough gold coins.", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			selfSay("So you would like me to change " .. count[cid] * 100 .. " of your gold coins into " .. count[cid] .. " platinum coins?", cid)
			npcHandler.topic[cid] = 15
		end
	elseif npcHandler.topic[cid] == 15 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2148, count[cid] * 100) then
				player:addItem(2152, count[cid])
				selfSay("Here you are.", cid)
			else
				selfSay("Sorry, you do not have enough gold coins.", cid)
			end
		else
			selfSay("Well, can I help you with something else?", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change platinum') then
		selfSay("Would you like to change your platinum coins into gold or crystal?", cid)
		npcHandler.topic[cid] = 16
	elseif npcHandler.topic[cid] == 16 then
		if msgcontains(msg, 'gold') then
			selfSay("How many platinum coins would you like to change into gold?", cid)
			npcHandler.topic[cid] = 17
		elseif msgcontains(msg, 'crystal') then
			selfSay("How many crystal coins would you like to get?", cid)
			npcHandler.topic[cid] = 19
		else
			selfSay("Well, can I help you with something else?", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 17 then
		if getMoneyCount(msg) < 1 then
			selfSay("Sorry, you do not have enough platinum coins.", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			selfSay("So you would like me to change " .. count[cid] .. " of your platinum coins into " .. count[cid] * 100 .. " gold coins for you?", cid)
			npcHandler.topic[cid] = 18
		end
	elseif npcHandler.topic[cid] == 18 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2152, count[cid]) then
				player:addItem(2148, count[cid] * 100)
				selfSay("Here you are.", cid)
			else
				selfSay("Sorry, you do not have enough platinum coins.", cid)
			end
		else
			selfSay("Well, can I help you with something else?", cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 19 then
		if getMoneyCount(msg) < 1 then
			selfSay("Sorry, you do not have enough platinum coins.", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			selfSay("So you would like me to change " .. count[cid] * 100 .. " of your platinum coins into " .. count[cid] .. " crystal coins for you?", cid)
			npcHandler.topic[cid] = 20
		end
	elseif npcHandler.topic[cid] == 20 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2152, count[cid] * 100) then
				player:addItem(2160, count[cid])
				selfSay("Here you are.", cid)
			else
				selfSay("Sorry, you do not have enough platinum coins.", cid)
			end
		else
			selfSay("Well, can I help you with something else?", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		selfSay("How many crystal coins would you like to change into platinum?", cid)
		npcHandler.topic[cid] = 21
	elseif npcHandler.topic[cid] == 21 then
		if getMoneyCount(msg) < 1 then
			selfSay("Sorry, you do not have enough crystal coins.", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getMoneyCount(msg)
			selfSay("So you would like me to change " .. count[cid] .. " of your crystal coins into " .. count[cid] * 100 .. " platinum coins for you?", cid)
			npcHandler.topic[cid] = 22
		end
	elseif npcHandler.topic[cid] == 22 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2160, count[cid])  then
				player:addItem(2152, count[cid] * 100)
				selfSay("Here you are.", cid)
			else
				selfSay("Sorry, you do not have enough crystal coins.", cid)
			end
		else
			selfSay("Well, can I help you with something else?", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change') then
		selfSay("There are three different coin types in Tibia: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. So if you'd like to change 100 gold into 1 platinum, simply say '{change gold}' and then '1 platinum'.", cid)
		npcHandler.topic[cid] = 0
	end
	-- WAGON TICKET
	if msgcontains(msg, "ticket") then
		local player = Player(cid)
		if player:getStorageValue(Storage.wagonTicket) < os.time() then
			npcHandler:say("Do you want to purchase a weekly ticket for the ore wagons? With it you can travel freely and swiftly through Kazordoon for one week. 250 gold only. Deal?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("Your weekly ticket is still valid. Would be a waste of money to purchase a second one", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getMoney() >= 250 then
				player:removeMoney(250)
				player:setStorageValue(Storage.wagonTicket, os.time() + 7 * 24 * 60 * 60)
				npcHandler:say("Here is your stamp. It can't be transferred to another person and will last one week from now. You'll get notified upon using an ore wagon when it isn't valid anymore.", cid)
			else
				npcHandler:say("You don't have enough money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 1 then 
		if msgcontains(msg, "no") then 
			npcHandler:say("No then.", cid)	
			npcHandler.topic[cid] = 0
		end
	-- WAGON TICKET
	elseif msgcontains(msg, "measurements") then
		if player:getStorageValue(Storage.postman.Mission07) >= 1 then
			npcHandler:say("Come on, I have no clue what they are. Better ask my armorer Kroox for such nonsense.Go and ask him for good ol' Lokurs measurements, he'll know.", cid)
		end
	end
	return true
end

keywordHandler:addKeyword({'money'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can {change} money for you. You can also access your {bank account}."})

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the Tibian {bank}, |PLAYERNAME|! What can I do for you?")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
