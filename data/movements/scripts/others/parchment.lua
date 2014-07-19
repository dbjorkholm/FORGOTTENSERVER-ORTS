local demonPos = {
	Position(33060, 31623, 15),
	Position(33066, 31623, 15),
	Position(33060, 31627, 15),
	Position(33066, 31627, 15)
}

function onRemoveItem(item, tile, position)
	local targetItem = Item(item.uid)
	if targetItem:getPosition():getDistance(position) > 0 then
		targetItem:setActionId(0) --any better solution?
		for i = 1, #demonPos do
			Game.createMonster("Demon", demonPos[i])
		end
	end
	return true
end

