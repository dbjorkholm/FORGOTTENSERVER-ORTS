function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2280) then
		if(getPlayerStorageValue(cid, 360) < 1) then
			setPlayerStorageValue(cid, 360, 1)
			doPlayerAddItem(cid, 3956, 2)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found two elephant tusks.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end