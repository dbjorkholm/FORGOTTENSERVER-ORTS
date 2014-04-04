function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 8000) then
		if(getPlayerStorageValue(cid, 1006) < 1) then
			setPlayerStorageValue(cid, 1006, 1)
			doPlayerAddItem(cid, 5940, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found Ceiron's Wolf Tooth Chain.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end