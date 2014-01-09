function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 2217) < 1) then
		doPlayerAddExp(cid, 250000, true, true)
		setPlayerStorageValue(cid, 2217, 1)
		if (getSex == 0) then
			doPlayerAddOutfit(cid,542,1)
		else
			doPlayerAddOutfit(cid,541,1)
		end
	end
	if(item.uid == 2212) then
		if(getPlayerStorageValue(cid, 306) < 1) then
			setPlayerStorageValue(cid, 306, 1)
			doPlayerAddItem(cid, 2520, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a demon shield.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2213) then
		if(getPlayerStorageValue(cid, 305) < 1) then
			setPlayerStorageValue(cid, 305, 1)
			doPlayerAddItem(cid, 2493, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a demon helmet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 2214) then
		if(getPlayerStorageValue(cid, 304) < 1) then
			setPlayerStorageValue(cid, 304, 1)
			doPlayerAddItem(cid, 2645, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a steel boots.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end