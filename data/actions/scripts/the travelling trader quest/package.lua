function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Rashid.MissionStart + 1) == 3 then
		player:setStorageValue(Rashid.MissionStart + 1, 4)
		player:addItem(7503, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy package.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
