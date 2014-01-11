function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9951) == 1) and (getPlayerStorageValue(cid, 9952) < 1) then
		if(itemEx.itemid == 2817) then
			setPlayerStorageValue(cid,9952,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Done! Report back to Omrabas.')
			doRemoveItem(item.uid)
			doPlayerAddItem(cid,21403,1)
		end
	end
	return true
end