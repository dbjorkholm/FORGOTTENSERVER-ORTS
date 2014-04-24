function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4639 then
		local player = Player(cid)
		if player:getStorageValue(9971) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<swoosh> <oomph> <cough, cough>')
			Item(item.uid):remove(1)
			Tile(Position({x = 33071, y = 32442, z = 11})):getItemById(9624):transform(9625)
		end
	end
	return true
end