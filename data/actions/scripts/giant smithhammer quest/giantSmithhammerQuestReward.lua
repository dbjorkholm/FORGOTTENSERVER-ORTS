function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2239) then
		if(getPlayerStorageValue(cid, 334) < 1) then
			setPlayerStorageValue(cid, 334, 1)
			doPlayerAddItem(cid, 2321, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a giant smithhammer.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2238) then
		if(getPlayerStorageValue(cid, 333) < 1) then
			setPlayerStorageValue(cid, 333, 1)
			bag = doPlayerAddItem(cid, 1987, 1)
			doAddContainerItem(bag.uid, 2151, 1)
			doAddContainerItem(bag.uid, 2148, 100)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a bag.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end