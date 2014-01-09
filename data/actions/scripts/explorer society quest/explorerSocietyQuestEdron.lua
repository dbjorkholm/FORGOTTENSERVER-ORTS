function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3012) then
		if(getPlayerStorageValue(cid, 90) == 39) then
			setPlayerStorageValue(cid, 90, 40)
			doPlayerAddItem(cid, 4852, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a memory stone.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end