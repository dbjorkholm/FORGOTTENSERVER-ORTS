local wallPositions = {
	Position(32186, 31626, 8),
	Position(32187, 31626, 8),
	Position(32188, 31626, 8),
	Position(32189, 31626, 8)
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local wallItem
	for _, wallPosition in pairs(wallPositions) do
		wallItem = Tile(wallPosition):getItemById(1498)
		if wallItem then
			wallItem:remove()
			wallPosition:sendMagicEffect(CONST_ME_POFF)
		end
	end

	Item(item.uid):remove()
	return true
end