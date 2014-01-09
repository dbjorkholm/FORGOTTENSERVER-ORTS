function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3118) then
		if(getPlayerStorageValue(cid, 250) == 35) then
			setPlayerStorageValue(cid, 250, 36)
			doPlayerAddItem(cid, 2332, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a post horn.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end