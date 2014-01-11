function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9968) == 1) and (getPlayerStorageValue(cid, 9969) < 1) then
		if(itemEx.aid == 4638) then
			setPlayerStorageValue(cid,9969,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The ashes swirl with a life of their own, mixing with the sparks of the altar.')
			doRemoveItem(item.uid,1)
		end
	end
	return true
end