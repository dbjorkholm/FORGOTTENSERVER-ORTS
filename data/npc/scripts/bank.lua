local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local transaction = {}
local transfer = {}
local transfer_name = {}
 
function onCreatureAppear(cid)
        npcHandler:onCreatureAppear(cid)                      
end
function onCreatureDisappear(cid)
        npcHandler:onCreatureDisappear(cid)                    
end
function onCreatureSay(cid, type, msg)
        npcHandler:onCreatureSay(cid, type, msg)              
end
function onThink()
        npcHandler:onThink()                                  
end
 
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
        local function getMoneyCount(s)
                local b, e = s:find("%d+")
                return b and e and tonumber(s:sub(b, e)) or -1
        end
       
        local function doPlayerAddSafeMoney(cid, money)
                moneyAdd = money
                freeCap = getPlayerFreeCap(cid)
                crystalCoins = money >= 10000 and money / 10000 or 0
                money = money - crystalCoins * 10000
                platinumCoins = money >= 100 and money / 100 or 0
                money = money - platinumCoins * 100
                goldCoins = money
                if(freeCap >= (crystalCoins * 0.1 + platinumCoins * 0.1 + goldCoins * 0.1) and doPlayerAddMoney(cid, moneyAdd)) then
                        return true    
                else
                        return false
                end
        end
       
        -- Check Balance
        if(msgcontains(msg, "balance")) then
                balance = getPlayerBalance(cid)
                if(balance > 100000 and balance < 1000000) then
                        msg = "You certainly have made a pretty penny. "
                elseif(balance > 1000000 and balance < 10000000) then
                        msg = "Wow, you have reached the magic number of a million gp!!! "
                elseif(balance > 10000000) then
                        msg = "I think you must be one of the richest inhabitants of Tibia! "
                elseif (balance < 100000) then
                        msg = ""
                end
                npcHandler:say(msg .. "Your account balance is " .. balance .. " gold.", cid)
       
        -- Deposit All
        elseif(msg == "deposit all") then
                if(getPlayerMoney(cid) > 0) then
                        npcHandler:say("Do you really want to deposit " .. getPlayerMoney(cid) .. " to your bank account?", cid)
                        transaction[talkUser] = getPlayerMoney(cid)
                        talkState[talkUser] = 1
                else
                        npcHandler:say("You don't have any money with you.", cid)
                        transaction[talkUser] = 0
                        talkState[talkUser] = 0
                end
               
        -- Withdraw Money
        elseif(msgcontains(msg, "withdraw")) then
                npcHandler:say("How much money would you like to withdraw from your bank account?", cid)
                talkState[talkUser] = 2
        elseif(talkState[talkUser] == 2) then
                if tonumber(msg) == nil then
                        npcHandler:say("Please tell me a {number} you want to withdraw.", cid)
                        talkState[talkUser] = 2
                        return true
                end
                if(tonumber(msg) > 0 and getMoneyCount(msg) <= getPlayerBalance(cid)) then
                        npcHandler:say("Would you like to withdraw " .. getMoneyCount(msg) .. " gold from your bank account?", cid)
                        transaction[talkUser] = getMoneyCount(msg)
                        talkState[talkUser] = 3
                  elseif (tonumber(msg) < 1) then
                           npcHandler:say("Sure, you want nothing you get nothing!", cid)
                           talkState[talkUser] = 0
                elseif(getMoneyCount(msg) < 1) then
                        npcHandler:say("How much money would you like to withdraw from your bank account?", cid)
                elseif(getMoneyCount(msg) > getPlayerBalance(cid)) then
                        npcHandler:say("You don't have enought money on your bank account.", cid)
                        talkState[talkUser] = 0
                end
               
        -- Deposit Money
        elseif(msgcontains(msg, "deposit")) then
                npcHandler:say("How much money would you like to deposit to your bank account?", cid)
              talkState[talkUser] = 4
        elseif(talkState[talkUser] == 4) then
                if tonumber(msg) == nil then
                        npcHandler:say("Please tell me a {number} you want to deposit.", cid)
                        talkState[talkUser] = 4
                        return true
                end
                if(tonumber(msg) > 0 and getMoneyCount(msg) <= getPlayerMoney(cid)) then
                        npcHandler:say("Would you like to deposit " .. getMoneyCount(msg) .. " gold to your bank account?", cid)
                        transaction[talkUser] = getMoneyCount(msg)
                        talkState[talkUser] = 5
                  elseif(tonumber(msg) < 1) then
                           npcHandler:say("You are joking, aren't you??", cid)
                           talkState[talkUser] = 0
                elseif(getMoneyCount(msg) < 1) then
                        npcHandler:say("How much money would you like to deposit to your bank account?", cid)
                elseif(getMoneyCount(msg) > getPlayerMoney(cid)) then
                        npcHandler:say("You don't have enought money with you.", cid)
                        talkState[talkUser] = 0
                end
               
        -- Transfer Money
        elseif(msgcontains(msg, "transfer")) then
                npcHandler:say("Who do you want transfer money to?", cid)
                talkState[talkUser] = 6
        elseif(talkState[talkUser] == 6) then
                if(getPlayerGUIDByName(string.lower(msg)) > 0 and string.lower(msg) ~= string.lower(getCreatureName(cid))) then
                        transfer[talkUser] = getPlayerGUIDByName(string.lower(msg))
                        transfer_name[talkUser] = string.lower(msg)
                        npcHandler:say("How much money would you like to transfer?", cid)
                        talkState[talkUser] = 7
                else
                        npcHandler:say("There is no such player.", cid)
                        talkState[talkUser] = 0
                end
        elseif(talkState[talkUser] == 7) then
                if tonumber(msg) == nil then
                        npcHandler:say("Please tell me a {number} you want to transfer.", cid)
                        talkState[talkUser] = 7
                        return true
                end
                if(tonumber(msg) > 0 and getMoneyCount(msg) <= getPlayerBalance(cid)) then
                        npcHandler:say("Would you like to transfer " .. getMoneyCount(msg) .. " to " .. transfer_name[talkUser] .. "?", cid)
                        transaction[talkUser] = getMoneyCount(msg)
                        talkState[talkUser] = 8
                elseif(tonumber(msg) < 1) then
                        npcHandler:say("Please think about it. Okay?", cid)
                        talkState[talkUser] = 0
                elseif(getMoneyCount(msg) < 0) then
                        npcHandler:say("How much money would you like to transfer?", cid)
                elseif(getMoneyCount(msg) > getPlayerMoney(cid)) then
                        npcHandler:say("You don't have enought money on your bank account.", cid)
                        talkState[talkUser] = 0
                end
               
        -- Yes
        elseif(msgcontains(msg, "yes")) then  
                if(talkState[talkUser] == 1) then
                        if(getPlayerMoney(cid) == transaction[talkUser]) then
                                doPlayerRemoveMoney(cid, transaction[talkUser])
                                doPlayerSetBalance(cid, getPlayerBalance(cid)+ transaction[talkUser])
                                npcHandler:say("You deposited " .. transaction[talkUser] .. " gold coins to your bank account.", cid)
                                transaction[talkUser] = 0
                                talkState[talkUser] = 0
                        else
                                npcHandler:say("You don't have enought money.", cid)
                                transaction[talkUser] = 0
                                talkState[talkUser] = 1
                        end
                elseif(talkState[talkUser] == 3) then
                        if(doPlayerAddSafeMoney(cid, transaction[talkUser])) then
                                doPlayerSetBalance(cid, getPlayerBalance(cid)- transaction[talkUser])
                                npcHandler:say("You withdrawed " .. transaction[talkUser] .. " gold coins from your bank account.", cid)
                        else
                                npcHandler:say("You don't have anought capacity or slots in backpack to withdraw " .. transaction[talkUser] .. " gold.", cid)
                        end
                        transaction[talkUser] = 0
                        talkState[talkUser] = 0
                elseif(talkState[talkUser] == 5) then
                        if(transaction[talkUser] <= getPlayerMoney(cid)) then
                                doPlayerRemoveMoney(cid, transaction[talkUser])
                                doPlayerSetBalance(cid, getPlayerBalance(cid)+ transaction[talkUser])
                                npcHandler:say("You deposited " .. transaction[talkUser] .. " gold coins to your bank account.", cid)
                                transaction[talkUser] = 0
                                talkState[talkUser] = 0
                        else
                                npcHandler:say("You don't have enought money.", cid)
                                transaction[talkUser] = 0
                                talkState[talkUser] = 1
                        end
                elseif(talkState[talkUser] == 8) then
                        if(transaction[talkUser] <= getPlayerMoney(cid)) then
                                doPlayerRemoveMoney(cid, transaction[talkUser])
                                doPlayerSetBalance(cid, getPlayerBalance(cid)- transaction[talkUser])
                                npcHandler:say("You transfered " .. transaction[talkUser] .. " gold coins to " .. transfer_name[talkUser] .. "'s bank account.", cid)
                                    if(getPlayerByName(""..transfer_name[talkUser].."")) then
                                        doPlayerSetBalance(getPlayerByName(""..transfer_name[talkUser]..""), getPlayerBalance(getPlayerByName(""..transfer_name[talkUser].."")) + transaction[talkUser])
                                    else
                                        transferGold(""..transfer_name[talkUser].."", transaction[talkUser])
                                    end
                                transaction[talkUser] = 0
                                transfer[talkUser] = 0
                                transfer_name[talkUser] = ""
                                talkState[talkUser] = 0
                        else
                                npcHandler:say("You don't have enought money.", cid)
                                transaction[talkUser] = 0
                                talkState[talkUser] = 1
                        end
                end  
        elseif(msgcontains(msg, "no")) then
                npcHandler:say("The customer is king! Come back anytime you want to if you wish to withdraw your money.", cid)
                talkState[talkUser] = 0
        end
        return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())