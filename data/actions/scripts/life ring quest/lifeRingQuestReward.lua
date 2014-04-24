function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2237) then
                if(Player(cid):getStorageValue(332) < 1) then
                        Player(cid):setStorageValue(332, 1)
                        bag = Player(cid):addItem(1987, 1)
                        Container(bag.uid):addItemEx(bag.uid, 2201, 1)
                        Container(bag.uid):addItemEx(2168, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a bag.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
