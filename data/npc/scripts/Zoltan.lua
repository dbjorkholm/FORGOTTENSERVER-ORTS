local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end

-- Storage IDs --     
mage        = 22005 
summoner    = 22011   

newaddon    = 'I bow to you, player, and hereby grant you the right to wear Ferumbras hat as accessory. Congratulations!'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the first addon, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'
 
-- MAGE START --   
function MageSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,mage+1)
    if addon == -1 then
        if getPlayerSex(cid) == 0 then
        if getPlayerItemCount(cid,5903) >= 1 then
        if doPlayerRemoveItem(cid,5903,1) then
            selfSay(newaddon, cid)
             
            doSendMagicEffect(getCreaturePosition(cid), 13) 
            doPlayerAddOutfit(cid, 141, 2)
            setPlayerStorageValue(cid,summoner+1,1)
        end
        else
            selfSay(noitems, cid)
        end
        elseif getPlayerSex(cid) == 1 then
        if getPlayerItemCount(cid,5903) >= 1 then
        if doPlayerRemoveItem(cid,5903,1) then
            selfSay(newaddon, cid)
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
            doPlayerAddOutfit(cid, 130, 2)
            setPlayerStorageValue(cid,mage+1,1)
        end
        else
            selfSay(noitems, cid)
        end
        end
    else
        selfSay(already, cid)
    end
    end

end
-- MAGE END --

node5 = keywordHandler:addKeyword({'proof'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = '... I cannot believe my eyes. You retrieved this hat from Ferumbras remains? That is incredible. If you give it to me, I will grant you the right to wear this hat as addon. What do you say?'})
    node5:addChildKeyword({'yes'}, MageSecond, {})
    node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true}) 



npcHandler:addModule(FocusModule:new()))
