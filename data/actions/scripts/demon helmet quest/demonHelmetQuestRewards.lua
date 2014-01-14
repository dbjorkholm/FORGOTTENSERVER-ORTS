function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(Player(cid):getStorageValue(2217) < 1) then
                Player(cid):addExperience(250000, true, true)
                Player(cid):setStorageValue(2217, 1)
                if(Player(cid):getSex() == 0) then
                        Player(cid):addOutfitAddon(cid,542,1)
                else
                        Player(cid):addOutfitAddon(cid,541,1)
                end
        end
        if(item.uid == 2212) then
                if(Player(cid):getStorageValue(306) < 1) then
                        Player(cid):setStorageValue(306, 1)
                        Player(cid):addItem(2520, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a demon shield.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 2213) then
                if(Player(cid):getStorageValue(305) < 1) then
                        Player(cid):setStorageValue(305, 1)
                        Player(cid):addItem(2493, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a demon helmet.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 2214) then
                if(Player(cid):getStorageValue(304) < 1) then
                        Player(cid):setStorageValue(304, 1)
                        Player(cid):addItem(2645, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a steel boots.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
