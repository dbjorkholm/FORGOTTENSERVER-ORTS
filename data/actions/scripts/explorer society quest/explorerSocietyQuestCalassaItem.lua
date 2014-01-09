function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3114) then
		if(getPlayerStorageValue(cid, 90) == 63) then
			setPlayerStorageValue(cid, 90, 64)
			doPlayerAddItem(cid, 6124, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a damaged logbook.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end