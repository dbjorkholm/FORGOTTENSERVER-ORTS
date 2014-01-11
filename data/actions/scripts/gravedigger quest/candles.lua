function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9971) == 1) and (getPlayerStorageValue(cid, 9972) < 1) then
		if(itemEx.aid == 4640) then
			setPlayerStorageValue(cid,9972,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Reading the parchment, you identify three human tallow candles and pocket them.')
			doRemoveItem(item.uid,1)
			doPlayerAddItem(cid,21248,3)
		end
	end
	return true
end