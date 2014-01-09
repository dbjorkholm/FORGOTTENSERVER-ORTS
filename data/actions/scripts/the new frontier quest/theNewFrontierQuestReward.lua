function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 10013) < 1) then
		doPlayerAddExp(cid, 50000, true, true)
		setPlayerStorageValue(cid, 10013, 1)
	end
	if(item.uid == 3158) then
		if(getPlayerStorageValue(cid, 1030) < 1) then
			setPlayerStorageValue(cid, 1030, 1)
			doPlayerAddItem(cid, 2114, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a piggy bank.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3159) then
		if(getPlayerStorageValue(cid, 1031) < 1) then
			setPlayerStorageValue(cid, 1031, 1)
			doPlayerAddItem(cid, 9971, 2)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found 2 gold ingots.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3160) then
		if(getPlayerStorageValue(cid, 1032) < 1) then
			setPlayerStorageValue(cid, 1032, 1)
			doPlayerAddItem(cid, 7443, 1)
			doPlayerAddItem(cid, 7440, 1)
			doPlayerAddItem(cid, 7439, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found some potions.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end