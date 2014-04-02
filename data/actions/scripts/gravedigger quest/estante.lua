function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(9945) == 1 and player:getStorageValue(9946) < 1 then
		player:setStorageValue(9946, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a crumpled paper.')
		player:addItem(21474, 1)
	end
	return true
end