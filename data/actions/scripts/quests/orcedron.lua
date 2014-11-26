local stonePosition = Position(33171, 31897, 8)
local relocatePosition = Position(33171, 31898, 8)

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local tile = Tile(Position(33171, 31897, 8))
	if item.itemid == 1945 then
		local stoneItem = tile:getItemById(1285)
		if stoneItem then
			stoneItem:remove()
			Item(item.uid):transform(1946)
		end
	else
		tile:relocateTo(relocatePosition, true)
		Game.createItem(1285, 1, stonePosition)
		Item(item.uid):transform(1945)
	end
	return true
end