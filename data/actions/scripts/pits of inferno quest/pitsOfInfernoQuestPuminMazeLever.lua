function onUse(cid, item, fromPosition, itemEx, toPosition)
	local portal = Tile(Position(32816, 32345, 13)):getItemById(1387)
	if portal ~= 1387 then
		local portal = Game.createItem(1387, 1, Position(32816, 32345, 13))
		portal:setActionId() -- Is it possible to set destination here instead of using a different script?
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end
