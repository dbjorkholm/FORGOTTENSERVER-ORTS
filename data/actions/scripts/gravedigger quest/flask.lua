function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 2817 then
		local player = Player(cid)
		if player:getStorageValue(9951) == 1 and player:getStorageValue(9952) < 1 then
			player:setStorageValue(9952, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Done! Report back to Omrabas.')
			player:addItem(21403, 1)
			Item(item.uid):remove()
		end
	end
	return true
end