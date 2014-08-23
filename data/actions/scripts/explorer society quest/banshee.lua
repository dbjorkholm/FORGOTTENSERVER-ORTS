function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3014) then
		if(getPlayerStorageValue(cid, 90) == 49) then
			setPlayerStorageValue(cid, 90, 50)
			doPlayerAddItem(cid, 4847, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a spectral dress.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end
	return true
end
