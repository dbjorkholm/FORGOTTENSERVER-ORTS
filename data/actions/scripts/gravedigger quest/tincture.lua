function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9963) == 1) and (getPlayerStorageValue(cid, 9964) < 1) then
		if(itemEx.aid == 4635) then
			setPlayerStorageValue(cid,9964,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You crash the vial and spill the blood tincture. This altar is anointed.')
			doRemoveItem(item.uid)
		end
	end
	return true
end