function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2236) then
                if(Player(cid):getStorageValue(330) == 2) then
                        Player(cid):setStorageValue(330, 3)
                        Player(cid):addItem(2503, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a dwarven armor.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
