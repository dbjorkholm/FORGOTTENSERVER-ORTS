function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 10011) < 1) then
		doPlayerAddExp(cid, 1000, true, true)
		setPlayerStorageValue(cid, 10011, 1)
	end
	if(item.uid == 9055) then
		if(getPlayerStorageValue(cid, 490) < 1) then
			setPlayerStorageValue(cid, 490, 1)
			doPlayerAddItem(cid, 2519, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a crown shield.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3027) then
		if(getPlayerStorageValue(cid, 491) < 1) then
			setPlayerStorageValue(cid, 491, 1)
			doPlayerAddItem(cid, 2488, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found crown legs.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3030) then
		if(getPlayerStorageValue(cid, 492) < 1) then
			setPlayerStorageValue(cid, 492, 1)
			doPlayerAddItem(cid, 2392, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a fire sword.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end