function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2225) then
		if(getPlayerStorageValue(cid, 320) < 1) then
			setPlayerStorageValue(cid, 320, 1)
			doPlayerAddItem(cid, 4850, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a hydra egg.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end