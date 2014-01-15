function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(Player(cid):getStorageValue(10011) < 1) then
		Player(cid):addExperience(1000, true, true)
                Player(cid):setStorageValue(10011, 1)
        end
        if(item.uid == 9055) then
                if(Player(cid):getStorageValue(490) < 1) then
                        Player(cid):setStorageValue(490, 1)
                        Player(cid):addItem(2519, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a crown shield.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 3027) then
                if(Player(cid):getStorageValue(491) < 1) then
                        Player(cid):setStorageValue(491, 1)
                        Player(cid):addItem(2488, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found crown legs.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 3030) then
                if(Player(cid):getStorageValue(492) < 1) then
                        Player(cid):setStorageValue(492, 1)
                        Player(cid):addItem(2392, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a fire sword.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
