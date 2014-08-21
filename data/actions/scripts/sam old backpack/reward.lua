function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(330) == 2 then
		player:setStorageValue(330, 3)
		player:addItem(2503, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a dwarven armor.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
