local cost = 50000

function onSay(cid, words, param)
        if(not(Player(cid):isPzLocked())) then
                if(Player(cid):removeMoney(cost)) then
                        Player(cid):addItem(2173, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You have bought amulet of loss!")        
                else
                        Player(cid):sendCancelMessage("You need "..cost.." gold coins to buy amulet of loss.")
                end
        else
                Player(cid):sendCancelMessage("You can't buy amulet of loss, when you are in a battle.")
        end
        return false
end
