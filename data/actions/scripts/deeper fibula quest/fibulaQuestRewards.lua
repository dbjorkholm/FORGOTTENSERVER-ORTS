function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2228) then
		if(getPlayerStorageValue(cid, 323) < 1) then
			setPlayerStorageValue(cid, 323, 1)
			doPlayerAddItem(cid, 2520, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a tower shield.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2229) then
		if(getPlayerStorageValue(cid, 324) < 1) then
			setPlayerStorageValue(cid, 324, 1)
			doPlayerAddItem(cid, 2493, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a elven amulet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2230) then
		if(getPlayerStorageValue(cid, 325) < 1) then
			setPlayerStorageValue(cid, 325, 1)
			doPlayerAddItem(cid, 2427, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a knight axe.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2231) then
		if(getPlayerStorageValue(cid, 325) < 1) then
			setPlayerStorageValue(cid, 325, 1)
			doPlayerAddItem(cid, 2427, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a dwarven ring.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2232) then
		if(getPlayerStorageValue(cid, 326) < 1) then
			setPlayerStorageValue(cid, 326, 1)
			key = doPlayerAddItem(cid, 2091, 1)
			doItemSetAttribute(key.uid, "aid", 3980)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a key.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end