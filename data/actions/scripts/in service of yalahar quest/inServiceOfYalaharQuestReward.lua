function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 10012) < 1) then
		doPlayerAddExp(cid, 250000, true, true)
		setPlayerStorageValue(cid, 10012, 1)
	end
	if(item.uid == 3088) then
		if(getPlayerStorageValue(cid, 30) == 53) then
			setPlayerStorageValue(cid, 30, 54)
			doPlayerAddItem(cid, 9776, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a yalahari armor.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3089) then
		if(getPlayerStorageValue(cid, 30) == 53) then
			setPlayerStorageValue(cid, 30, 54)
			doPlayerAddItem(cid, 9778, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a yalahari mask.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3090) then
		if(getPlayerStorageValue(cid, 30) == 53) then
			setPlayerStorageValue(cid, 30, 54)
			doPlayerAddItem(cid, 9777, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a yalahari leg piece.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end