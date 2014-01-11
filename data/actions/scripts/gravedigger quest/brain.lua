function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9998) == 1) and (getPlayerStorageValue(cid, 9999) < 1) then
		if getPlayerItemCount(cid,10576) >= 2 then
			setPlayerStorageValue(cid,9999,1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '<brzzl> <frzzp> <fsssh>')
			doPlayerRemoveItem(cid,10576,2)
			doPlayerAddItem(cid,21395,1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'No brains')
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You\'ve already got your brain')
	end
	return true
end