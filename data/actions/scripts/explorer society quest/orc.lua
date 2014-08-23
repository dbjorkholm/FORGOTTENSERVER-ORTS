function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3007) then
		if(getPlayerStorageValue(cid, 90) == 33) then
			setPlayerStorageValue(cid, 90, 34)
			doPlayerAddItem(cid, 15389, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a strange powder.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	end
	return true
end
