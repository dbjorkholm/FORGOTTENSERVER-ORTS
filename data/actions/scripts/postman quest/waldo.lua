function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

	if player:getStorageValue(Storage.postman.Mission08) == 1 then
		player:setStorageValue(Storage.postman.Mission08, 2)
		player:addItem(2332, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a post horn.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
