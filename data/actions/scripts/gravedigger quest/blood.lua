function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9978) == 1) and (getPlayerStorageValue(cid, 9979) < 1) then
		if(itemEx.aid == 4644) then
			setPlayerStorageValue(cid,9979,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The blood in the vial is of a deep, ruby red.')
			doRemoveItem(item.uid,1)
			doPlayerAddItem(cid,21418,1)
		end
	end
	if (getPlayerStorageValue(cid, 9979) == 1) and (getPlayerStorageValue(cid, 9980) < 1) then
		if(itemEx.aid == 4645) then
			setPlayerStorageValue(cid,9980,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The blood in the vial is of a strange colour, as if tainted.')
			doRemoveItem(item.uid,1)
			doPlayerAddItem(cid,21419,1)
		end
	end
	return true
end