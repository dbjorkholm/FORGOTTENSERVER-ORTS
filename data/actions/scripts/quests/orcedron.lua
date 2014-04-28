function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tile = Tile(Position({ x = 33171 , y = 31897 , z = 8}))
	if item.itemid == 1945 then
		if tile:getItemById(1285) then
			tile:getItemById(1285):remove()
			Item(item.uid):transform(1946)
		else
			Game.createItem(1285, 1, { x = 33171 , y = 31897 , z = 8})
		end
	else
		Game.createItem(1285, 1, { x = 33171 , y = 31897 , z = 8})
		Item(item.uid):transform(1945)
	end
	return true
end