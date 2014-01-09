function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2209) then
		if(getPlayerStorageValue(cid, 301) < 1) then
			setPlayerStorageValue(cid, 301, 1)
			doPlayerAddItem(cid, 2534, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a vampire shield.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2210) then
		if(getPlayerStorageValue(cid, 302) < 1) then
			setPlayerStorageValue(cid, 302, 1)
			doPlayerAddItem(cid, 2414, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a dragon lance.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2211) then
		if(getPlayerStorageValue(cid, 303) < 1) then
			setPlayerStorageValue(cid, 303, 1)
			bag = doPlayerAddItem(cid, 1987, 1)
			doAddContainerItem(bag.uid, 2194, 1)
			doAddContainerItem(bag.uid, 2144, 8)
			doAddContainerItem(bag.uid, 2174, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a bag.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end