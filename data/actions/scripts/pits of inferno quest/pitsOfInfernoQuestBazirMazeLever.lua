function onUse(cid, item, fromPosition, itemEx, toPosition)
	local portal = Tile(Position(32816, 32345, 13)):getItemById(1387)
	if not portal then
		doCreateTeleport(1387, Position(32767, 32366, 15), Position(32816, 32345, 13))
	else
		portal:remove()
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
