function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3164) then
		if(getPlayerStorageValue(cid, 1050) == 9) then
			setPlayerStorageValue(cid, 1050, 10)
			doPlayerAddItem(cid, 10760, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a flask of poison.")
		elseif(getPlayerStorageValue(cid, 1050) == 15) then
			setPlayerStorageValue(cid, 1050, 16)
			doPlayerAddItem(cid, 11106, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a flask of extra greasy oil.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end