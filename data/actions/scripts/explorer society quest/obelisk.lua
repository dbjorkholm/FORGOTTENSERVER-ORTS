function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3010) then
		if(getPlayerStorageValue(cid, 90) == 42) then
			setPlayerStorageValue(cid, 90, 43)
			doPlayerAddItem(cid, 4853, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sheet of tracing paper.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end
	return true
end
