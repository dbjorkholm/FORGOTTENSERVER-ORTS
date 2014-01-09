function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3009) then
		if(getPlayerStorageValue(cid, 90) == 36) then
			setPlayerStorageValue(cid, 90, 37)
			doPlayerAddItem(cid, 4855, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found an elven poetry book.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end