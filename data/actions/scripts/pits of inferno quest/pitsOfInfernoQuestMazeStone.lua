function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1946 then
		return false
	end
	
	toPosition.x = toPosition.x - 1
	toPosition.y = toPosition.y + 1
	
	local stone = Tile(toPosition):getItemById(1304)
	if stone then
		stone:remove()
	end
	
	Item(item.uid):transform(1946)
	return true
end