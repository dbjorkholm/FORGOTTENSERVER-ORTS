function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4634 then
		local player = Player(cid)
		if player:getStorageValue(9959) == 1 and player:getStorageValue(9960) < 1 then
			player:setStorageValue(9960, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The flames roar and eat the bone hungrily. The Dark Lord is satisfied with your gift')
			Item(item.uid):remove()
		end
	end
	return true
end