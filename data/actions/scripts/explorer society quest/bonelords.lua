function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(90) == 30 then
		player:setStorageValue(90, 31)
		player:addItem(4857, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a wrinkled parchment.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
