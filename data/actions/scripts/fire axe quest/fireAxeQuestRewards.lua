function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2224) then
                if(Player(cid):getStorageValue(319) < 1) then
                        Player(cid):setStorageValue(319, 1)
                        bag = Player(cid):addItem(1987, 1)
                        Container(bag.uid):addItemEx(2432, 1)
                        Container(bag.uid):addItemEx(2214, 1)
                        Container(bag.uid):addItemEx(2201, 1)
                        Container(bag.uid):addItemEx(2145, 7)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a bag.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
