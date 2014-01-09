function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3005) then
		if(getPlayerStorageValue(cid, 90) == 30) then
			setPlayerStorageValue(cid, 90, 31)
			doPlayerAddItem(cid, 4857, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a wrinkled parchment.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end