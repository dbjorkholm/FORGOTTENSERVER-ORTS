function onAddItem(moveitem, tileitem, position)
	if tileitem.actionid > 0 or tileitem.uid > 0 then
		Item(moveitem.uid):remove()
		Position(moveitem.uid):sendMagicEffect(CONST_ME_POFF)
	end
end