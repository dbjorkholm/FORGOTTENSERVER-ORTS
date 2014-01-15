function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2227) then
                if(Player(cid):getStorageValue(322) < 1) then
                        Player(cid):setStorageValue(322, 1)
                        Player(cid):addItem(2168, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a life ring.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
