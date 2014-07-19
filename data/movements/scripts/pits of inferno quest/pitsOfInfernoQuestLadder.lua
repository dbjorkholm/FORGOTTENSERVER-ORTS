function onStepIn(cid, item, position, fromPosition)
	Game.createItem(5543, 1, Position(32854, 32321, 11))
	return true
end

function onStepOut(cid, item)
	Tile(Position(32854, 32321, 11)):getItemById(5543):remove(1)
	return true
end