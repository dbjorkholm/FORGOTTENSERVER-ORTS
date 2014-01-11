function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 9939) == 1) and (getPlayerStorageValue(cid, 9940) < 1) then
		setPlayerStorageValue(cid,9940,1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You have found an incantation fragment.')
		doPlayerAddItem(cid,21250,1)
		end
	return true
	end