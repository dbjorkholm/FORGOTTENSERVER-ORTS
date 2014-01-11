function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9954) == 1) and (getPlayerStorageValue(cid, 9955) < 1) then
		if(itemEx.aid == 4632) then
			setPlayerStorageValue(cid,9955,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'The dragon tears glow and disappear. The old powers are appeased.')
			doRemoveItem(item.uid,3)
		end
	end
	return true
end