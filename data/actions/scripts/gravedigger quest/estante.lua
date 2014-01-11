function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9945) == 1) and (getPlayerStorageValue(cid, 9946) < 1) then
		setPlayerStorageValue(cid,9946,1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You have found a crumpled paper.')
		doPlayerAddItem(cid,21474,1)
		end
	return true
	end