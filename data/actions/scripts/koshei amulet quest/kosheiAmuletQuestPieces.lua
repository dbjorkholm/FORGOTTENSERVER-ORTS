function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3062) then
		if(getPlayerStorageValue(cid, 475) < 1) then
			setPlayerStorageValue(cid, 475, 1)
			doPlayerAddItem(cid, 8262, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3063) then
		if(getPlayerStorageValue(cid, 476) < 1) then
			setPlayerStorageValue(cid, 476, 1)
			doPlayerAddItem(cid, 8263, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3064) then
		if(getPlayerStorageValue(cid, 477) < 1) then
			setPlayerStorageValue(cid, 477, 1)
			doPlayerAddItem(cid, 8264, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3065) then
		if(getPlayerStorageValue(cid, 478) < 1) then
			setPlayerStorageValue(cid, 478, 1)
			doPlayerAddItem(cid, 8265, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a piece of an amulet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end