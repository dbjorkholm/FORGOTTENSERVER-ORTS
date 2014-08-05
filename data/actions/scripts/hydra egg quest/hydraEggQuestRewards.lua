function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(320) ~= 1 then
		player:setStorageValue(320, 1)
		player:addItem(4850, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a hydra egg.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The nest is empty.')
	end
	return true
end
