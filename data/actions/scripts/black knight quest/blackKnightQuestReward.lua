function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
        if(item.uid == 9055) then
                if(player:getStorageValue(490) < 1) then
                        player:setStorageValue(490, 1)
                        player:addItem(2519, 1)
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a crown shield.")
                else
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 3027) then
                if(player:getStorageValue(491) < 1) then
                        player:setStorageValue(491, 1)
                        player:addItem(2488, 1)
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found crown legs.")
                else
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
				end
        return true
end
