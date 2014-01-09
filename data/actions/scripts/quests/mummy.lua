local config = {
        storage = 9185,
        key_id = 1987 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if (getPlayerStorageValue(cid, config.storage) < 1) then
        	setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a bag.")
                key = doPlayerAddItem(cid, config.key_id, 1)
		doAddContainerItem(key, 2134, 1)
		doAddContainerItem(key, 2147, 2)
		doAddContainerItem(key, 2145, 3)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The wooden coffin is empty.")
        end
	return true
end