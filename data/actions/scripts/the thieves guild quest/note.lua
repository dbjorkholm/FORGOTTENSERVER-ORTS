local notePos = Position(32598, 32381, 10)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.actionid == 12509 then
		if player:getStorageValue(Storage.thievesGuild.Mission08) == 1 then
			player:removeItem(8701, 1)
			Game.createItem(8700, 1, notePos)
			player:setStorageValue(Storage.thievesGuild.Mission08, 2)
			addEvent(Tile(notePos):getItemId(8700):remove(), 5 * 60 * 1000)
		end
	else
		return false
	end
	return true
end
