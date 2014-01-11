function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9967) == 1) and (getPlayerStorageValue(cid, 9968) < 1) then
		if(itemEx.aid == 4637) then
			setPlayerStorageValue(cid,9968,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The flame wavers as it engulfs the chalk. Strange ashes appear beside it.')
			doRemoveItem(item.uid,1)
			doCreateItem(21446,1,{x = 32983, y = 32376, z = 11})
		end
	end
	return true
end