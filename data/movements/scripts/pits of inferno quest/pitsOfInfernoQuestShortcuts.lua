function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 8816) then
		if(getPlayerStorageValue(cid, 8816) < 1) then
			setPlayerStorageValue(cid, 8816, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You discovered a shortcut to the pits of inferno.")
		end
	elseif(item.actionid == 8817) then
		if(getPlayerStorageValue(cid, 8817) < 1) then
			setPlayerStorageValue(cid, 8817, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You discovered a shortcut to the pits of inferno.")
		end
	end
	return true
end