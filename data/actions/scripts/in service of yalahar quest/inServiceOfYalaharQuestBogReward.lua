function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3080) then
		if(getPlayerStorageValue(cid, 651) < 1) then
			setPlayerStorageValue(cid, 651, 1)
			doPlayerAddItem(cid, 9733, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found an alchemist formula.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end