local tree = {
	Position(32857, 32231, 11),
	Position(32857, 32232, 11),
	Position(32857, 32233, 11)
}

function onAddItem(moveitem, tileitem, position)
	if tileitem.uid == 2244 and moveitem.itemid == 6300 then
		Item(moveitem.uid):remove(1)
		for i = 1, #tree do
			if Tile(tree[i]):getItemById(2722) then
				Tile(tree[i]):getItemById(2722):remove(1)
				tree[i]:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
		end
	end
	return true
end
