function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3014) then
		if(getPlayerStorageValue(cid, 90) == 49) then
			setPlayerStorageValue(cid, 90, 50)
			doPlayerAddItem(cid, 4847, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a spectral dress.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end