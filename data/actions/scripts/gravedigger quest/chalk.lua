function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4637 then
		local player = Player(cid)
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission27) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission28) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission28, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The flame wavers as it engulfs the chalk. Strange ashes appear beside it.')
			Game.createItem(21446, 1, Position(32983, 32376, 11))
			Item(item.uid):remove(1)
		end
	end
	return true
end