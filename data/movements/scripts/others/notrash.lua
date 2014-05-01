function onAddItem(moveitem, tileitem, position)
	Item(moveitem.uid):remove()
	position:sendMagicEffect(CONST_ME_POFF)
end