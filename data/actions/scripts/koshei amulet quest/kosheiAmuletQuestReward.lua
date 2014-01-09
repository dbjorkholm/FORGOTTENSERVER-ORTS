function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3067) then
		if(getPlayerStorageValue(cid, 388) < 1) then
			setPlayerStorageValue(cid, 388, 1)
			doPlayerAddItem(cid, 7730, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found blue legs.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3068) then
		if(getPlayerStorageValue(cid, 389) < 1) then
			setPlayerStorageValue(cid, 389, 1)
			doPlayerAddMoney(cid, 5000)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found 5000 gold pieces.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end