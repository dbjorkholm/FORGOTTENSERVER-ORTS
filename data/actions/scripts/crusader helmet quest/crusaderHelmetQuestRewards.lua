function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(328) < 1 then
		player:setStorageValue(328, 1)
		player:addItem(2497, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a crusader helmet.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
