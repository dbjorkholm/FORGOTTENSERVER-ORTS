local config = {
        storage = 9185,
        bag_id = 1987 -- bag ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
        if player:getStorageValue(config.storage) < 1 then
		player:setStorageValue(config.storage, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a bag.")
		local bag = player:addItem(config.bag_id, 1)
		bag:addItem(2134, 1)
		bag:addItem(2147, 2)
		bag:addItem(2145, 3)		
        else
                player:sendTextMessage(MESSAGE_INFO_DESCR, "The wooden coffin is empty.")
        end
	return true
end