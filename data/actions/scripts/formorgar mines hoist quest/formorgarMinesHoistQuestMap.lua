function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3057) then
		if(getPlayerStorageValue(cid, 471) < 1) then
			setPlayerStorageValue(cid, 471, 1)
			doPlayerAddItem(cid, 1954, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a part of hoist instruction.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3058) then
		if(getPlayerStorageValue(cid, 470) < 1) then
			setPlayerStorageValue(cid, 470, 1)
			doPlayerAddItem(cid, 1954, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a part of hoist instruction.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end