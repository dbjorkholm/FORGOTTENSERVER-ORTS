function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.TravellingTrader.secondMission) == 3 then
		player:setStorageValue(Storage.TravellingTrader.secondMission, 4)
		player:addItem(7503, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a heavy package.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
