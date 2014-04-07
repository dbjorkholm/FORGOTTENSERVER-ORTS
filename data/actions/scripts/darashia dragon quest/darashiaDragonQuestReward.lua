function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(322) < 1 then
		player:setStorageValue(322, 1)
		player:addItem(2168, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a life ring.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
