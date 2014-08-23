function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3009) then
		if(getPlayerStorageValue(cid, 90) == 36) then
			setPlayerStorageValue(cid, 90, 37)
			doPlayerAddItem(cid, 4855, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found an elven poetry book.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end
	return true
end
