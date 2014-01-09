function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(item.actionid == 8000) then
		if(getPlayerStorageValue(cid, 1015) == 1) then
			setPlayerStorageValue(cid, 1015, 2)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found the passage through the mountains and can report about your success.")
		end
	end
	return true
end