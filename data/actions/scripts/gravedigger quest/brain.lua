function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(9998) == 1 and player:getStorageValue(9999) < 1 then
		if player:getItemCount(10576) >= 2 then
			player:setStorageValue(9999, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<brzzl> <frzzp> <fsssh>')
			player:addItem(21395, 1)
			player:removeItem(10576, 2)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'No brains')
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You\'ve already got your brain')
	end
	return true
end