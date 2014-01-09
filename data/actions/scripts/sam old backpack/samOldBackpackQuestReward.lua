function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2236) then
		if(getPlayerStorageValue(cid, 330) == 2) then
			setPlayerStorageValue(cid, 330, 3)
			doPlayerAddItem(cid, 2503, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a dwarven armor.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end