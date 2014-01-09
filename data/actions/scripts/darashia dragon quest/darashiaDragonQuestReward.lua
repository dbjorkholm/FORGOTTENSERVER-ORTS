function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2227) then
		if(getPlayerStorageValue(cid, 322) < 1) then
			setPlayerStorageValue(cid, 322, 1)
			doPlayerAddItem(cid, 2168, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a life ring.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end