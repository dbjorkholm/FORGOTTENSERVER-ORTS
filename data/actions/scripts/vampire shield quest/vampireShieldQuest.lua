function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2209) then
                if(Player(cid):getStorageValue(301) < 1) then
                        Player(cid):setStorageValue(301, 1)
                        Player(cid):addItem(2534, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a vampire shield.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 2210) then
                if(Player(cid):getStorageValue(302) < 1) then
                        Player(cid):setStorageValue(302, 1)
                        Player(cid):addItem(2414, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a dragon lance.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 2211) then
                if(Player(cid):getStorageValue(303) < 1) then
                        Player(cid):setStorageValue(303, 1)
                        bag = Player(cid):addItem(1987, 1)
			Container(bag.uid):addItemEx(2194, 1)
			Container(bag.uid):addItemEx(2144, 8)
			Container(bag.uid):addItemEx(2174, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a bag.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
