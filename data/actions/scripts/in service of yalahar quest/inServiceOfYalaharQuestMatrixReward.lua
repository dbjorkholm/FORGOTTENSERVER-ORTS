function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3084) then
		if(getPlayerStorageValue(cid, 678) < 1) then
			setPlayerStorageValue(cid, 678, 1)
			doPlayerAddItem(cid, 9744, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a matrix.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3085) then
		if(getPlayerStorageValue(cid, 678) < 1) then
			setPlayerStorageValue(cid, 678, 1)
			doPlayerAddItem(cid, 9743, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a matrix.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end