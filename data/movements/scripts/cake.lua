function onAddItem(moveitem, tileitem, position)
	if moveitem.itemid == 2048 then
		Item(moveitem.uid):remove(1)
		Item(tileitem.uid):transform(6280)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	end
	return TRUE
end