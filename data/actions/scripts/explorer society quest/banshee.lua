function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(90) == 49 then
		player:setStorageValue(90, 50)
		player:addItem(4847, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a spectral dress.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
