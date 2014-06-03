local config = {
	[2693] = 2689,
	[6277] = 6278
}

function onAddItem(moveitem, tileitem, position)
	local targetItem = Item(moveitem.uid)
	local table = config[moveitem.itemid]
	if table then
		targetItem:transform(table)
		position:sendMagicEffect(CONST_ME_HITBYFIRE)
	end
	return TRUE
end