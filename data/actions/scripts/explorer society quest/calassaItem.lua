function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3114) then
		if(getPlayerStorageValue(cid, 90) == 63) then
			setPlayerStorageValue(cid, 90, 64)
			doPlayerAddItem(cid, 6124, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a damaged logbook.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end
	return true
end
