function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(GreenDjinn.MissionStart + 2) == 1 then
		player:setStorageValue(GreenDjinn.MissionStart + 2, 2)
		player:addItem(2346, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a tear of daraman.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
