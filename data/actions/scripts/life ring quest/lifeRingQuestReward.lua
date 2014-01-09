function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2237) then
		if(getPlayerStorageValue(cid, 332) < 1) then
			setPlayerStorageValue(cid, 332, 1)
			bag = doPlayerAddItem(cid, 1987, 1)
			doAddContainerItem(bag.uid, 2201, 1)
			doAddContainerItem(bag.uid, 2168, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a bag.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end