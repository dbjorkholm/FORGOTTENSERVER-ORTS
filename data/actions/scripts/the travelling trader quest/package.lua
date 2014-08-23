function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3020) then
		if(getPlayerStorageValue(cid, Rashid.MissionStart + 1) == 3) then
			setPlayerStorageValue(cid, Rashid.MissionStart + 1, 4)
			doPlayerAddItem(cid, 7503, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy package.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end
	return true
end
