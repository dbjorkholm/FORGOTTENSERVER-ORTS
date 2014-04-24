function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2282) then
                if(Player(cid):getStorageValue(362) < 1) then
                        Player(cid):setStorageValue(362, 1)
                        Player(cid):addItem(2368, 1)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a fanfare.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 2283) then
                if(Player(cid):getStorageValue(363) < 1) then
                        Player(cid):setStorageValue(363, 1)
                        key = Player(cid):addItem(2092, 1)
						Item(uid):setAttribute(key.uid, "aid", 3520)
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You've found a key.")
                else
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
