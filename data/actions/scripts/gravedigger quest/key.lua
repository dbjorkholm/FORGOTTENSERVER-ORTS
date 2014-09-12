function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4639 then
		local player = Player(cid)
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission31) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<swoosh> <oomph> <cough, cough>')
			Item(item.uid):remove(1)
			Tile(Position(33071, 32442, 11)):getItemById(9624):transform(9625)
		end
	end
	return true
end