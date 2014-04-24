function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4637 then
		local player = Player(cid)
		if player:getStorageValue(9967) == 1 and player:getStorageValue(9968) < 1 then
			player:setStorageValue(9968, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The flame wavers as it engulfs the chalk. Strange ashes appear beside it.')
			Game.createItem(21446, 1, Position({x = 32983, y = 32376, z = 11}))
			Item(item.uid):remove(1)
		end
	end
	return true
end