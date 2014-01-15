function onSay(cid, words, param)
        local cost = getBlessingsCost(getPlayerLevel(cid))
        if(not(isPlayerPzLocked(cid))) then
                if(Player(cid):hasBlessing(1) and Player(cid):hasBlessing(2) and Player(cid):hasBlessing(3) and Player(cid):hasBlessing(4) and Player(cid):hasBlessing(5)) then
                        Player(cid):sendCancelMessage("You have already been blessed by the gods.")
                        return false
                end
                if(Player(cid):removeMoney(cost)) then
                        for b = 1,5 do
                            Player(cid):addBlessing(b)
                        end
                        Position(Player:getPosition()):sendMagicEffect(CONST_ME_HOLYAREA)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed by the 5 gods!")
                else
                        Player(cid):sendCancelMessage("You need "..cost.." gold coins to buy all 5 bless.")
                end
        else
                Player(cid):sendCancelMessage("You can't buy bless, when you are in a battle.")
        end
        return false
end
