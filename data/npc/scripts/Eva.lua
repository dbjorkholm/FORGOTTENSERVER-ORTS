local talkState = {}
local count = {}
local transfer = {}
local pin = {}
local random_texts = {'Your gold safe at here, <snickers>!', 'Me take all gold! Good care! Give! Give!', 'Problems with market? Read the blackboard.'}
local random_texts_chance = 40 -- percent
local random_texts_interval = 5 -- seconds
random_word_bank = 0
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)   end
function onThink()
   if(random_word_bank < os.time()) then
     random_word_bank = (os.time() + random_texts_interval)
     if(math.random(1, 100) < random_texts_chance) then
       selfSay(random_texts[math.random(1, #random_texts)])
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
   if(isValidMoney(money)) then
     return money
   end
   return -1
end
local function greetCallback(cid)
   talkState[cid], count[cid], transfer[cid], pin[cid] = 0, nil, nil, nil
   return true
end
local function creatureSayCallback(cid, type, msg)
   if(not npcHandler:isFocused(cid)) then
     return false
   end
---------------------------- help ------------------------
   if msgcontains(msg, 'advanced') then
     selfSay("Enigma City has advanced bank system preventing mistakes such as money glitches and values below 0. If you find any mistake record and report it, you will be rewarded.", cid)
     talkState[cid] = 0
     return true
   elseif msgcontains(msg, 'help') or msgcontains(msg, 'functions') then
     selfSay("You can check the {balance} of your bank account, {deposit} money or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
     talkState[cid] = 0
     return true
   elseif msgcontains(msg, 'bank') then
     selfSay("We can change money for you. You can also access your bank account.", cid)
     talkState[cid] = 0
     return true
   elseif msgcontains(msg, 'job') then
     selfSay("Me work in this store! Me keep your gold safe, <snickers>!", cid)
     talkState[cid] = 0
     return true
---------------------------- balance ---------------------
   elseif msgcontains(msg, 'balance') then
     talkState[cid] = 0
     if getPlayerBalance(cid) >= 100000000 then
       selfSay("I think you must be one of the richest inhabitants in the world! Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
       return true
     elseif getPlayerBalance(cid) >= 10000000 then
       selfSay("You have made ten millions and it still grows! Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
       return true
     elseif getPlayerBalance(cid) >= 1000000 then
       selfSay("Nice, You have made your first million and it grows! Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
       return true
     elseif getPlayerBalance(cid) >= 100000 then
       selfSay("You certainly have made a pretty penny. Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
       return true
     else
       selfSay("Your account balance is " .. getPlayerBalance(cid) .. " gold.", cid)
       return true
     end
---------------------------- deposit ---------------------
   elseif msgcontains(msg, 'deposit') then
       count[cid] = getPlayerMoney(cid)
       if count[cid] < 1 then
       selfSay("You don't have any gold with you.", cid)
       talkState[cid] = 0
       return false
       end
      
     if msgcontains(msg, 'all') then
       count[cid] = getPlayerMoney(cid)
       selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
       talkState[cid] = 2
       return true
     else
       if string.match(msg,"%d+") then
         count[cid] = getCount(msg)
         if count[cid] < 1 then
         selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
         talkState[cid] = 0
         return false
         end
        
         selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
         talkState[cid] = 2
         return true
       else
         selfSay("Please tell me how much gold it is you would like to deposit.", cid)
         talkState[cid] = 1
         return true
       end      
     end
    
     if not isValidMoney(count[cid]) then
       selfSay("Sorry, but you can't deposit that much.", cid)
       talkState[cid] = 0
       return false
     end
   elseif talkState[cid] == 1 then
     count[cid] = getCount(msg)
     if isValidMoney(count[cid]) then
       selfSay("Would you really like to deposit " .. count[cid] .. " gold?", cid)
       talkState[cid] = 2
       return true
     else
       selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
       talkState[cid] = 0
       return true
     end
   elseif talkState[cid] == 2 then
     if msgcontains(msg, 'yes') then
       if getPlayerMoney(cid) >= tonumber(count[cid]) then
         doPlayerDepositMoney(cid, count[cid])
         selfSay("Me added " .. count[cid] .. " gold to your balance. Your current balance is " .. getPlayerBalance(cid) .. ".", cid)
       else
         selfSay("Give gold! Give, give me! Now!", cid)
       end
     elseif msgcontains(msg, 'no') then
       selfSay("Then why you even asked! <gives you an evil look>", cid)
     end
     talkState[cid] = 0
     return true
---------------------------- withdraw --------------------
   elseif msgcontains(msg, 'withdraw') then
     if string.match(msg,"%d+") then
       count[cid] = getCount(msg)
       if isValidMoney(count[cid]) then
         selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
         talkState[cid] = 7
       else
         selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
         talkState[cid] = 0
       end
       return true
     else
       selfSay("Please tell me how much gold you would like to withdraw.", cid)
       talkState[cid] = 6
       return true
     end
   elseif talkState[cid] == 6 then
     count[cid] = getCount(msg)
     if isValidMoney(count[cid]) then
       selfSay("Are you sure you wish to withdraw " .. count[cid] .. " gold from your bank account?", cid)
       talkState[cid] = 7
     else
       selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
       talkState[cid] = 0
     end
     return true
   elseif talkState[cid] == 7 then
     if msgcontains(msg, 'yes') then
       if not doPlayerWithdrawMoney(cid, count[cid]) then
         selfSay("You don't have that much gold. Your gold is " .. getPlayerBalance(cid) .. "! This bank doesn't support borrows!", cid)
         talkState[cid] = 0
       else
         selfSay("Here, " .. count[cid] .. " gold.", cid)
         talkState[cid] = 0
       end
     elseif msgcontains(msg, 'no') then
       selfSay("Then why you even asked! <gives you an evil look>", cid)
       talkState[cid] = 0
     end
     return true
---------------------------- transfer --------------------
   elseif msgcontains(msg, 'transfer') then
     selfSay("How much gold you want to transfer?", cid)
     talkState[cid] = 11
   elseif talkState[cid] == 11 then
     count[cid] = getCount(msg)
     if getPlayerBalance(cid) < count[cid] then
       selfSay("You don't have that much gold!", cid)
       talkState[cid] = 0
       return true
     end
     if isValidMoney(count[cid]) then
       selfSay("Who would you like transfer " .. count[cid] .. " gold to?", cid)
       talkState[cid] = 12
     else
       selfSay("No, No! No think me stupid in math! Bank not give for free! <gives you an evil look>", cid)
       talkState[cid] = 0
     end
   elseif talkState[cid] == 12 then
     transfer[cid] = msg
     if getCreatureName(cid) == transfer[cid] then
       selfSay("No, NO! Fill in this field with person who receives your gold!", cid)
       talkState[cid] = 0
       return true
     end
     if playerExists(transfer[cid]) then
       selfSay("So you would like to transfer " .. count[cid] .. " gold to \"" .. transfer[cid] .. "\" ?", cid)
       talkState[cid] = 13
     else
       selfSay("Check this name again, \"" .. transfer[cid] .. "\" isn't vaild person.", cid)
       talkState[cid] = 0
     end
   elseif talkState[cid] == 13 then
     if msgcontains(msg, 'yes') then
       if not doPlayerTransferMoneyTo(cid, transfer[cid], count[cid]) then
         selfSay("You cannot transfer money to this account.", cid)
       else
         selfSay("" .. count[cid] .. " gold transferred to \"" .. transfer[cid] .."\".", cid)
         transfer[cid] = nil
       end
     elseif msgcontains(msg, 'no') then
       selfSay("Then why you even asked! <gives you an evil look>", cid)
     end
     talkState[cid] = 0
---------------------------- money exchange --------------
   elseif msgcontains(msg, 'change gold') then
     selfSay("How many platinum coins would you like to get?", cid)
     talkState[cid] = 14
   elseif talkState[cid] == 14 then
     if getCount(msg) == -1 or getCount(msg) == 0 then
       selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
       talkState[cid] = 0
     else
       count[cid] = getCount(msg)
       selfSay("" .. count[cid] * 100 .. " gold into " .. count[cid] .. " platinum, correct?", cid)
       talkState[cid] = 15
     end
   elseif talkState[cid] == 15 then
     if msgcontains(msg, 'yes') then
       if doPlayerRemoveItem(cid, 2148, count[cid] * 100) then
         doPlayerAddItem(cid, 2152, count[cid])
         selfSay("Here.", cid)
       else
         selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
       end
     else
       selfSay("Then why you even asked! <gives you an evil look>", cid)
     end
     talkState[cid] = 0
   elseif msgcontains(msg, 'change platinum') then
     selfSay("Me change {gold} or {crystal}?", cid)
     talkState[cid] = 16
   elseif talkState[cid] == 16 then
     if msgcontains(msg, 'gold') then
       selfSay("How many platinum coins would you like to change into gold?", cid)
       talkState[cid] = 17
     elseif msgcontains(msg, 'crystal') then
       selfSay("How many crystal coins would you like to get?", cid)
       talkState[cid] = 19
     else
       selfSay("Then why you even asked! <gives you an evil look>", cid)
       talkState[cid] = 0
     end
   elseif talkState[cid] == 17 then
     if getCount(msg) == -1 or getCount(msg) == 0 then
       selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
       talkState[cid] = 0
     else
       count[cid] = getCount(msg)
       selfSay("" .. count[cid] .. " platinum into " .. count[cid] * 100 .. " gold, correct?", cid)
       talkState[cid] = 18
     end
   elseif talkState[cid] == 18 then
     if msgcontains(msg, 'yes') then
       if doPlayerRemoveItem(cid, 2152, count[cid]) then
         selfSay("Here.", cid)
         doPlayerAddItem(cid, 2148, count[cid] * 100)
       else
         selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
       end
     else
       selfSay("Then why you even asked! <gives you an evil look>", cid)
     end
     talkState[cid] = 0
   elseif talkState[cid] == 19 then
     if getCount(msg) == -1 or getCount(msg) == 0 then
       selfSay("Then why you even asked! <gives you an evil look>", cid)
       talkState[cid] = 0
     else
       count[cid] = getCount(msg)
       selfSay("" .. count[cid] * 100 .. " platinum into " .. count[cid] .. " crystal, correct?", cid)
       talkState[cid] = 20
     end
   elseif talkState[cid] == 20 then
     if msgcontains(msg, 'yes') then
       if doPlayerRemoveItem(cid, 2152, count[cid] * 100) then
         selfSay("Here you are.", cid)
         doPlayerAddItem(cid, 2160, count[cid])
       else
         selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
       end
     else
       selfSay("Then why you even asked! <gives you an evil look>", cid)
     end
     talkState[cid] = 0
   elseif msgcontains(msg, 'change crystal') then
     selfSay("How many crystal coins would you like to change into platinum?", cid)
     talkState[cid] = 21
   elseif talkState[cid] == 21 then
     if getCount(msg) == -1 or getCount(msg) == 0 then
       selfSay("Then why you even asked! <gives you an evil look>", cid)
       talkState[cid] = 0
     else
       count[cid] = getCount(msg)
       selfSay("" .. count[cid] .. " crystal into " .. count[cid] * 100 .. " platinum, correct?", cid)
       talkState[cid] = 22
     end
   elseif talkState[cid] == 22 then
     if msgcontains(msg, 'yes') then
       if doPlayerRemoveItem(cid, 2160, count[cid])  then
         selfSay("Here you are.", cid)
         doPlayerAddItem(cid, 2152, count[cid] * 100)
       else
         selfSay("No, No! No think me stupid in math! <gives you an evil look>", cid)
       end
     else
       selfSay("Then why you even asked! <gives you an evil look>", cid)
     end
     talkState[cid] = 0
   elseif msgcontains(msg, 'change') then
     selfSay("Different coin types, gold, platinum, crystal. 100 equeals 1 next value. To change tell change with value.", cid)
     talkState[cid] = 0
   end
   return true
end
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())