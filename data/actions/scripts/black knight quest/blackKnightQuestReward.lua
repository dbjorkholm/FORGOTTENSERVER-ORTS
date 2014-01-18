function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
        if(player:getStorageValue(10011) < 1) then
		player:addExperience(1000, true, true)
                player:setStorageValue(10011, 1)
        end
        if(item.uid == 9055) then
                if(player:getStorageValue(490) < 1) then
                        player:setStorageValue(490, 1)
                        player:addItem(2519, 1)
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a crown shield.")
                else
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 3027) then
                if(player:getStorageValue(491) < 1) then
                        player:setStorageValue(491, 1)
                        player:addItem(2488, 1)
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found crown legs.")
                else
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        elseif(item.uid == 3030) then
                if(player:getStorageValue(492) < 1) then
                        player:setStorageValue(492, 1)
                        player:addItem(2392, 1)
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a fire sword.")
                else
                        player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
                end
        end
        return true
end
