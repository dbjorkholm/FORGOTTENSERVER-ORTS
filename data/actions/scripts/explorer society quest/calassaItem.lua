function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(90) == 63 then
		player:setStorageValue(90, 64)
		player:addItem(6124, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a damaged logbook.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
