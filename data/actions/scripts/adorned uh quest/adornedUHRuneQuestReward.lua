function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2240) then
                if(Player(cid):getStorageValue(335) < 1) then
                        Player(cid):setStorageValue(335, 1)
                        Player(cid):addItem(12559, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a silver rune emblem.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
