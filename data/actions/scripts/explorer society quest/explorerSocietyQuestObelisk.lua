function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3010) then
		if(getPlayerStorageValue(cid, 90) == 42) then
			setPlayerStorageValue(cid, 90, 43)
			doPlayerAddItem(cid, 4853, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a sheet of tracing paper.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end