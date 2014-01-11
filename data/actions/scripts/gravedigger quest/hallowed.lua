function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9959) == 1) and (getPlayerStorageValue(cid, 9960) < 1) then
		if(itemEx.aid == 4634) then
			setPlayerStorageValue(cid,9960,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The flames roar and eat the bone hungrily. The Dark Lord is satisfied with your gift')
			doRemoveItem(item.uid)
		end
	end
	return true
end