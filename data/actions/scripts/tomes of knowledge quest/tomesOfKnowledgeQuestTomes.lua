function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, item.uid) < 1) then
			setPlayerStorageValue(cid, item.uid, 1)
			doPlayerAddItem(cid, 11134, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a tome of knowledge.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	return true
end