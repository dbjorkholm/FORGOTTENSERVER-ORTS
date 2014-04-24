function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4638 then
		local player = Player(cid)
		if player:getStorageValue(9968) == 1 and player:getStorageValue(9969) < 1 then
			player:setStorageValue(9969,1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The ashes swirl with a life of their own, mixing with the sparks of the altar.')
			Item(item.uid):remove(1)
		end
	end
	return true
end