function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3003) then
		if(getPlayerStorageValue(cid, 90) == 27) then
			setPlayerStorageValue(cid, 90, 28)
			doPlayerAddItem(cid, 4858, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a funeral urn.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end