function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid == 1945 then
		local stonePosition = Position(32849, 32282, 10)
		local stoneItem = Tile(stonePosition):getItemById(1304)
		if stoneItem then
			stoneItem:remove()
			stonePosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
			Item(item.uid):transform(1946)
		end
	end
	return true
end