local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local count = {}
local transfer = {}
local pin = {}
local random_texts = {'Your gold safe at here, <snickers>!', 'Me take all gold! Good care! Give! Give!', 'Problems with market? Read the blackboard.'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
local random_word_bank = 0

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)   end
function onThink()
	if random_word_bank < os.time() then
		random_word_bank = (os.time() + random_texts_interval)
		if math.random(100) < random_texts_chance then
			Npc():say(random_texts[math.random(#random_texts)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function isValidMoney(money)
	return (isNumber(money) and money > 0 and money < 4294967296)
end

local function getCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if isValidMoney(money) then
		return money
	end
	return -1
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
		selfSay("Enigma City has advanced bank system preventing mistakes such as money glitches and values below 0. If you find any mistake record and report it, you will be rewarded.", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'help') or msgcontains(msg, 'functions') then
		selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'bank') then
		selfSay("We can change money for you. You can also access your bank account.", cid)
		npcHandler.topic[cid] = 0
		return true
	elseif msgcontains(msg, 'job') then
		selfSay("Me work in this store! Me keep your gold safe, <snickers>!", cid)
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
			selfSay("Nice, You have made your first million and it grows! Your account balance is " .. player:getBankBalance() .. " gold.", cid)
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
			selfSay("You don't have any gold with you.", cid)
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
				count[cid] = getCount(msg)
				if count[cid] < 1 then
					selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
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
		count[cid] = getCount(msg)
		if isValidMoney(count[cid]) then
			selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
			npcHandler.topic[cid] = 2
			return true
		else
			selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
			return true
		end
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:getMoney() >= tonumber(count[cid]) then
				player:depositMoney(count[cid])
				selfSay("Me added " .. count[cid] .. " gold to your balance. Your current balance is " .. player:getBankBalance() .. ".", cid)
			else
				selfSay("Give gold! Give, give me! Now!", cid)
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		npcHandler.topic[cid] = 0
		return true
---------------------------- withdraw --------------------
	elseif msgcontains(msg, 'withdraw') then
		if string.match(msg,"%d+") then
			count[cid] = getCount(msg)
			if isValidMoney(count[cid]) then
				selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
				npcHandler.topic[cid] = 7
			else
				selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
				npcHandler.topic[cid] = 0
			end
			return true
		else
			selfSay("Please tell me how much gold you would like to withdraw.", cid)
			npcHandler.topic[cid] = 6
			return true
		end
	elseif npcHandler.topic[cid] == 6 then
		count[cid] = getCount(msg)
		if isValidMoney(count[cid]) then
			selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
			npcHandler.topic[cid] = 7
		else
			selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		end
		return true
	elseif npcHandler.topic[cid] == 7 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if not player:withdrawMoney(count[cid]) then
				selfSay("You don't have that much gold. Your gold is " .. player:getBankBalance() .. "! This bank doesn't support borrows!", cid)
				npcHandler.topic[cid] = 0
			else
				selfSay("Here, " .. count[cid] .. " gold.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		end
		return true
---------------------------- transfer --------------------
	elseif msgcontains(msg, 'transfer') then
		selfSay("How much gold you want to transfer?", cid)
		npcHandler.topic[cid] = 11
	elseif npcHandler.topic[cid] == 11 then
		count[cid] = getCount(msg)
		if Player(cid):getBankBalance() < count[cid] then
			selfSay("You don't have that much gold!", cid)
			npcHandler.topic[cid] = 0
			return true
		end
		if isValidMoney(count[cid]) then
			selfSay("Who would you like transfer " .. count[cid] .. " gold to?", cid)
			npcHandler.topic[cid] = 12
		else
			selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 12 then
		transfer[cid] = msg
		if Player(cid):getName() == transfer[cid] then
			selfSay("No, NO! Fill in this field with person who receives your gold!", cid)
			npcHandler.topic[cid] = 0
			return true
		end
		
		if playerExists(transfer[cid]) then
			selfSay("So you would like to transfer " .. count[cid] .. " gold to {" .. transfer[cid] .. "}?", cid)
			npcHandler.topic[cid] = 13
		else
			selfSay("Check this name again, \"" .. transfer[cid] .. "\" isn't vaild person.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 13 then
		if msgcontains(msg, 'yes') then
			if not Player(cid):transferMoneyTo(transfer[cid], count[cid]) then
				selfSay("You cannot transfer money to this account.", cid)
			else
				selfSay("" .. count[cid] .. " gold transferred to {" .. transfer[cid] .."}.", cid)
				transfer[cid] = nil
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		npcHandler.topic[cid] = 0
---------------------------- money exchange --------------
	elseif msgcontains(msg, 'change gold') then
		selfSay("How many platinum coins would you like to get?", cid)
		npcHandler.topic[cid] = 14
	elseif npcHandler.topic[cid] == 14 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getCount(msg)
			selfSay(count[cid] * 100 .. " gold into " .. count[cid] .. " platinum, correct?", cid)
			npcHandler.topic[cid] = 15
		end
	elseif npcHandler.topic[cid] == 15 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2148, count[cid] * 100) then
				player:addItem(2152, count[cid])
				selfSay("Here.", cid)
			else
				selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change platinum') then
		selfSay("Me change {gold} or {crystal}?", cid)
		npcHandler.topic[cid] = 16
	elseif npcHandler.topic[cid] == 16 then
		if msgcontains(msg, 'gold') then
			selfSay("How many platinum coins would you like to change into gold?", cid)
			npcHandler.topic[cid] = 17
		elseif msgcontains(msg, 'crystal') then
			selfSay("How many crystal coins would you like to get?", cid)
			npcHandler.topic[cid] = 19
		else
			selfSay("Then why you even asked! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 17 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getCount(msg)
			selfSay(count[cid] .. " platinum into " .. count[cid] * 100 .. " gold, correct?", cid)
			npcHandler.topic[cid] = 18
		end
	elseif npcHandler.topic[cid] == 18 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2152, count[cid]) then
				selfSay("Here.", cid)
				player:addItem(2148, count[cid] * 100)
			else
				selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 19 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getCount(msg)
			selfSay(count[cid] * 100 .. " platinum into " .. count[cid] .. " crystal, correct?", cid)
			npcHandler.topic[cid] = 20
		end
	elseif npcHandler.topic[cid] == 20 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2152, count[cid] * 100) then
				selfSay("Here you are.", cid)
				player:addItem(2160, count[cid])
			else
				selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		selfSay("How many crystal coins would you like to change into platinum?", cid)
		npcHandler.topic[cid] = 21
	elseif npcHandler.topic[cid] == 21 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			selfSay("Then why you even asked! <gives you an evil look>", cid)
			npcHandler.topic[cid] = 0
		else
			count[cid] = getCount(msg)
			selfSay(count[cid] .. " crystal into " .. count[cid] * 100 .. " platinum, correct?", cid)
			npcHandler.topic[cid] = 22
		end
	elseif npcHandler.topic[cid] == 22 then
		if msgcontains(msg, 'yes') then
			local player = Player(cid)
			if player:removeItem(2160, count[cid])  then
				selfSay("Here you are.", cid)
				player:addItem(2152, count[cid] * 100)
			else
				selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
			end
		else
			selfSay("Then why you even asked! <gives you an evil look>", cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'change') then
		selfSay("Different coin types, gold, platinum, crystal. 100 equeals 1 next value. To change tell change with value.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
