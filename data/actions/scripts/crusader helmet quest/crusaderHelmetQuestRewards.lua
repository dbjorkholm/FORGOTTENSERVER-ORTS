function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2233) then
		if(getPlayerStorageValue(cid, 328) < 1) then
			setPlayerStorageValue(cid, 328, 1)
			doPlayerAddItem(cid, 2497, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a crusader helmet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end