function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2281) then
		if(getPlayerStorageValue(cid, 361) < 1) then
			setPlayerStorageValue(cid, 361, 1)
			doPlayerAddItem(cid, 4873, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found an explorer's brooch.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end