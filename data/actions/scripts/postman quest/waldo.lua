function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(Storage.postman.Mission08) == 1 then
		player:setStorageValue(Storage.postman.Mission08, 2)
		player:addItem(2332, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a post horn.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
