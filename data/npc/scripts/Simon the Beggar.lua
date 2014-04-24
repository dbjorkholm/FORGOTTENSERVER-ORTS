local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

obeggar        = 22028
fbeggar        = 22029
sbeggar        = 22030
pssimon        = 60134

newaddon    = 'Ah, right! The beggar beard or beggar dress! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'

function SimonBeggarStaffStorage(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerStorageValue(cid,pssimon) == -1 then
        setPlayerStorageValue(cid,pssimon, 1)
			npcHandler:say('Good! Come back to me once you have retrieved my staff. Good luck.', cid)
    else
        npcHandler:say('I alrealy give you information about mine staff.')

    end

end


function BeggarFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys

    if isPremium(cid) then
    if getPlayerStorageValue(cid,fbeggar) == -1 then
        if getPlayerItemCount(cid,5883) >= 100 and player_money >= 20000 then
        if doPlayerRemoveItem(cid,5883,100) and doPlayerRemoveMoney(cid,20000) then
            npcHandler:say('Ah, right! The beggar beard or beggar dress! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fbeggar,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 153, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 157, 1)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function BeggarSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    if getPlayerStorageValue(cid,sbeggar) == -1 then	
        if getPlayerItemCount(cid,6107) >= 1 then
        if doPlayerRemoveItem(cid,6107,1) then
            npcHandler:say('Ah, right! The Beggar Staff! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sbeggar,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 153, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 157, 2)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function key(cid, message, keywords, parameters, node)
   if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys
	
         if player_money >= 800 then
        if doPlayerRemoveMoney(cid,800) then
            npcHandler:say('Here, take the key!', cid)
            local playerID = getPlayerGUID(cid)
                 local item = doPlayerAddItem(cid, 2087, 1)
             doSetItemActionId(item, 3940)
        end
        else
            npcHandler:say('You don\'t have enough money for the key!', cid)
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