local demonPositions = {
	Position(33060, 31623, 15),
	Position(33066, 31623, 15),
	Position(33060, 31627, 15),
	Position(33066, 31627, 15)
}

function onRemoveItem(item, tile, position)
	local targetItem = Item(item.uid)
	if not targetItem then
		return true
	end

	Game.createItem(item.itemid, 1, targetItem:getPosition())
	targetItem:remove()

	for i = 1, #demonPositions do
		Game.createMonster('Demon', demonPositions[i])
	end
	return true
end
