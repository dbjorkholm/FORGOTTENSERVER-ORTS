function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(90) == 33 then
		player:setStorageValue(90, 34)
		player:addItem(15389, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a strange powder.")
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
	end
	return true
end
