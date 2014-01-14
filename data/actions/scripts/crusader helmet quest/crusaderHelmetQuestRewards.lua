function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2233) then
                if(Player(cid):getStorageValue(328) < 1) then
                        Player(cid):setStorageValue(328, 1)
                        Player(cid):addItem(2497, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a crusader helmet.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
