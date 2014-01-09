function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2224) then
		if(getPlayerStorageValue(cid, 319) < 1) then
			setPlayerStorageValue(cid, 319, 1)
			bag = doPlayerAddItem(cid, 1987, 1)
			doAddContainerItem(bag.uid, 2432, 1)
			doAddContainerItem(bag.uid, 2214, 1)
			doAddContainerItem(bag.uid, 2201, 1)
			doAddContainerItem(bag.uid, 2145, 7)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a bag.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end