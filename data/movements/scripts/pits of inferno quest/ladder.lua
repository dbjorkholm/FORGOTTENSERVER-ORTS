local ladderPosition = Position(32854, 32321, 11)

function onStepIn(cid, item, position, fromPosition)
	if not Player(cid) then
		return true
	end

	local ladderItem = Tile(ladderPosition):getItemById(5543)
	if not ladderItem then
		Game.createItem(5543, 1, ladderPosition)
	end
	return true
end

function onStepOut(cid, item)
	if not Player(cid) then
		return true
	end

	local ladderItem = Tile(ladderPosition):getItemById(5543)
	if ladderItem then
		ladderItem:remove()
	end
	return true
end