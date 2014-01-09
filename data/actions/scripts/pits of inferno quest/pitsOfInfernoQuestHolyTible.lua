function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2021) then
		if(getPlayerStorageValue(cid, 231) < 1) then
			setPlayerStorageValue(cid, 231, 1)
			doPlayerAddItem(cid, 1970, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a holy tible.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end