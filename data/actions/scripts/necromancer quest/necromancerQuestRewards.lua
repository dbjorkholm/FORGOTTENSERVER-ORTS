function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2226) then
		if(getPlayerStorageValue(cid, 321) < 1) then
			setPlayerStorageValue(cid, 321, 1)
			bag = doPlayerAddItem(cid, 1987, 1)
			doAddContainerItem(bag.uid, 2536, 1)
			doAddContainerItem(bag.uid, 2436, 1)
			doAddContainerItem(bag.uid, 2656, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a bag.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end