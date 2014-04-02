function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(9948) == 1 and player:getStorageValue(9949) < 1 then
		local tile = Tile(Position({x = 33071, y = 32442, z = 11}))
		if tile:getItemById(21476) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The scroll burns to dust. The magic stutters. Omrabas\' soul flees to his old hideaway.')
			player:removeItem(21251, 1)
			player:setStorageValue(9949, 1)
			tile:getItemById(21476):remove()
			Game.createItem("Chicken", Position({x = 33015, y = 32418, z = 11}))
		end
	end
	return true
end