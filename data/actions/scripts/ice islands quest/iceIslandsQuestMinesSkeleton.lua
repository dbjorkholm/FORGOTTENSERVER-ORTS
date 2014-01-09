function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3112) then
		if(getPlayerStorageValue(cid, 121) == 35) then
			setPlayerStorageValue(cid, 121, 36)
			doPlayerAddItem(cid, 1954, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a paper.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end