function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2240) then
		if(getPlayerStorageValue(cid, 335) < 1) then
			setPlayerStorageValue(cid, 335, 1)
			doPlayerAddItem(cid, 12559, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a silver rune emblem.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end