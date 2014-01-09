function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2282) then
		if(getPlayerStorageValue(cid, 362) < 1) then
			setPlayerStorageValue(cid, 362, 1)
			doPlayerAddItem(cid, 2368, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a fanfare.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2283) then
		if(getPlayerStorageValue(cid, 363) < 1) then
			setPlayerStorageValue(cid, 363, 1)
			key = doPlayerAddItem(cid, 2092, 1)
			doItemSetAttribute(key.uid, "aid", 3520)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a key.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end